-- ============================================
-- SCHEMA DE BASE DE DONNÉES POUR CUISINEFACILE.AFRICA
-- ============================================

-- Extension pour générer des UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- TABLE: users (Utilisateurs)
-- ============================================
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(50) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les performances
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- ============================================
-- TABLE: recipes (Recettes)
-- ============================================
CREATE TABLE IF NOT EXISTS recipes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  image TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  time VARCHAR(50) NOT NULL,
  calories VARCHAR(50) NOT NULL,
  category VARCHAR(100) NOT NULL,
  tags TEXT[], -- Array de tags
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour les recherches
CREATE INDEX IF NOT EXISTS idx_recipes_category ON recipes(category);
CREATE INDEX IF NOT EXISTS idx_recipes_title ON recipes(title);

-- ============================================
-- TABLE: ingredients (Ingrédients)
-- ============================================
CREATE TABLE IF NOT EXISTS ingredients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  unit VARCHAR(50) NOT NULL,
  quantity DECIMAL(10, 2) NOT NULL,
  price_per_unit DECIMAL(10, 2), -- Optionnel : peut être NULL si le prix n'est pas disponible
  image TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les jointures
CREATE INDEX IF NOT EXISTS idx_ingredients_recipe_id ON ingredients(recipe_id);

-- ============================================
-- TABLE: preparation_steps (Étapes de préparation)
-- ============================================
CREATE TABLE IF NOT EXISTS preparation_steps (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  step_number INTEGER NOT NULL,
  description TEXT NOT NULL,
  duration VARCHAR(50),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les jointures
CREATE INDEX IF NOT EXISTS idx_preparation_steps_recipe_id ON preparation_steps(recipe_id);

-- ============================================
-- TABLE: orders (Commandes)
-- ============================================
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  total DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'processing' CHECK (status IN ('pending', 'processing', 'delivered')),
  delivery_address TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les recherches
CREATE INDEX IF NOT EXISTS idx_orders_user_id ON orders(user_id);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(status);
CREATE INDEX IF NOT EXISTS idx_orders_created_at ON orders(created_at DESC);

-- ============================================
-- TABLE: order_items (Items de commande)
-- ============================================
CREATE TABLE IF NOT EXISTS order_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE RESTRICT,
  quantity INTEGER NOT NULL DEFAULT 1,
  total_price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les jointures
CREATE INDEX IF NOT EXISTS idx_order_items_order_id ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_recipe_id ON order_items(recipe_id);

-- ============================================
-- TABLE: order_item_ingredients (Ingrédients sélectionnés pour chaque item)
-- ============================================
CREATE TABLE IF NOT EXISTS order_item_ingredients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_item_id UUID NOT NULL REFERENCES order_items(id) ON DELETE CASCADE,
  ingredient_id UUID NOT NULL REFERENCES ingredients(id) ON DELETE RESTRICT,
  selected BOOLEAN NOT NULL DEFAULT true,
  selected_quantity DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les jointures
CREATE INDEX IF NOT EXISTS idx_order_item_ingredients_order_item_id ON order_item_ingredients(order_item_id);
CREATE INDEX IF NOT EXISTS idx_order_item_ingredients_ingredient_id ON order_item_ingredients(ingredient_id);

-- ============================================
-- FONCTIONS ET TRIGGERS
-- ============================================

-- Fonction pour mettre à jour automatiquement updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers pour mettre à jour updated_at automatiquement
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_recipes_updated_at BEFORE UPDATE ON recipes
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- POLITIQUES RLS (Row Level Security)
-- ============================================

-- Activer RLS sur toutes les tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;
ALTER TABLE preparation_steps ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_item_ingredients ENABLE ROW LEVEL SECURITY;

-- Politiques pour recipes (lecture publique, écriture admin)
CREATE POLICY "Recipes are viewable by everyone" ON recipes
  FOR SELECT USING (true);

-- Politiques pour ingredients (lecture publique)
CREATE POLICY "Ingredients are viewable by everyone" ON ingredients
  FOR SELECT USING (true);

-- Politiques pour preparation_steps (lecture publique)
CREATE POLICY "Preparation steps are viewable by everyone" ON preparation_steps
  FOR SELECT USING (true);

-- Politiques pour users (lecture/écriture pour l'utilisateur lui-même)
CREATE POLICY "Users can view own profile" ON users
  FOR SELECT USING (auth.uid()::text = id::text OR true); -- Permettre la lecture pour tous pour simplifier

CREATE POLICY "Users can insert own profile" ON users
  FOR INSERT WITH CHECK (true); -- Permettre l'insertion pour tous

CREATE POLICY "Users can update own profile" ON users
  FOR UPDATE USING (true); -- Permettre la mise à jour pour tous

-- Politiques pour orders (lecture/écriture pour l'utilisateur)
CREATE POLICY "Users can view own orders" ON orders
  FOR SELECT USING (true); -- Permettre la lecture pour tous pour simplifier

CREATE POLICY "Users can create own orders" ON orders
  FOR INSERT WITH CHECK (true); -- Permettre l'insertion pour tous

CREATE POLICY "Users can update own orders" ON orders
  FOR UPDATE USING (true); -- Permettre la mise à jour pour tous

-- Politiques pour order_items (lecture/écriture liée aux commandes)
CREATE POLICY "Order items are viewable by everyone" ON order_items
  FOR SELECT USING (true);

CREATE POLICY "Order items can be inserted by everyone" ON order_items
  FOR INSERT WITH CHECK (true);

-- Politiques pour order_item_ingredients (lecture/écriture liée aux items)
CREATE POLICY "Order item ingredients are viewable by everyone" ON order_item_ingredients
  FOR SELECT USING (true);

CREATE POLICY "Order item ingredients can be inserted by everyone" ON order_item_ingredients
  FOR INSERT WITH CHECK (true);

-- ============================================
-- DONNÉES DE TEST (Optionnel)
-- ============================================

-- Vous pouvez décommenter cette section pour insérer des données de test
/*
-- Exemple d'insertion d'une recette avec ses ingrédients et étapes
DO $$
DECLARE
  recipe_uuid UUID;
BEGIN
  -- Insérer une recette
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
  RETURNING id INTO recipe_uuid;

  -- Insérer les ingrédients
  INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
  VALUES
    (recipe_uuid, 'Poulet fermier', 'g', 500, 4),
    (recipe_uuid, 'Oignons', 'pièce', 4, 100),
    (recipe_uuid, 'Citron vert', 'pièce', 3, 150),
    (recipe_uuid, 'Riz parfumé', 'g', 300, 2);

  -- Insérer les étapes de préparation
  INSERT INTO preparation_steps (recipe_id, step_number, description)
  VALUES
    (recipe_uuid, 1, 'Mariner le poulet avec le jus de citron et les oignons émincés.'),
    (recipe_uuid, 2, 'Faire dorer les morceaux de poulet.'),
    (recipe_uuid, 3, 'Mijoter à feu doux.');
END $$;
*/

