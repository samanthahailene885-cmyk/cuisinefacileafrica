<?php

declare(strict_types=1);

require_once __DIR__ . '/_bootstrap.php';

$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
$uri = $_SERVER['REQUEST_URI'] ?? '/';
$path = parse_url($uri, PHP_URL_PATH) ?: '/';

// normalize to path relative to /api
$base = rtrim(dirname($_SERVER['SCRIPT_NAME'] ?? '/api/index.php'), '/');
if ($base !== '' && str_starts_with($path, $base)) {
  $path = substr($path, strlen($base));
}
$path = '/' . ltrim($path, '/');

$handled = false;

require_once __DIR__ . '/routes/recipes.php';
require_once __DIR__ . '/routes/users.php';
require_once __DIR__ . '/routes/cart.php';
require_once __DIR__ . '/routes/orders.php';
require_once __DIR__ . '/routes/admin.php';

if (!$handled) {
  json_error('Not Found', 404);
}
