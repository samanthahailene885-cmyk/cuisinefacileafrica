<?php

declare(strict_types=1);

require_once __DIR__ . '/api/_bootstrap.php';

/**
 * Restore recipe images in local MySQL by scraping cuisinefacile.africa pages.
 *
 * Usage:
 *  php restore_images_from_cuisinefacile_africa.php           (dry-run)
 *  php restore_images_from_cuisinefacile_africa.php --apply   (write to DB)
 */

$argvRaw = $argv ?? [];
$shouldApply = in_array('--apply', $argvRaw, true);

const SITE_BASE = 'https://cuisinefacile.africa';

$pages = [
  SITE_BASE . '/menu/recettes',
  SITE_BASE . '/menu/category/6/calories-smart',
  SITE_BASE . '/menu/category/8/flexitariennes',
  SITE_BASE . '/menu/category/9/africaines',
  SITE_BASE . '/menu/category/10/boissons',
  SITE_BASE . '/menu/category/5/rapides',
  SITE_BASE . '/menu/category/2/classiques',
];

$pdo = db();

$stAll = $pdo->query('SELECT id, title, image FROM recipes');
$recipes = $stAll ? $stAll->fetchAll(PDO::FETCH_ASSOC) : [];

$normalize = static function (string $s): string {
  $s = trim($s);
  if ($s === '') return '';

  // Best-effort accent removal without extra extensions
  $trans = @iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
  if ($trans !== false) $s = $trans;

  $s = mb_strtoupper($s, 'UTF-8');
  $s = preg_replace('/[^A-Z0-9]+/u', ' ', $s) ?? $s;
  $s = preg_replace('/\s+/u', ' ', $s) ?? $s;
  return trim($s);
};

// Build DB title -> id mapping (handle collisions)
$dbByTitle = [];
foreach ($recipes as $r) {
  $key = $normalize((string)($r['title'] ?? ''));
  if ($key === '') continue;
  if (!isset($dbByTitle[$key])) $dbByTitle[$key] = [];
  $dbByTitle[$key][] = (string)$r['id'];
}

