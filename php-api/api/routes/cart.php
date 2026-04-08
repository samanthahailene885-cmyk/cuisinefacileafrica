<?php

declare(strict_types=1);

if (!$handled && $method === 'GET' && $path === '/cart') {
  $handled = true;
  try {
    $email = strtolower(trim((string)($_GET['email'] ?? '')));
    if ($email === '') json_error('Missing email');

    $pdo = db();
    $st = $pdo->prepare('SELECT c.items_json FROM carts c JOIN users u ON u.id = c.user_id WHERE u.email = ?');
    $st->execute([$email]);
    $json = $st->fetchColumn();

    $items = [];
    if (is_string($json) && $json !== '') {
      $decoded = json_decode($json, true);
      if (is_array($decoded)) $items = $decoded;
    }

    json_ok($items);
  } catch (Throwable $e) {
    json_ok([]);
  }
}

if (!$handled && $method === 'POST' && $path === '/cart/save') {
  $handled = true;
  try {
    $body = json_input();
    $email = strtolower(trim((string)($body['email'] ?? '')));
    $items = $body['items'] ?? [];
    if ($email === '') json_error('Missing email');
    if (!is_array($items)) json_error('Invalid items');

    $pdo = db();

    $stU = $pdo->prepare('SELECT id FROM users WHERE email = ?');
    $stU->execute([$email]);
    $userId = $stU->fetchColumn();
    if (!$userId) {
      $userId = uuidv4();
      $stInU = $pdo->prepare("INSERT INTO users (id, email, phone, name, role) VALUES (?, ?, '', '', 'user')");
      $stInU->execute([$userId, $email]);
    }

    $itemsJson = json_encode($items, JSON_UNESCAPED_UNICODE);

    $stC = $pdo->prepare('SELECT id FROM carts WHERE user_id = ?');
    $stC->execute([$userId]);
    $cartId = $stC->fetchColumn();

    if ($cartId) {
      $stUp = $pdo->prepare('UPDATE carts SET items_json = ?, updated_at = CURRENT_TIMESTAMP(6) WHERE id = ?');
      $stUp->execute([$itemsJson, $cartId]);
    } else {
      $cartId = uuidv4();
      $stIn = $pdo->prepare('INSERT INTO carts (id, user_id, items_json) VALUES (?, ?, ?)');
      $stIn->execute([$cartId, $userId, $itemsJson]);
    }

    json_ok(true);
  } catch (Throwable $e) {
    json_ok(true);
  }
}

if (!$handled && $method === 'POST' && $path === '/cart/delete') {
  $handled = true;
  try {
    $body = json_input();
    $email = strtolower(trim((string)($body['email'] ?? '')));
    if ($email === '') json_error('Missing email');

    $pdo = db();
    $st = $pdo->prepare('DELETE c FROM carts c JOIN users u ON u.id = c.user_id WHERE u.email = ?');
    $st->execute([$email]);

    json_ok(true);
  } catch (Throwable $e) {
    json_ok(true);
  }
}
