-- ============================================
-- AJOUT DU SYSTÈME DE RÔLES
-- ============================================

-- Ajouter la colonne role à la table users
ALTER TABLE users 
  ADD COLUMN IF NOT EXISTS role VARCHAR(50) NOT NULL DEFAULT 'user' 
  CHECK (role IN ('user', 'admin'));

-- Index pour améliorer les recherches par rôle
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);

-- Mettre à jour les utilisateurs existants pour qu'ils aient le rôle 'user' par défaut
UPDATE users SET role = 'user' WHERE role IS NULL OR role = '';

-- Commentaire sur la colonne
COMMENT ON COLUMN users.role IS 'Rôle de l''utilisateur: user (utilisateur normal) ou admin (administrateur)';

