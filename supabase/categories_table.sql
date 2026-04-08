-- ============================================
-- TABLE: categories (Catégories de recettes)
-- ============================================
CREATE TABLE IF NOT EXISTS categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  icon VARCHAR(50), -- Nom de l'icône (optionnel)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les recherches
CREATE INDEX IF NOT EXISTS idx_categories_name ON categories(name);

-- RLS (Row Level Security)
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;

-- Politique : tout le monde peut lire les catégories
CREATE POLICY "Categories are viewable by everyone" ON categories
  FOR SELECT USING (true);

-- Insertion des catégories
INSERT INTO categories (name, description, icon) VALUES
  ('Traditionnel', 'Plats traditionnels africains avec gibier, sauces et accompagnements', '🍲'),
  ('Fruits de Mer', 'Recettes à base de poissons, crustacés et fruits de mer', '🦐'),
  ('Dessert', 'Gâteaux, pâtisseries et desserts', '🍰'),
  ('Cocktail', 'Cocktails et boissons alcoolisées', '🍹'),
  ('Sauce', 'Sauces et accompagnements', '🥘'),
  ('Santé & Bien-être', 'Recettes saines, salades, smoothies et plats équilibrés', '🥗'),
  ('Boisson', 'Jus, smoothies, infusions et boissons non alcoolisées', '🥤'),
  ('Accompagnement', 'Plats d''accompagnement, riz, foutou, etc.', '🍚')
ON CONFLICT (name) DO NOTHING;

-- ============================================
-- MODIFICATION DE LA TABLE RECIPES
-- ============================================
-- Modifier la colonne category pour qu'elle référence la table categories
-- Note: Cette modification nécessite que la colonne category soit déjà VARCHAR(100)

-- Option 1: Garder category comme VARCHAR et ajouter category_id
ALTER TABLE recipes 
  ADD COLUMN IF NOT EXISTS category_id UUID REFERENCES categories(id) ON DELETE SET NULL;

-- Index pour améliorer les jointures
CREATE INDEX IF NOT EXISTS idx_recipes_category_id ON recipes(category_id);

-- Option 2: Ou remplacer complètement category par category_id
-- (Décommentez si vous voulez supprimer la colonne category)
-- ALTER TABLE recipes DROP COLUMN IF EXISTS category;

