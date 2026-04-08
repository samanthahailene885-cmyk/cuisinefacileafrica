-- ============================================
-- VOS 3 RECETTES : AGOUTI BRAISE, SAUCE NANMOUKOU, ZRIN
-- ============================================
-- Ce script insère vos 3 recettes avec leurs ingrédients et étapes
-- Exécutez ce script dans l'éditeur SQL de Supabase après avoir exécuté schema.sql

-- ============================================
-- RECETTE 1: AGOUTI BRAISE
-- ============================================
DO $$
DECLARE
  recipe1_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Agouti Braisé',
    'Agouti frais mariné et grillé au charbon de bois, servi avec une sauce pimentée et de la banane vapeur.',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&q=80&w=800',
    4500, -- Prix à ajuster selon vos tarifs
    '50 min', -- 20 min précuisson + 15 min marinade + 30 min cuisson
    '550 kcal', -- Estimation
    'Gibier',
    ARRAY['Traditionnel', 'Grillé']
  )
  RETURNING id INTO recipe1_id;

  -- Insérer les ingrédients (sans prix pour l'instant)
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe1_id, 'Agouti frais', 'g', 500, NULL), -- ou 4 morceaux
    (recipe1_id, 'Oignons', 'pièce', 2, NULL),
    (recipe1_id, 'Ail', 'gousse', 3, NULL),
    (recipe1_id, 'Piments secs', 'pièce', 10, NULL),
    (recipe1_id, 'Grains d''akpi', 'pièce', 10, NULL),
    (recipe1_id, 'Huile', 'cuillère à soupe', 6, NULL),
    (recipe1_id, 'Sel', 'pincée', 1, NULL),
    (recipe1_id, 'Poivre', 'pincée', 1, NULL);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description, duration)
  VALUES
    (recipe1_id, 1, 'Nettoyez soigneusement l''agouti frais et précuisez-le dans un ½ L d''eau bouillante salée et poivrée pendant 20 min.', '20 min'),
    (recipe1_id, 2, 'Epluchez les oignons et l''ail. Coupez-les en petits morceaux. Mixez-les avec l''akpi et le piment sec. Salez et poivrez. Ajoutez l''huile et mélangez le tout.', NULL),
    (recipe1_id, 3, 'Farcissez les morceaux d''agouti avec la marinade et laissez-les reposer pendant 15 min.', '15 min'),
    (recipe1_id, 4, 'Disposez les morceaux sur la grille et faites-les griller au feu de charbon de bois pendant 15 min de chaque côté.', '30 min'),
    (recipe1_id, 5, 'Servez les morceaux d''agouti cuits avec une sauce pimentée et de la banane vapeur.', NULL);
END $$;

-- ============================================
-- RECETTE 2: SAUCE NANMOUKOU
-- ============================================
DO $$
DECLARE
  recipe2_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Sauce Nanmoukou',
    'Sauce traditionnelle à base de poudre de feuilles de baobab séchées (nanmoukou), avec agouti fumé et champignons noirs.',
    'https://images.unsplash.com/photo-1540648336483-d045d737ca98?auto=format&fit=crop&q=80&w=800',
    3500, -- Prix à ajuster
    '55 min', -- 25 min + 15 min + 15 min
    '480 kcal', -- Estimation
    'Traditionnel',
    ARRAY['Sauce', 'Local']
  )
  RETURNING id INTO recipe2_id;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe2_id, 'Agouti fumé', 'morceau', 4, NULL),
    (recipe2_id, 'Champignons noirs', 'poignée', 1, NULL),
    (recipe2_id, 'Tomates fraîches', 'pièce', 2, NULL),
    (recipe2_id, 'Poudre de feuilles de baobab séchées (nanmoukou)', 'cuillère à soupe', 4, NULL),
    (recipe2_id, 'Piments frais', 'pièce', 4, NULL),
    (recipe2_id, 'Oignon', 'pièce', 1, NULL),
    (recipe2_id, 'Sel', 'pincée', 1, NULL);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description, duration)
  VALUES
    (recipe2_id, 1, 'Lavez soigneusement les morceaux d''agouti dans de l''eau froide. Mettez-les dans une casserole. Ajoutez les légumes nettoyés et salez. Mouillez la préparation avec un (1) L d''eau et portez au feu.', NULL),
    (recipe2_id, 2, 'Ajoutez les champignons préalablement nettoyés et laissez cuire, 25 min.', '25 min'),
    (recipe2_id, 3, 'Retirez tous les légumes et mixez-les. Rajoutez la purée obtenue. Salez et laissez mijoter, 15 min.', '15 min'),
    (recipe2_id, 4, 'Retirez les morceaux d''agouti et réservez.', NULL),
    (recipe2_id, 5, 'Dans le jus de la sauce, ajoutez la poudre de nanmoukou et mélangez énergiquement à l''aide d''un fouet.', NULL),
    (recipe2_id, 6, 'Rajoutez la viande. Rectifiez l''assaisonnement. Laissez mijoter, 15 min et c''est prêt ! Servez avec du foutou d''igname ou du riz.', '15 min');
