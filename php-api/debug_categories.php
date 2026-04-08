<?php

declare(strict_types=1);

require_once __DIR__ . '/api/_bootstrap.php';

$pdo = db();

$rows = $pdo->query("SELECT COALESCE(category,'') AS category, COUNT(*) AS c FROM recipes GROUP BY category ORDER BY c DESC")->fetchAll(PDO::FETCH_ASSOC);
foreach ($rows as $r) {
  $cat = (string)($r['category'] ?? '');
  if ($cat === '') $cat = '(empty)';
  echo $cat . "\t" . (string)($r['c'] ?? '') . "\n";
}

echo "\n--- Search titles ---\n";
$terms = [
  'LANGOUSTE AUX AGRUMES',
  'LANGOUSTE BRAISEE',
  'LANGOUSTE BRAISÉE',
  'SPAGHETTI AUX MOULES',
  'TISANE AU GINGEMBRE ET CITRON',
  'DU GATEAU AUX DATTES',
];

$st = $pdo->prepare('SELECT id, title, category, image FROM recipes WHERE UPPER(title) LIKE ? ORDER BY title');
foreach ($terms as $t) {
  $st->execute(['%' . mb_strtoupper($t, 'UTF-8') . '%']);
  $hits = $st->fetchAll(PDO::FETCH_ASSOC);
  echo "\n## {$t} (" . count($hits) . ")\n";
  foreach ($hits as $h) {
    echo (string)$h['id'] . "\t" . (string)$h['title'] . "\t" . (string)$h['category'] . "\t" . (string)$h['image'] . "\n";
  }
}
