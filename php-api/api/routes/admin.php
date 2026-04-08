<?php

declare(strict_types=1);

if (!$handled && $method === 'GET' && $path === '/admin/orders') {
  $handled = true;
  require_admin();
  $pdo = db();
  $st = $pdo->query('SELECT o.*, u.email AS user_email, u.name AS user_name, u.phone AS user_phone FROM orders o JOIN users u ON u.id = o.user_id ORDER BY o.created_at DESC');
  $orders = $st->fetchAll();

  // Attach items + selected ingredients to match frontend expectations.
  foreach ($orders as &$order) {
    $orderId = (string)($order['id'] ?? '');
    if ($orderId === '') {
      $order['items'] = [];
      continue;
    }

    $stItems = $pdo->prepare(
      'SELECT oi.id as order_item_id, oi.recipe_id, oi.quantity, ' .
      'COALESCE(oi.unit_price, oi.total_price, 0) as unit_price, ' .
      'r.title, r.image, r.description, r.price, r.time, r.calories, r.category, r.tags ' .
      'FROM order_items oi ' .
      'JOIN recipes r ON r.id = oi.recipe_id ' .
      'WHERE oi.order_id = ?'
    );
    $stItems->execute([$orderId]);
    $rows = $stItems->fetchAll();

    $itemsOut = [];
    foreach ($rows as $row) {
      $orderItemId = (string)($row['order_item_id'] ?? '');
      $recipeId = (string)($row['recipe_id'] ?? '');
      $quantity = (int)($row['quantity'] ?? 1);
      $unitPrice = (int)($row['unit_price'] ?? 0);

      $recipe = [
        'id' => $recipeId,
        'title' => (string)($row['title'] ?? ''),
        'description' => (string)($row['description'] ?? ''),
        'image' => (string)($row['image'] ?? ''),
        'price' => (int)($row['price'] ?? 0),
        'time' => (string)($row['time'] ?? ''),
        'calories' => (string)($row['calories'] ?? ''),
        'category' => (string)($row['category'] ?? ''),
        'tags' => [],
        'ingredients' => [],
        'preparation_steps' => [],
      ];

      $tagsRaw = $row['tags'] ?? null;
      if (is_string($tagsRaw) && $tagsRaw !== '') {
        $decodedTags = json_decode($tagsRaw, true);
        if (is_array($decodedTags)) $recipe['tags'] = $decodedTags;
      } elseif (is_array($tagsRaw)) {
        $recipe['tags'] = $tagsRaw;
      }

      $selectedIngredients = [];
      if ($orderItemId !== '') {
        $stSel = $pdo->prepare(
          'SELECT i.id, i.recipe_id, i.name, i.unit, i.quantity, i.price_per_unit, oii.selected_quantity ' .
          'FROM order_item_ingredients oii ' .
          'JOIN ingredients i ON i.id = oii.ingredient_id ' .
          'WHERE oii.order_item_id = ?'
        );
        $stSel->execute([$orderItemId]);
        $selRows = $stSel->fetchAll();
        foreach ($selRows as $sr) {
          $selectedIngredients[] = [
            'id' => (string)($sr['id'] ?? ''),
            'name' => (string)($sr['name'] ?? ''),
            'unit' => (string)($sr['unit'] ?? ''),
            'quantity' => (float)($sr['quantity'] ?? 0),
            'pricePerUnit' => isset($sr['price_per_unit']) ? (int)$sr['price_per_unit'] : null,
            'selected' => true,
            'selectedQuantity' => (float)($sr['selected_quantity'] ?? 0),
          ];
        }
      }

      $itemsOut[] = [
        'recipe' => $recipe,
        'selectedIngredients' => $selectedIngredients,
        'totalPrice' => $unitPrice,
        'quantity' => $quantity,
        'personsCount' => 0,
        'recipesCount' => 0,
      ];
    }

    $order['items'] = $itemsOut;

    // Add fields expected by frontend mappers/components.
    $order['date'] = (string)($order['created_at'] ?? '');
    $order['user'] = [
      'email' => (string)($order['user_email'] ?? ''),
      'name' => (string)($order['user_name'] ?? ''),
      'phone' => (string)($order['user_phone'] ?? ''),
    ];
    $order['deliveryAddress'] = (string)($order['delivery_address'] ?? '');
  }

  json_ok($orders);
  return;
}

