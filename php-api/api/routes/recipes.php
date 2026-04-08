<?php

declare(strict_types=1);

// Uses: $method, $path, &$handled

if (!$handled && $method === 'GET' && $path === '/mobile/config') {
  $handled = true;
  load_dotenv_if_present();
  $logoUrl = trim((string)env_any(['MOBILE_LOGO_URL'], ''));
  json_ok([
    'logo_url' => $logoUrl,
  ]);
  return;
}

if (!$handled && $method === 'GET' && $path === '/mobile/recipes') {
  $handled = true;
  $pdo = db();

  // Lightweight list for mobile screens
  $stmt = $pdo->query('SELECT id, title, description, image, price, time, calories, category, tags FROM recipes ORDER BY created_at DESC');
  $recipes = $stmt->fetchAll();

  // Attach ingredients + steps in batch to avoid N+1
  $recipeIds = array_map(fn($r) => $r['id'], $recipes);
  $ingByRecipe = [];
  $stepsByRecipe = [];

  if (count($recipeIds) > 0) {
    $in = implode(',', array_fill(0, count($recipeIds), '?'));

    $stIng = $pdo->prepare("SELECT * FROM ingredients WHERE recipe_id IN ($in) ORDER BY created_at ASC");
    $stIng->execute($recipeIds);
    foreach ($stIng->fetchAll() as $row) {
      $rid = $row['recipe_id'];
      if (!isset($ingByRecipe[$rid])) $ingByRecipe[$rid] = [];
      $ingByRecipe[$rid][] = $row;
    }

    $stSteps = $pdo->prepare("SELECT * FROM preparation_steps WHERE recipe_id IN ($in) ORDER BY step_number ASC");
    $stSteps->execute($recipeIds);
    foreach ($stSteps->fetchAll() as $row) {
      $rid = $row['recipe_id'];
      if (!isset($stepsByRecipe[$rid])) $stepsByRecipe[$rid] = [];
      $stepsByRecipe[$rid][] = $row;
    }
  }

  foreach ($recipes as &$r) {
    $r['tags'] = $r['tags'] ? json_decode($r['tags'], true) : [];
    $r['ingredients'] = $ingByRecipe[$r['id']] ?? [];
    $r['preparation_steps'] = $stepsByRecipe[$r['id']] ?? [];
  }

  json_ok($recipes);
  return;
}

if (!$handled && $method === 'GET' && preg_match('#^/mobile/recipes/([a-f0-9\-]{36})$#i', $path, $m)) {
  $handled = true;
  $id = $m[1];
  $pdo = db();

  $st = $pdo->prepare('SELECT * FROM recipes WHERE id = ?');
  $st->execute([$id]);
  $recipe = $st->fetch();
  if (!$recipe) json_error('Recipe not found', 404);

  $stIng = $pdo->prepare('SELECT * FROM ingredients WHERE recipe_id = ? ORDER BY created_at ASC');
  $stIng->execute([$id]);

  $stSteps = $pdo->prepare('SELECT * FROM preparation_steps WHERE recipe_id = ? ORDER BY step_number ASC');
  $stSteps->execute([$id]);

  $recipe['tags'] = $recipe['tags'] ? json_decode($recipe['tags'], true) : [];
  $recipe['ingredients'] = $stIng->fetchAll();
  $recipe['preparation_steps'] = $stSteps->fetchAll();

  json_ok($recipe);
  return;
}

if (!$handled && $method === 'GET' && $path === '/recipes') {
  $handled = true;
  $pdo = db();

  $stmt = $pdo->query('SELECT * FROM recipes ORDER BY created_at DESC');
  $recipes = $stmt->fetchAll();

  // Attach ingredients + steps
  $recipeIds = array_map(fn($r) => $r['id'], $recipes);
  $ingByRecipe = [];
  $stepsByRecipe = [];

  if (count($recipeIds) > 0) {
    $in = implode(',', array_fill(0, count($recipeIds), '?'));

    $stIng = $pdo->prepare("SELECT * FROM ingredients WHERE recipe_id IN ($in) ORDER BY created_at ASC");
    $stIng->execute($recipeIds);
    foreach ($stIng->fetchAll() as $row) {
      $rid = $row['recipe_id'];
      if (!isset($ingByRecipe[$rid])) $ingByRecipe[$rid] = [];
      $ingByRecipe[$rid][] = $row;
    }

    $stSteps = $pdo->prepare("SELECT * FROM preparation_steps WHERE recipe_id IN ($in) ORDER BY step_number ASC");
    $stSteps->execute($recipeIds);
    foreach ($stSteps->fetchAll() as $row) {
      $rid = $row['recipe_id'];
      if (!isset($stepsByRecipe[$rid])) $stepsByRecipe[$rid] = [];
      $stepsByRecipe[$rid][] = $row;
    }
  }

  foreach ($recipes as &$r) {
    $r['tags'] = $r['tags'] ? json_decode($r['tags'], true) : [];
    $r['ingredients'] = $ingByRecipe[$r['id']] ?? [];
    $r['preparation_steps'] = $stepsByRecipe[$r['id']] ?? [];
  }

  json_ok($recipes);
  return;
}

if (!$handled && $method === 'GET' && preg_match('#^/recipes/([a-f0-9\-]{36})$#i', $path, $m)) {
  $handled = true;
  $id = $m[1];
  $pdo = db();

  $st = $pdo->prepare('SELECT * FROM recipes WHERE id = ?');
  $st->execute([$id]);
  $recipe = $st->fetch();
  if (!$recipe) json_error('Recipe not found', 404);

  $stIng = $pdo->prepare('SELECT * FROM ingredients WHERE recipe_id = ? ORDER BY created_at ASC');
  $stIng->execute([$id]);

  $stSteps = $pdo->prepare('SELECT * FROM preparation_steps WHERE recipe_id = ? ORDER BY step_number ASC');
  $stSteps->execute([$id]);

  $recipe['tags'] = $recipe['tags'] ? json_decode($recipe['tags'], true) : [];
  $recipe['ingredients'] = $stIng->fetchAll();
  $recipe['preparation_steps'] = $stSteps->fetchAll();

  json_ok($recipe);
  return;
}
