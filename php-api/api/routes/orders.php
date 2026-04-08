<?php

declare(strict_types=1);

if (!$handled && $method === 'POST' && $path === '/orders/create') {
  $handled = true;
  try {
    $pdo = db();
    $body = json_input();

    $email = strtolower(trim((string)($body['email'] ?? '')));
    $address = trim((string)($body['address'] ?? ''));
    $total = (int)($body['total'] ?? 0);
    $items = $body['items'] ?? [];
    $customer = $body['customer'] ?? [];

    if ($email === '') json_error('Missing email');
    if ($address === '') json_error('Missing address');
    if (!is_array($items) || count($items) === 0) json_error('Missing items');

    $stU = $pdo->prepare('SELECT id FROM users WHERE email = ?');
    $stU->execute([$email]);
    $userId = $stU->fetchColumn();

    if (!$userId) {
      $userId = uuidv4();
      $name = trim((string)($customer['name'] ?? ''));
      $phone = trim((string)($customer['phone'] ?? ''));
      $stInU = $pdo->prepare("INSERT INTO users (id, email, phone, name, role) VALUES (?, ?, ?, ?, 'user')");
      $stInU->execute([$userId, $email, $phone, $name]);
    }

    $orderId = uuidv4();
    $stO = $pdo->prepare("INSERT INTO orders (id, user_id, total, status, delivery_address) VALUES (?, ?, ?, 'pending', ?)");
    $stO->execute([$orderId, $userId, $total, $address]);

    foreach ($items as $it) {
      if (!is_array($it)) continue;
      $recipeId = (string)($it['recipeId'] ?? $it['recipe_id'] ?? '');
      $quantity = (int)($it['quantity'] ?? 1);
      $unitPrice = (int)($it['unitPrice'] ?? $it['unit_price'] ?? $it['totalPrice'] ?? 0);
      $selected = $it['selectedIngredients'] ?? $it['selected_ingredients'] ?? [];

      if ($recipeId === '') continue;

      $orderItemId = uuidv4();
      try {
        $stOI = $pdo->prepare('INSERT INTO order_items (id, order_id, recipe_id, quantity, unit_price) VALUES (?, ?, ?, ?, ?)');
        $stOI->execute([$orderItemId, $orderId, $recipeId, $quantity, $unitPrice]);
      } catch (Throwable $e) {
        // Some schemas use total_price instead of unit_price.
        $stOI = $pdo->prepare('INSERT INTO order_items (id, order_id, recipe_id, quantity, total_price) VALUES (?, ?, ?, ?, ?)');
        $stOI->execute([$orderItemId, $orderId, $recipeId, $quantity, $unitPrice]);
      }

      if (is_array($selected)) {
        foreach ($selected as $ing) {
          if (!is_array($ing)) continue;
          $ingredientId = (string)($ing['id'] ?? $ing['ingredient_id'] ?? '');
          $selQty = (float)($ing['selectedQuantity'] ?? $ing['selected_quantity'] ?? 0);
          if ($ingredientId === '') continue;

          $oiIngId = uuidv4();
          $stOII = $pdo->prepare('INSERT INTO order_item_ingredients (id, order_item_id, ingredient_id, selected_quantity) VALUES (?, ?, ?, ?)');
          $stOII->execute([$oiIngId, $orderItemId, $ingredientId, $selQty]);
        }
      }
    }

    $st = $pdo->prepare('SELECT * FROM orders WHERE id = ?');
    $st->execute([$orderId]);
    $order = $st->fetch();

    json_ok($order);
  } catch (Throwable $e) {
    json_error('Server error', 500);
  }
}