if (!$handled && $method === 'POST' && $path === '/admin/orders/status') {
  $handled = true;
  require_admin();
  $pdo = db();
  $body = json_input();

  $orderId = (string)($body['order_id'] ?? '');
  $status = (string)($body['status'] ?? '');
  if ($orderId === '' || $status === '') json_error('Missing order_id or status');

  $st = $pdo->prepare('UPDATE orders SET status = ?, updated_at = CURRENT_TIMESTAMP(6) WHERE id = ?');
  $st->execute([$status, $orderId]);
  json_ok(['updated' => true]);
  return;
}

if (!$handled && $method === 'GET' && $path === '/admin/users') {
  $handled = true;
  require_admin();
  $pdo = db();
  $st = $pdo->query('SELECT * FROM users ORDER BY created_at DESC');
  json_ok($st->fetchAll());
  return;
}

if (!$handled && $method === 'POST' && $path === '/admin/users/delete') {
  $handled = true;
  require_admin();
  $pdo = db();
  $body = json_input();
  $email = strtolower(trim((string)($body['email'] ?? '')));
  if ($email === '') json_error('Missing email');

  $st = $pdo->prepare('DELETE FROM users WHERE email = ?');
  $st->execute([$email]);
  json_ok(['deleted' => true]);
  return;
}

if (!$handled && $method === 'POST' && $path === '/admin/recipes/create') {
  $handled = true;
  require_admin();
  $pdo = db();
  $body = json_input();

  $id = uuidv4();
  $title = (string)($body['title'] ?? '');
  if (trim($title) === '') json_error('Missing title');

  $tags = $body['tags'] ?? [];
  $tagsJson = json_encode(is_array($tags) ? $tags : [], JSON_UNESCAPED_UNICODE);

  $st = $pdo->prepare('INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
  $st->execute([
    $id,
    $title,
    (string)($body['description'] ?? ''),
    (string)($body['image'] ?? ''),
    (int)($body['price'] ?? 0),
    (string)($body['time'] ?? ''),
    (string)($body['calories'] ?? ''),
    (string)($body['category'] ?? ''),
    $tagsJson,
  ]);

  json_ok(['id' => $id]);
  return;
}

if (!$handled && $method === 'POST' && $path === '/admin/recipes/update') {
  $handled = true;
  require_admin();
  $pdo = db();
  $body = json_input();

  $id = (string)($body['id'] ?? '');
  if ($id === '') json_error('Missing id');

  $tags = $body['tags'] ?? [];
  $tagsJson = json_encode(is_array($tags) ? $tags : [], JSON_UNESCAPED_UNICODE);

  $st = $pdo->prepare('UPDATE recipes SET title = ?, description = ?, image = ?, price = ?, time = ?, calories = ?, category = ?, tags = ?, updated_at = CURRENT_TIMESTAMP(6) WHERE id = ?');
  $st->execute([
    (string)($body['title'] ?? ''),
    (string)($body['description'] ?? ''),
    (string)($body['image'] ?? ''),
    (int)($body['price'] ?? 0),
    (string)($body['time'] ?? ''),
    (string)($body['calories'] ?? ''),
    (string)($body['category'] ?? ''),
    $tagsJson,
    $id,
  ]);

  json_ok(['updated' => true]);
  return;
}

if (!$handled && $method === 'POST' && $path === '/admin/recipes/delete') {
  $handled = true;
  require_admin();
  $pdo = db();
  $body = json_input();

  $id = (string)($body['id'] ?? '');
  if ($id === '') json_error('Missing id');

  $pdo->prepare('DELETE FROM preparation_steps WHERE recipe_id = ?')->execute([$id]);
  $pdo->prepare('DELETE FROM ingredients WHERE recipe_id = ?')->execute([$id]);
  $pdo->prepare('DELETE FROM recipes WHERE id = ?')->execute([$id]);

  json_ok(['deleted' => true]);
  return;
}
