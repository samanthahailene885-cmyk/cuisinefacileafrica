-- ============================================
-- DONNÉES DE TEST POUR CUISINEFACILE.AFRICA
-- ============================================
-- Ce script insère les 3 recettes qui étaient dans constants.tsx
-- Exécutez ce script dans l'éditeur SQL de Supabase après avoir exécuté schema.sql

-- ============================================
-- RECETTE 1: Poulet Yassa Traditionnel
-- ============================================
DO $$
DECLARE
  recipe1_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Poulet Yassa Traditionnel',
    'Le classique sénégalais revisité avec des oignons caramélisés et du citron frais.',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&q=80&w=800',
    3500,
    '35 min',
    '450 kcal',
    'Classique',
    ARRAY['Sain', 'Rapide']
  )
  RETURNING id INTO recipe1_id;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe1_id, 'Poulet fermier', 'g', 500, 4),
    (recipe1_id, 'Oignons', 'pièce', 4, 100),
    (recipe1_id, 'Citron vert', 'pièce', 3, 150),
    (recipe1_id, 'Riz parfumé', 'g', 300, 2);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description)
  VALUES
    (recipe1_id, 1, 'Mariner le poulet avec le jus de citron et les oignons émincés.'),
    (recipe1_id, 2, 'Faire dorer les morceaux de poulet.'),
    (recipe1_id, 3, 'Mijoter à feu doux.');
END $$;

-- ============================================
-- RECETTE 2: Poisson Braisé & Alloco
-- ============================================
DO $$
DECLARE
  recipe2_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Poisson Braisé & Alloco',
    'Daurade fraîche assaisonnée, accompagnée de bananes plantains frites.',
    'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&q=80&w=800',
    4500,
    '45 min',
    '520 kcal',
    'Mer',
    ARRAY['Premium', 'Local']
  )
  RETURNING id INTO recipe2_id;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe2_id, 'Daurade Royale', 'pièce', 1, 2500),
    (recipe2_id, 'Banane Plantain', 'pièce', 3, 300);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description)
  VALUES
    (recipe2_id, 1, 'Nettoyer et écailler le poisson.'),
    (recipe2_id, 2, 'Griller au charbon de bois.');
END $$;

-- ============================================
-- RECETTE 3: Mafé de Légumes
-- ============================================
DO $$
DECLARE
  recipe3_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Mafé de Légumes',
    'Version végétarienne onctueuse avec une sauce arachide maison.',
    'https://images.unsplash.com/photo-1540648336483-d045d737ca98?auto=format&fit=crop&q=80&w=800',
    2500,
    '30 min',
    '380 kcal',
    'Veggie',
    ARRAY['Végétarien']
  )
  RETURNING id INTO recipe3_id;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe3_id, 'Pâte d''arachide', 'g', 150, 3),
    (recipe3_id, 'Carottes', 'g', 200, 2);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description)
  VALUES
    (recipe3_id, 1, 'Diluer la pâte d''arachide.'),
    (recipe3_id, 2, 'Mijoter avec les légumes.');
END $$;

-- ============================================
-- VÉRIFICATION
-- ============================================
-- Exécutez cette requête pour vérifier que tout a été inséré correctement
SELECT 
  r.id,
  r.title,
  r.category,
  COUNT(DISTINCT i.id) as nb_ingredients,
  COUNT(DISTINCT p.id) as nb_steps
FROM recipes r
LEFT JOIN ingredients i ON i.recipe_id = r.id
LEFT JOIN preparation_steps p ON p.recipe_id = r.id
GROUP BY r.id, r.title, r.category
ORDER BY r.title;

