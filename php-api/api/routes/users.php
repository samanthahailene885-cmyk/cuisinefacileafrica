<?php

declare(strict_types=1);

if (!$handled && $method === 'POST' && $path === '/users/upsert') {
  $handled = true;
  $pdo = db();
  $body = json_input();

  $email = strtolower(trim((string)($body['email'] ?? '')));
  $name = trim((string)($body['name'] ?? ''));
  $phone = trim((string)($body['phone'] ?? ''));

  if ($email === '') json_error('Missing email');
  if ($name === '') $name = '';
  if ($phone === '') $phone = '';

  $st = $pdo->prepare('SELECT * FROM users WHERE email = ?');
  $st->execute([$email]);
  $existing = $st->fetch();

  if ($existing) {
    $stUp = $pdo->prepare('UPDATE users SET name = ?, phone = ?, updated_at = CURRENT_TIMESTAMP(6) WHERE id = ?');
    $stUp->execute([$name, $phone, $existing['id']]);
    $st2 = $pdo->prepare('SELECT * FROM users WHERE id = ?');
    $st2->execute([$existing['id']]);
    json_ok($st2->fetch());
    return;
  }

  $id = uuidv4();
  $stIn = $pdo->prepare("INSERT INTO users (id, email, phone, name, role) VALUES (?, ?, ?, ?, 'user')");
  $stIn->execute([$id, $email, $phone, $name]);

  $st2 = $pdo->prepare('SELECT * FROM users WHERE id = ?');
  $st2->execute([$id]);
  json_ok($st2->fetch());
  return;
}

if (!$handled && $method === 'GET' && $path === '/users/by-email') {
  $handled = true;
  $email = strtolower(trim((string)($_GET['email'] ?? '')));
  if ($email === '') json_error('Missing email');
  $pdo = db();

  $st = $pdo->prepare('SELECT * FROM users WHERE email = ?');
  $st->execute([$email]);
  $u = $st->fetch();
  json_ok($u ?: null);
  return;
}

if (!$handled && $method === 'GET' && $path === '/users/email-exists') {
  $handled = true;
  $email = strtolower(trim((string)($_GET['email'] ?? '')));
  if ($email === '') json_error('Missing email');
  $pdo = db();

  $st = $pdo->prepare('SELECT 1 FROM users WHERE email = ? LIMIT 1');
  $st->execute([$email]);
  $exists = (bool)$st->fetchColumn();
  json_ok(['exists' => $exists]);
  return;
}

if (!$handled && $method === 'GET' && $path === '/admin/is-admin-email') {
  $handled = true;
  load_dotenv_if_present();
  $email = strtolower(trim((string)($_GET['email'] ?? '')));
  if ($email === '') json_error('Missing email');

  $allow = array_filter(array_map('trim', explode(',', strtolower(env_any(['ADMIN_EMAILS', 'VITE_ADMIN_EMAILS'], '')))));
  json_ok(['is_admin' => in_array($email, $allow, true)]);
  return;
}
