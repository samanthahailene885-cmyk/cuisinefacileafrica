<?php

declare(strict_types=1);

require_once __DIR__ . '/api/_bootstrap.php';

$pdo = db();

$argvRaw = $argv ?? [];
$shouldReset = in_array('--reset', $argvRaw, true) || in_array('--truncate', $argvRaw, true);

if ($shouldReset) {
  $pdo->exec('SET FOREIGN_KEY_CHECKS = 0');
  $pdo->exec('TRUNCATE TABLE order_item_ingredients');
  $pdo->exec('TRUNCATE TABLE order_items');
  $pdo->exec('TRUNCATE TABLE orders');
  $pdo->exec('TRUNCATE TABLE carts');
  $pdo->exec('TRUNCATE TABLE preparation_steps');
  $pdo->exec('TRUNCATE TABLE ingredients');
  $pdo->exec('TRUNCATE TABLE recipes');
  $pdo->exec('SET FOREIGN_KEY_CHECKS = 1');
}

$path = dirname(__DIR__) . '/supabase/insert_all_recipes.sql';
if (!is_file($path)) {
  fwrite(STDERR, "Missing file: {$path}\n");
  exit(1);
}

$sql = file_get_contents($path);
if ($sql === false) {
  fwrite(STDERR, "Failed to read: {$path}\n");
  exit(1);
}

$DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800';

$pdo->beginTransaction();

$recipeRe = "/INSERT INTO recipes \(id, title, description, image, price, time, calories, category, tags\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(\d+(?:\.\d+)?)\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(ARRAY\[.*?\]::text\[\])\s*\n\s*\);/s";

$ingRe = "/INSERT INTO ingredients \(id, recipe_id, name, unit, quantity, price_per_unit\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'([^']+)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(\d+(?:\.\d+)?)\s*,\s*\n\s*(NULL|\d+(?:\.\d+)?)\s*\n\s*\);/s";

$stepRe = "/INSERT INTO preparation_steps \(id, recipe_id, step_number, description, duration\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'([^']+)'\s*,\s*\n\s*(\d+)\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(?:NULL|'(?:[^']|'')*')\s*\n\s*\);/s";

$unescape = static fn(string $s): string => str_replace("''", "'", $s);

$parsePgTextArray = static function (string $raw) use ($unescape): array {
  if (!preg_match('/ARRAY\[(.*)\]::text\[\]/s', $raw, $m)) return [];
  $inner = trim((string)$m[1]);
  if ($inner === '') return [];
  $items = [];
  if (preg_match_all("/'((?:[^']|'')*)'/", $inner, $mm)) {
    foreach ($mm[1] as $v) {
      $items[] = $unescape((string)$v);
    }
  }
  return $items;
};

$stRecipe = $pdo->prepare('INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), image=VALUES(image), price=VALUES(price), time=VALUES(time), calories=VALUES(calories), category=VALUES(category), tags=VALUES(tags)');
$stIng = $pdo->prepare('INSERT IGNORE INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (?, ?, ?, ?, ?, ?)');
$stStep = $pdo->prepare('INSERT IGNORE INTO preparation_steps (id, recipe_id, step_number, description) VALUES (?, ?, ?, ?)');

$recipeCount = 0;
if (preg_match_all($recipeRe, $sql, $m, PREG_SET_ORDER)) {
  foreach ($m as $rm) {
    $id = (string)$rm[1];
    $title = $unescape((string)$rm[2]);
    $desc = $unescape((string)$rm[3]);
    $image = "/recipes/{$id}.jpg";
    $price = (int)round((float)$rm[5]);
    $time = $unescape((string)$rm[6]);
    $calories = $unescape((string)$rm[7]);
    $category = $unescape((string)$rm[8]);
    $tags = $parsePgTextArray((string)$rm[9]);
    $tagsJson = json_encode($tags, JSON_UNESCAPED_UNICODE);
    $stRecipe->execute([$id, $title, $desc, $image, $price, $time, $calories, $category, $tagsJson]);
    $recipeCount++;
  }
}

$ingCount = 0;
if (preg_match_all($ingRe, $sql, $m, PREG_SET_ORDER)) {
  foreach ($m as $im) {
    $id = (string)$im[1];
    $recipeId = (string)$im[2];
    $name = $unescape((string)$im[3]);
    $unit = $unescape((string)$im[4]);
    $quantity = (float)$im[5];
    $ppu = (string)$im[6] === 'NULL' ? 0 : (int)round((float)$im[6]);
    $stIng->execute([$id, $recipeId, $name, $unit, $quantity, $ppu]);
    $ingCount++;
  }
}

$stepCount = 0;
if (preg_match_all($stepRe, $sql, $m, PREG_SET_ORDER)) {
  foreach ($m as $sm) {
    $id = (string)$sm[1];
    $recipeId = (string)$sm[2];
    $stepNumber = (int)$sm[3];
    $desc = $unescape((string)$sm[4]);
    $stStep->execute([$id, $recipeId, $stepNumber, $desc]);
    $stepCount++;
  }
}

$pdo->commit();

echo "Seed done. recipes={$recipeCount} ingredients={$ingCount} steps={$stepCount}\n";