END $$;

-- ============================================
-- RECETTE 3: ZRIN
-- ============================================
DO $$
DECLARE
  recipe3_id UUID;
BEGIN
  -- Insérer la recette
  INSERT INTO recipes (title, description, image, price, time, calories, category, tags)
  VALUES (
    'Zrin',
    'Plat traditionnel à base de feuilles de zrin (kwala), avec agouti fumé, poissons et gombos, servi avec du foutou de banane ou du riz.',
    'https://images.unsplash.com/photo-1540648336483-d045d737ca98?auto=format&fit=crop&q=80&w=800',
    4000, -- Prix à ajuster
    '85 min', -- 40 min + 30 min + 15 min
    '520 kcal', -- Estimation
    'Traditionnel',
    ARRAY['Feuilles', 'Local', 'Complet']
  )
  RETURNING id INTO recipe3_id;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe3_id, 'Agouti fumé', 'morceau', 4, NULL),
    (recipe3_id, 'Poisson magne fumé', 'pièce', 2, NULL),
    (recipe3_id, 'Piment en poudre', 'cuillère à soupe', 1, NULL),
    (recipe3_id, 'Gombos frais', 'pièce', 10, NULL),
    (recipe3_id, 'Gnangnan', 'poignée', 1, NULL),
    (recipe3_id, 'Potasse', 'morceau', 1, NULL),
    (recipe3_id, 'Feuilles de zrin (kwala)', 'botte', 2, NULL),
    (recipe3_id, 'Huile rouge', 'tasse', 1, NULL),
    (recipe3_id, 'Poisson faisandé', 'morceau', 1, NULL),
    (recipe3_id, 'Sel', 'pincée', 1, NULL);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description, duration)
  VALUES
    (recipe3_id, 1, 'Lavez les morceaux de gibier et mettez-les dans une casserole. Ajoutez 2 L d''eau, l''huile rouge, le sel, le piment en poudre, les feuilles de zrin préalablement équeutées et lavées avec le gombo frais, le gnangnan et l''adjovan. Ajoutez la potasse. Portez à ébullition pendant 40 min.', '40 min'),
    (recipe3_id, 2, 'Au terme de ce temps, sortez les feuilles, les gombos frais et le gnangnan. Ecrasez-les dans un talié puis remettez la pâte obtenue dans la sauce. Portez le tout à ébullition pendant 30 min.', '30 min'),
    (recipe3_id, 3, 'Rectifiez l''assaisonnement. Laissez mijoter, 15 min. C''est prêt ! Servez avec du foutou de banane ou du riz.', '15 min');
END $$;

-- ============================================
-- VÉRIFICATION
-- ============================================
-- Exécutez cette requête pour vérifier que tout a été inséré correctement
SELECT 
  r.id,
  r.title,
  r.category,
  r.price,
  r.time,
  COUNT(DISTINCT i.id) as nb_ingredients,
  COUNT(DISTINCT p.id) as nb_steps
FROM recipes r
LEFT JOIN ingredients i ON i.recipe_id = r.id
LEFT JOIN preparation_steps p ON p.recipe_id = r.id
WHERE r.title IN ('Agouti Braisé', 'Sauce Nanmoukou', 'Zrin')
GROUP BY r.id, r.title, r.category, r.price, r.time
ORDER BY r.title;

