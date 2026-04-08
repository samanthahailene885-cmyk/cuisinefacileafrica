<?php

declare(strict_types=1);

ini_set('display_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL);

if (!ob_get_level()) {
  ob_start();
}

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-Admin-Email');

if (($_SERVER['REQUEST_METHOD'] ?? '') === 'OPTIONS') {
  http_response_code(204);
  exit;
}

set_exception_handler(function (Throwable $e): void {
  error_log((string)$e);
  if (ob_get_level()) {
    ob_clean();
  }
  http_response_code(500);
  echo json_encode(['ok' => false, 'error' => 'Server error'], JSON_UNESCAPED_UNICODE);
  exit;
});

set_error_handler(function (int $severity, string $message, string $file = '', int $line = 0): bool {
  if (!(error_reporting() & $severity)) {
    return false;
  }
  throw new ErrorException($message, 0, $severity, $file, $line);
});

register_shutdown_function(function (): void {
  $err = error_get_last();
  if (!$err) return;

  $fatalTypes = [E_ERROR, E_PARSE, E_CORE_ERROR, E_COMPILE_ERROR];
  if (!in_array((int)$err['type'], $fatalTypes, true)) return;

  error_log('Fatal error: ' . ($err['message'] ?? '') . ' in ' . ($err['file'] ?? '') . ':' . ($err['line'] ?? ''));

  if (ob_get_level()) {
    ob_clean();
  }
  http_response_code(500);
  echo json_encode(['ok' => false, 'error' => 'Server error'], JSON_UNESCAPED_UNICODE);
  exit;
});

function json_input(): array {
  $raw = file_get_contents('php://input');
  if ($raw === false || trim($raw) === '') return [];
  $data = json_decode($raw, true);
  if (!is_array($data)) {
    http_response_code(400);
    echo json_encode(['ok' => false, 'error' => 'Invalid JSON body']);
    exit;
  }
  return $data;
}

function json_ok($data): void {
  echo json_encode(['ok' => true, 'data' => $data], JSON_UNESCAPED_UNICODE);
  exit;
}

function json_error(string $message, int $code = 400): void {
  http_response_code($code);
  echo json_encode(['ok' => false, 'error' => $message], JSON_UNESCAPED_UNICODE);
  exit;
}

function env_any(array $keys, string $default = ''): string {
  foreach ($keys as $k) {
    $v = getenv((string)$k);
    if ($v !== false && $v !== null && $v !== '') return (string)$v;
  }
  return $default;
}

function load_dotenv_if_present(): void {
  static $loaded = false;
  if ($loaded) return;
  $loaded = true;

  $path = dirname(__DIR__) . DIRECTORY_SEPARATOR . '.env';
  if (!is_file($path)) return;

  $lines = @file($path, FILE_IGNORE_NEW_LINES);
  if ($lines === false) return;

  foreach ($lines as $line) {
    $line = trim($line);
    if ($line === '') continue;
    if (str_starts_with($line, '#')) continue;

    $pos = strpos($line, '=');
    if ($pos === false) continue;

    $key = trim(substr($line, 0, $pos));
    $val = trim(substr($line, $pos + 1));

    if ($key === '') continue;
    if ((str_starts_with($val, '"') && str_ends_with($val, '"')) || (str_starts_with($val, "'") && str_ends_with($val, "'"))) {
      $val = substr($val, 1, -1);
    }

    if (getenv($key) === false) {
      putenv($key . '=' . $val);
      $_ENV[$key] = $val;
    }
  }
}

function db(): PDO {
  static $pdo = null;
  if ($pdo instanceof PDO) return $pdo;

  load_dotenv_if_present();

  $host = env_any(['DB_HOST'], '127.0.0.1');
  $port = env_any(['DB_PORT'], '3306');
  $name = env_any(['DB_NAME', 'DB_DATABASE'], 'cuisinefacile');
  $user = env_any(['DB_USER', 'DB_USERNAME'], 'root');
  $pass = env_any(['DB_PASS', 'DB_PASSWORD'], '');

  $dsn = "mysql:host={$host};port={$port};dbname={$name};charset=utf8mb4";

  try {
    $pdo = new PDO($dsn, $user, $pass, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
  } catch (Throwable $e) {
    json_error('Database connection failed', 500);
  }

  return $pdo;
}

function uuidv4(): string {
  $data = random_bytes(16);
  $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
  $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);
  $hex = bin2hex($data);
  return sprintf(
    '%s-%s-%s-%s-%s',
    substr($hex, 0, 8),
    substr($hex, 8, 4),
    substr($hex, 12, 4),
    substr($hex, 16, 4),
    substr($hex, 20, 12)
  );
}

function require_admin(): void {
  load_dotenv_if_present();

  $adminEmail = strtolower(trim($_SERVER['HTTP_X_ADMIN_EMAIL'] ?? ''));
  if ($adminEmail === '') {
    json_error('Missing X-Admin-Email header', 401);
  }

  $rawAllow = strtolower((string)env_any(['ADMIN_EMAILS', 'VITE_ADMIN_EMAILS'], ''));
  $allow = array_filter(array_map(
    static function ($e) {
      $e = trim((string)$e);
      $e = preg_replace('/^[\"\']+|[\"\']+$/', '', $e);
      return trim($e);
    },
    explode(',', $rawAllow)
  ));

  // Always allow the default admin email (local XAMPP installs often lack php-api/.env).
  $allow[] = 'admin@cuisinefacile.africa';
  $allow = array_values(array_unique(array_filter($allow)));
  if (!in_array($adminEmail, $allow, true)) {
    json_error('Forbidden', 403);
  }
}
