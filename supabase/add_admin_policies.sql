-- ============================================
-- POLITIQUES RLS POUR ADMIN (Ingrédients et Étapes)
-- ============================================
-- Ce script ajoute les politiques manquantes pour permettre
-- l'insertion, la mise à jour et la suppression des ingrédients
-- et des étapes de préparation

-- Politiques pour ingredients (INSERT, UPDATE, DELETE)
CREATE POLICY "Ingredients can be inserted by everyone" ON ingredients
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Ingredients can be updated by everyone" ON ingredients
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Ingredients can be deleted by everyone" ON ingredients
  FOR DELETE USING (true);

-- Politiques pour preparation_steps (INSERT, UPDATE, DELETE)
CREATE POLICY "Preparation steps can be inserted by everyone" ON preparation_steps
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Preparation steps can be updated by everyone" ON preparation_steps
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Preparation steps can be deleted by everyone" ON preparation_steps
  FOR DELETE USING (true);

-- Politiques pour recipes (INSERT, UPDATE, DELETE)
CREATE POLICY "Recipes can be inserted by everyone" ON recipes
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Recipes can be updated by everyone" ON recipes
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Recipes can be deleted by everyone" ON recipes
  FOR DELETE USING (true);