$fetch = static function (string $url): string {
  $ctx = stream_context_create([
    'http' => [
      'method' => 'GET',
      'header' => "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)\r\nAccept: text/html,*/*\r\n",
      'timeout' => 20,
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

$found = []; // normalized_title => image_url
$foundDetails = []; // normalized_title => ['ingredients'=>string[], 'preparation'=>string]

// Extract <img ... alt="TITLE" ... src="uploads/Datas/..."> and (best-effort) ingredients/preparation text found near it.
$extractFromHtml = static function (string $html) use ($normalize): array {
  $outImages = [];
  $outDetails = [];

  $re = '/<img\b([^>]*?)>/is';
  if (!preg_match_all($re, $html, $imgs, PREG_SET_ORDER)) {
    return [$outImages, $outDetails];
  }

  foreach ($imgs as $img) {
    $tag = (string)$img[0];
    if (stripos($tag, 'uploads/Datas') === false) continue;

    if (!preg_match('/\balt\s*=\s*"([^"]+)"/i', $tag, $mAlt)) continue;
    if (!preg_match('/\bsrc\s*=\s*"([^"]+)"/i', $tag, $mSrc)) continue;

    $title = html_entity_decode((string)$mAlt[1], ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $src = html_entity_decode((string)$mSrc[1], ENT_QUOTES | ENT_HTML5, 'UTF-8');
    if (stripos($src, 'uploads/Datas') === false) continue;

    $key = $normalize($title);
    if ($key === '') continue;

    $outImages[$key] = $src;

    // Best-effort: try to grab a chunk of HTML after this <img> tag to find ingredients / preparation.
    $pos = stripos($html, $tag);
    if ($pos === false) continue;
    $chunk = substr($html, $pos, 12000);

    $details = [
      'ingredients' => [],
      'preparation' => '',
    ];

    if (preg_match('/Ingr[ée]dients\s*:?\s*<\/[^>]+>\s*(?:<ul[^>]*>(.*?)<\/ul>)?/is', $chunk, $mIng)) {
      $ul = (string)($mIng[1] ?? '');
      if ($ul !== '' && preg_match_all('/<li[^>]*>(.*?)<\/li>/is', $ul, $lis)) {
        foreach ($lis[1] as $li) {
          $txt = html_entity_decode(strip_tags((string)$li), ENT_QUOTES | ENT_HTML5, 'UTF-8');
          $txt = trim(preg_replace('/\s+/u', ' ', $txt) ?? $txt);
          if ($txt !== '') $details['ingredients'][] = $txt;
        }
      }
    }

    if (preg_match('/Mode\s+de\s+pr[ée]paration\s*:?\s*(.*?)<\/[^>]+>/is', $chunk, $mPrep)) {
      $prep = html_entity_decode(strip_tags((string)$mPrep[1]), ENT_QUOTES | ENT_HTML5, 'UTF-8');
      $prep = trim(preg_replace('/\s+/u', ' ', $prep) ?? $prep);
      $details['preparation'] = $prep;
    }

    if ($details['ingredients'] !== [] || $details['preparation'] !== '') {
      $outDetails[$key] = $details;
    }
  }

  return [$outImages, $outDetails];
};

foreach ($pages as $page) {
  fwrite(STDOUT, "Fetching {$page}\n");
  try {
    $html = $fetch($page);
  } catch (Throwable $e) {
    fwrite(STDERR, $e->getMessage() . "\n");
    continue;
  }

  [$items, $details] = $extractFromHtml($html);
  foreach ($items as $k => $src) {
    $found[$k] = $src;
  }
  foreach ($details as $k => $d) {
    $foundDetails[$k] = $d;
  }
}

$resolved = []; // id => absolute_image_url
$collisions = 0;
$unmatched = 0;
foreach ($found as $titleKey => $src) {
  if (!isset($dbByTitle[$titleKey])) {
    $unmatched++;
    continue;
  }

  $ids = $dbByTitle[$titleKey];
  if (count($ids) !== 1) {
    $collisions++;
    continue;
  }

  $id = (string)$ids[0];
  $abs = $src;
  if (!preg_match('#^https?://#i', $abs)) {
    $abs = SITE_BASE . '/' . ltrim($abs, '/');
  }

  $resolved[$id] = $abs;
}

fwrite(STDOUT, "\nFound titles on site: " . count($found) . "\n");
fwrite(STDOUT, "Matched to DB ids: " . count($resolved) . "\n");
fwrite(STDOUT, "Unmatched titles (not in DB): {$unmatched}\n");
fwrite(STDOUT, "Title collisions (same title multiple ids): {$collisions}\n\n");

if (!$shouldApply) {
  fwrite(STDOUT, "Dry-run (no DB changes). Add --apply to update MySQL.\n");
  $i = 0;
  foreach ($resolved as $id => $url) {
    fwrite(STDOUT, "{$id} => {$url}\n");
    $title = '';
    foreach ($recipes as $r) {
      if ((string)$r['id'] === (string)$id) {
        $title = (string)($r['title'] ?? '');
        break;
      }
    }
    if ($title !== '') {
      $tKey = $normalize($title);
      if (isset($foundDetails[$tKey])) {
        $d = $foundDetails[$tKey];
        if (!empty($d['ingredients'])) {
          fwrite(STDOUT, "  Ingredients: " . implode(' | ', $d['ingredients']) . "\n");
        }
        if (!empty($d['preparation'])) {
          fwrite(STDOUT, "  Preparation: " . $d['preparation'] . "\n");
        }
      }
    }
    $i++;
    if ($i >= 25) break;
  }
  exit(0);
}

$pdo->beginTransaction();
$stUp = $pdo->prepare('UPDATE recipes SET image = ? WHERE id = ?');

$updated = 0;
foreach ($resolved as $id => $url) {
  $stUp->execute([$url, $id]);
  $updated += $stUp->rowCount() > 0 ? 1 : 0;
}

$pdo->commit();

fwrite(STDOUT, "Updated recipes.image rows: {$updated}\n");
