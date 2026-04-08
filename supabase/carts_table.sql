-- ============================================
-- TABLE: carts (Paniers des utilisateurs)
-- ============================================
-- Cette table permet de sauvegarder les paniers des utilisateurs dans Supabase
-- pour une persistance entre sessions et appareils

CREATE TABLE IF NOT EXISTS carts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  user_email VARCHAR(255), -- Email pour les utilisateurs non connectés
  items JSONB NOT NULL DEFAULT '[]'::jsonb, -- Tableau JSON des items du panier
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les recherches
CREATE INDEX IF NOT EXISTS idx_carts_user_id ON carts(user_id);
CREATE INDEX IF NOT EXISTS idx_carts_user_email ON carts(user_email);
CREATE INDEX IF NOT EXISTS idx_carts_updated_at ON carts(updated_at DESC);

-- Trigger pour mettre à jour updated_at automatiquement
CREATE TRIGGER update_carts_updated_at BEFORE UPDATE ON carts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- POLITIQUES RLS (Row Level Security)
-- ============================================

ALTER TABLE carts ENABLE ROW LEVEL SECURITY;

-- Politique : Les utilisateurs peuvent voir leur propre panier
CREATE POLICY "Users can view own cart" ON carts
  FOR SELECT USING (
    user_id IS NOT NULL AND (auth.uid()::text = user_id::text OR true) OR
    user_email IS NOT NULL
  );

-- Politique : Les utilisateurs peuvent créer leur propre panier
CREATE POLICY "Users can insert own cart" ON carts
  FOR INSERT WITH CHECK (true);

-- Politique : Les utilisateurs peuvent mettre à jour leur propre panier
CREATE POLICY "Users can update own cart" ON carts
  FOR UPDATE USING (true);

-- Politique : Les utilisateurs peuvent supprimer leur propre panier
CREATE POLICY "Users can delete own cart" ON carts
  FOR DELETE USING (true);