if (!$handled && $method === 'GET' && $path === '/orders/pdf') {
  $handled = true;
  try {
    $orderId = trim((string)($_GET['id'] ?? ''));
    if ($orderId === '') {
      json_error('Missing id', 400);
    }

    $pdo = db();

    $stO = $pdo->prepare('SELECT id, user_id, total, status, delivery_address, created_at FROM orders WHERE id = ?');
    $stO->execute([$orderId]);
    $order = $stO->fetch();
    if (!$order) {
      json_error('Order not found', 404);
    }

    $stItems = $pdo->prepare(
      'SELECT oi.id as order_item_id, oi.quantity, COALESCE(oi.unit_price, oi.total_price, 0) as unit_price, ' .
      'r.title ' .
      'FROM order_items oi ' .
      'JOIN recipes r ON r.id = oi.recipe_id ' .
      'WHERE oi.order_id = ?'
    );
    $stItems->execute([$orderId]);
    $items = $stItems->fetchAll();

    $pdf_escape = static function (string $s): string {
      $s = str_replace('\\', '\\\\', $s);
      $s = str_replace('(', '\\(', $s);
      $s = str_replace(')', '\\)', $s);
      $s = preg_replace("/[^\x09\x0A\x0D\x20-\x7E]/", '', $s);
      return $s ?? '';
    };

    $lines = [];
    $lines[] = 'CuisineFacile - Reçu de commande';
    $lines[] = 'Commande: #' . (string)$order['id'];
    $lines[] = 'Statut: ' . (string)$order['status'];
    $lines[] = 'Adresse: ' . (string)($order['delivery_address'] ?? '');
    $lines[] = ' '; 
    $lines[] = 'Articles:';

    foreach ($items as $it) {
      $title = (string)($it['title'] ?? '');
      $qty = (int)($it['quantity'] ?? 1);
      $unit = (int)($it['unit_price'] ?? 0);
      $totalLine = $qty * $unit;
      $lines[] = '- ' . $title . '  x' . $qty . '  = ' . $totalLine . ' FCFA';
    }

    $lines[] = ' ';
    $lines[] = 'Total payé: ' . (string)($order['total'] ?? 0) . ' FCFA';

    // Minimal PDF generation (text only)
    $yStart = 800;
    $leading = 16;
    $content = "BT\r\n/F1 12 Tf\r\n";
    $y = $yStart;
    foreach ($lines as $ln) {
      $esc = $pdf_escape($ln);
      $content .= "1 0 0 1 50 {$y} Tm ({$esc}) Tj\r\n";
      $y -= $leading;
      if ($y < 60) break; // avoid overflow
    }
    $content .= "ET\r\n";

    $objects = [];
    $offsets = [];
    // Add binary comment line for PDF readers
    $pdf = "%PDF-1.4\r\n%\xE2\xE3\xCF\xD3\r\n";

    $addObj = static function (&$pdf, &$offsets, int $num, string $body): void {
      $offsets[$num] = strlen($pdf);
      $pdf .= $num . " 0 obj\r\n" . $body . "\r\nendobj\r\n";
    };

    // 1: Catalog
    $addObj($pdf, $offsets, 1, "<< /Type /Catalog /Pages 2 0 R >>");
    // 2: Pages
    $addObj($pdf, $offsets, 2, "<< /Type /Pages /Kids [3 0 R] /Count 1 >>");
    // 3: Page
    $addObj($pdf, $offsets, 3, "<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>");
    // 4: Font
    $addObj($pdf, $offsets, 4, "<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>");
    // 5: Contents stream
    $stream = $content;
    $addObj($pdf, $offsets, 5, "<< /Length " . strlen($stream) . " >>\r\nstream\r\n" . $stream . "endstream");

    $xrefPos = strlen($pdf);
    $maxObj = 5;
    $pdf .= "xref\r\n0 " . ($maxObj + 1) . "\r\n";
    $pdf .= "0000000000 65535 f \r\n";
    for ($i = 1; $i <= $maxObj; $i++) {
      $off = $offsets[$i] ?? 0;
      $pdf .= str_pad((string)$off, 10, '0', STR_PAD_LEFT) . " 00000 n \r\n";
    }
    $pdf .= "trailer\r\n<< /Size " . ($maxObj + 1) . " /Root 1 0 R >>\r\n";
    $pdf .= "startxref\r\n" . $xrefPos . "\r\n%%EOF";

    // Best-effort: disable output buffering
    while (ob_get_level() > 0) {
      ob_end_clean();
    }

    header('Content-Type: application/pdf');
    header('Content-Disposition: attachment; filename="commande-' . $orderId . '.pdf"');
    header('Content-Transfer-Encoding: binary');
    header('Content-Length: ' . strlen($pdf));
    header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
    header('Pragma: no-cache');
    echo $pdf;
    exit;
  } catch (Throwable $e) {
    json_error('Server error', 500);
  }
}

if (!$handled && $method === 'GET' && $path === '/orders/by-user') {
  $handled = true;
  try {
    $email = strtolower(trim((string)($_GET['email'] ?? '')));
    if ($email === '') json_error('Missing email');

    $pdo = db();

    $stU = $pdo->prepare('SELECT id FROM users WHERE email = ?');
    $stU->execute([$email]);
    $userId = $stU->fetchColumn();
    if (!$userId) {
      json_ok([]);
    }

    $stO = $pdo->prepare('SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC');
    $stO->execute([$userId]);
    $orders = $stO->fetchAll();

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
    }

    json_ok($orders);
  } catch (Throwable $e) {
    json_error('Server error', 500);
  }
}
