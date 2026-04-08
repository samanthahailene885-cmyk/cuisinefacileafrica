<?php

declare(strict_types=1);

require_once __DIR__ . '/api/_bootstrap.php';

$argvRaw = $argv ?? [];
$shouldApply = in_array('--apply', $argvRaw, true);
$overwriteDetails = in_array('--overwrite-details', $argvRaw, true) || in_array('--overwrite', $argvRaw, true);

const SITE_BASE = 'https://cuisinefacile.africa';

$categoryPages = [
  'Boissons' => SITE_BASE . '/menu/category/10/boissons',
  'Africaines' => SITE_BASE . '/menu/category/9/africaines',
  'Flexitariennes' => SITE_BASE . '/menu/category/8/flexitariennes',
  'Calories Smart' => SITE_BASE . '/menu/category/6/calories-smart',
  'Rapides' => SITE_BASE . '/menu/category/5/rapides',
  'Classiques' => SITE_BASE . '/menu/category/2/classiques',
];

$pdo = db();

$normalize = static function (string $s): string {
  $s = trim($s);
  if ($s === '') return '';
  $trans = @iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
  if ($trans !== false) $s = $trans;
  $s = mb_strtoupper($s, 'UTF-8');
  $s = preg_replace('/[^A-Z0-9]+/u', ' ', $s) ?? $s;
  $s = preg_replace('/\s+/u', ' ', $s) ?? $s;
  return trim($s);
};

$fetch = static function (string $url): string {
  $ctx = stream_context_create([
    'http' => [
      'method' => 'GET',
      'header' => "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)\r\nAccept: text/html,*/*\r\n",
      'timeout' => 25,
    ],
    'ssl' => [
      'verify_peer' => true,
      'verify_peer_name' => true,
    ],
  ]);

  $html = @file_get_contents($url, false, $ctx);
  if ($html === false) {
    $err = error_get_last();
    $msg = $err ? ($err['message'] ?? 'unknown error') : 'unknown error';
    throw new RuntimeException("Failed to fetch {$url}: {$msg}");
  }
  return $html;
};

$extractCards = static function (string $html) use ($normalize): array {
  $cards = [];

  $imgRe = '/<img\b[^>]*\balt\s*=\s*"([^"]+)"[^>]*\bsrc\s*=\s*"([^"]*uploads\/Datas[^"]*)"[^>]*>/is';
  if (!preg_match_all($imgRe, $html, $m, PREG_SET_ORDER)) {
    return $cards;
  }

  foreach ($m as $match) {
    $title = html_entity_decode((string)$match[1], ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $src = html_entity_decode((string)$match[2], ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $titleKey = $normalize($title);
    if ($titleKey === '') continue;

    $abs = $src;
    if (!preg_match('#^https?://#i', $abs)) {
      $abs = SITE_BASE . '/' . ltrim($abs, '/');
    }

    $pos = stripos($html, (string)$match[0]);
    $chunk = $pos === false ? '' : substr($html, $pos, 16000);

    $ingredients = [];
    if ($chunk !== '' && preg_match('/Ingr[ée]dients\s*:?\s*(?:<\/[^>]+>\s*)?(?:<ul[^>]*>(.*?)<\/ul>)?/is', $chunk, $mIng)) {
      $ul = (string)($mIng[1] ?? '');
      if ($ul !== '' && preg_match_all('/<li[^>]*>(.*?)<\/li>/is', $ul, $lis)) {
        foreach ($lis[1] as $li) {
          $txt = html_entity_decode(strip_tags((string)$li), ENT_QUOTES | ENT_HTML5, 'UTF-8');
          $txt = trim(preg_replace('/\s+/u', ' ', $txt) ?? $txt);
          if ($txt !== '') $ingredients[] = $txt;
        }
      }
    }

    $prep = '';
    if ($chunk !== '' && preg_match('/Mode\s+de\s+pr[ée]paration\s*:?\s*(.*?)(?:<\/div>|<\/p>|<\/section>)/is', $chunk, $mPrep)) {
      $prep = html_entity_decode(strip_tags((string)$mPrep[1]), ENT_QUOTES | ENT_HTML5, 'UTF-8');
      $prep = trim(preg_replace('/\s+/u', ' ', $prep) ?? $prep);
    }

    $cards[$titleKey] = [
      'title' => $title,
      'image' => $abs,
      'ingredients' => $ingredients,
      'preparation' => $prep,
    ];
  }

  return $cards;
};

$dbRows = $pdo->query('SELECT id, title, category, image FROM recipes')->fetchAll(PDO::FETCH_ASSOC);
$dbByTitle = [];
foreach ($dbRows as $r) {
  $k = $normalize((string)($r['title'] ?? ''));
  if ($k === '') continue;
  if (!isset($dbByTitle[$k])) $dbByTitle[$k] = [];
  $dbByTitle[$k][] = $r;
}

$stUpRecipe = $pdo->prepare('UPDATE recipes SET category = ?, image = ? WHERE id = ?');
$stDelIng = $pdo->prepare('DELETE FROM ingredients WHERE recipe_id = ?');
$stDelSteps = $pdo->prepare('DELETE FROM preparation_steps WHERE recipe_id = ?');
$stInsIng = $pdo->prepare('INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (?, ?, ?, ?, ?, ?)');
$stInsStep = $pdo->prepare('INSERT INTO preparation_steps (id, recipe_id, step_number, description) VALUES (?, ?, ?, ?)');

$makeId = static function (): string {
  $data = random_bytes(16);
  $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
  $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);
  return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
};

$totalFound = 0;
$totalMatched = 0;
$totalUpdated = 0;
$totalDetailsWritten = 0;
$totalUnmatched = 0;
$totalCollisions = 0;

$changes = [];

foreach ($categoryPages as $categoryName => $url) {
  fwrite(STDOUT, "Fetching {$categoryName}: {$url}\n");
  try {
    $html = $fetch($url);
  } catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . "\n");
    continue;
  }

  $cards = $extractCards($html);
  $totalFound += count($cards);

  foreach ($cards as $titleKey => $card) {
    if (!isset($dbByTitle[$titleKey])) {
      $totalUnmatched++;
      continue;
    }
    if (count($dbByTitle[$titleKey]) !== 1) {
      $totalCollisions++;
      continue;
    }

    $row = $dbByTitle[$titleKey][0];
    $id = (string)$row['id'];

    $totalMatched++;

    $changes[] = [
      'id' => $id,
      'title' => (string)$row['title'],
      'category' => $categoryName,
      'image' => (string)$card['image'],
      'ingredients' => $card['ingredients'],
      'preparation' => (string)$card['preparation'],
    ];
  }
}

