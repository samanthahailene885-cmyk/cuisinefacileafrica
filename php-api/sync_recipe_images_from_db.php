<?php

declare(strict_types=1);

require_once __DIR__ . '/api/_bootstrap.php';

$pdo = db();

$argvRaw = $argv ?? [];
$shouldForce = in_array('--force', $argvRaw, true);
$dryRun = in_array('--dry-run', $argvRaw, true) || in_array('--dryrun', $argvRaw, true);
$keepRemote = in_array('--keep-remote', $argvRaw, true) || in_array('--keepremote', $argvRaw, true);

$limit = null;
foreach ($argvRaw as $arg) {
  if (preg_match('/^--limit=(\d+)$/', (string)$arg, $m)) {
    $limit = max(0, (int)$m[1]);
  }
}

$destDir = dirname(__DIR__) . DIRECTORY_SEPARATOR . 'public' . DIRECTORY_SEPARATOR . 'recipes';
if (!is_dir($destDir)) {
  fwrite(STDERR, "Missing folder: {$destDir}\n");
  exit(1);
}

$download = static function (string $url): array {
  $url = trim($url);
  if ($url === '') return [false, null, 'empty url'];

  $ch = curl_init();
  curl_setopt_array($ch, [
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_MAXREDIRS => 5,
    CURLOPT_CONNECTTIMEOUT => 10,
    CURLOPT_TIMEOUT => 25,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => false,
    CURLOPT_USERAGENT => 'CuisineFacileImageSync/1.0',
  ]);

  $body = curl_exec($ch);
  $err = curl_error($ch);
  $code = (int)curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
  $ctype = (string)curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
  curl_close($ch);

  if ($body === false) {
    return [false, null, $err ?: 'curl error'];
  }
  if ($code < 200 || $code >= 300) {
    return [false, null, "HTTP {$code}"]; 
  }
  if (stripos($ctype, 'image/') === false) {
    // Some hosts return image content without content-type; accept if it looks like a JPEG/PNG/WebP
    $sig = substr($body, 0, 16);
    $looksImage = str_starts_with($sig, "\xFF\xD8\xFF") || str_starts_with($sig, "\x89PNG") || str_starts_with($sig, "RIFF") || str_starts_with($sig, "WEBP") || str_starts_with($sig, "GIF");
    if (!$looksImage) {
      return [false, null, "Not an image (content-type: {$ctype})"]; 
    }
  }

  return [true, $body, null];
};

$stmt = $pdo->query("SELECT id, image FROM recipes ORDER BY created_at DESC");
$rows = $stmt->fetchAll();
if ($limit !== null) {
  $rows = array_slice($rows, 0, $limit);
}

$stUpdate = $pdo->prepare('UPDATE recipes SET image = ? WHERE id = ?');

$total = 0;
$downloaded = 0;
$skipped = 0;
$failed = 0;

foreach ($rows as $r) {
  $total++;
  $id = (string)($r['id'] ?? '');
  $image = trim((string)($r['image'] ?? ''));

  if ($id === '') {
    $failed++;
    fwrite(STDERR, "[skip] missing id\n");
    continue;
  }

  $destPath = $destDir . DIRECTORY_SEPARATOR . $id . '.jpg';

  // If already local path, just ensure DB points to /recipes/<id>.jpg
  if ($image !== '' && (str_starts_with($image, '/recipes/') || str_contains($image, '/recipes/' . $id . '.jpg'))) {
    if (!$dryRun && !$keepRemote) {
      $stUpdate->execute(['/recipes/' . $id . '.jpg', $id]);
    }
    $skipped++;
    continue;
  }

  if (!$shouldForce && is_file($destPath) && filesize($destPath) > 1024) {
    if (!$dryRun && !$keepRemote) {
      $stUpdate->execute(['/recipes/' . $id . '.jpg', $id]);
    }
    $skipped++;
    continue;
  }

  // No URL to download -> keep existing and count fail
  if ($image === '') {
    $failed++;
    fwrite(STDERR, "[fail] {$id} empty image url\n");
    continue;
  }

  [$ok, $body, $err] = $download($image);
  if (!$ok || $body === null) {
    $failed++;
    fwrite(STDERR, "[fail] {$id} {$err} url={$image}\n");
    continue;
  }

  if (!$dryRun) {
    $tmp = $destPath . '.tmp';
    $w = file_put_contents($tmp, $body);
    if ($w === false || $w < 1024) {
      @unlink($tmp);
      $failed++;
      fwrite(STDERR, "[fail] {$id} failed to write image\n");
      continue;
    }
    @rename($tmp, $destPath);

    if (!$keepRemote) {
      $stUpdate->execute(['/recipes/' . $id . '.jpg', $id]);
    }
  }

  $downloaded++;
  echo "[ok] {$id} -> /recipes/{$id}.jpg\n";
}

echo "Done. total={$total} downloaded={$downloaded} skipped={$skipped} failed={$failed} dryRun=" . ($dryRun ? '1' : '0') . "\n";
