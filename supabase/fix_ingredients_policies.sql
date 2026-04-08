-- ============================================
-- CORRECTION DES POLITIQUES RLS POUR INGREDIENTS
-- ============================================
-- Ce script ajoute les politiques manquantes pour permettre
-- l'insertion, la mise à jour et la suppression des ingrédients

-- Supprimer les anciennes politiques si elles existent (pour éviter les conflits)
DROP POLICY IF EXISTS "Ingredients can be inserted by everyone" ON ingredients;
DROP POLICY IF EXISTS "Ingredients can be updated by everyone" ON ingredients;
DROP POLICY IF EXISTS "Ingredients can be deleted by everyone" ON ingredients;

-- Politiques pour ingredients (INSERT, UPDATE, DELETE)
CREATE POLICY "Ingredients can be inserted by everyone" ON ingredients
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Ingredients can be updated by everyone" ON ingredients
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Ingredients can be deleted by everyone" ON ingredients
  FOR DELETE USING (true);

-- ============================================
-- POLITIQUES POUR PREPARATION_STEPS
-- ============================================

DROP POLICY IF EXISTS "Preparation steps can be inserted by everyone" ON preparation_steps;
DROP POLICY IF EXISTS "Preparation steps can be updated by everyone" ON preparation_steps;
DROP POLICY IF EXISTS "Preparation steps can be deleted by everyone" ON preparation_steps;

CREATE POLICY "Preparation steps can be inserted by everyone" ON preparation_steps
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Preparation steps can be updated by everyone" ON preparation_steps
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Preparation steps can be deleted by everyone" ON preparation_steps
  FOR DELETE USING (true);

-- ============================================
-- POLITIQUES POUR RECIPES (si pas déjà présentes)
-- ============================================

DROP POLICY IF EXISTS "Recipes can be inserted by everyone" ON recipes;
DROP POLICY IF EXISTS "Recipes can be updated by everyone" ON recipes;
DROP POLICY IF EXISTS "Recipes can be deleted by everyone" ON recipes;

CREATE POLICY "Recipes can be inserted by everyone" ON recipes
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Recipes can be updated by everyone" ON recipes
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "Recipes can be deleted by everyone" ON recipes
  FOR DELETE USING (true);