fwrite(STDOUT, "\nSite cards found: {$totalFound}\n");
fwrite(STDOUT, "Matched recipes: {$totalMatched}\n");
fwrite(STDOUT, "Unmatched titles: {$totalUnmatched}\n");
fwrite(STDOUT, "Title collisions: {$totalCollisions}\n");
fwrite(STDOUT, "Mode: " . ($shouldApply ? 'APPLY' : 'DRY-RUN') . " overwriteDetails=" . ($overwriteDetails ? '1' : '0') . "\n\n");

if (!$shouldApply) {
  $i = 0;
  foreach ($changes as $c) {
    fwrite(STDOUT, $c['id'] . "\t" . $c['title'] . "\t" . $c['category'] . "\t" . $c['image'] . "\n");
    $i++;
    if ($i >= 40) break;
  }
  exit(0);
}

$pdo->beginTransaction();

foreach ($changes as $c) {
  $stUpRecipe->execute([$c['category'], $c['image'], $c['id']]);
  $totalUpdated += $stUpRecipe->rowCount() > 0 ? 1 : 0;

  if ($overwriteDetails) {
    $stDelIng->execute([$c['id']]);
    $stDelSteps->execute([$c['id']]);

    $idx = 0;
    foreach ($c['ingredients'] as $ingText) {
      $idx++;
      $stInsIng->execute([$makeId(), $c['id'], (string)$ingText, '', 0, null]);
    }

    $prep = trim((string)$c['preparation']);
    if ($prep !== '') {
      $parts = preg_split('/(?:\r\n|\r|\n)+/u', $prep) ?: [$prep];
      $stepNo = 0;
      foreach ($parts as $p) {
        $p = trim((string)$p);
        if ($p === '') continue;
        $stepNo++;
        $stInsStep->execute([$makeId(), $c['id'], $stepNo, $p]);
      }
    }

    $totalDetailsWritten++;
  }
}

$pdo->commit();

fwrite(STDOUT, "Updated recipes rows: {$totalUpdated}\n");
fwrite(STDOUT, "Details overwritten for recipes: {$totalDetailsWritten}\n");
