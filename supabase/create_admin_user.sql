-- ============================================
-- CRÉATION DE L'UTILISATEUR ADMINISTRATEUR
-- ============================================
-- Ce script crée l'utilisateur admin avec l'email admin@cuisinefacile.africa

-- D'abord, s'assurer que la colonne role existe
ALTER TABLE users 
  ADD COLUMN IF NOT EXISTS role VARCHAR(50) NOT NULL DEFAULT 'user' 
  CHECK (role IN ('user', 'admin'));

-- Créer l'utilisateur admin
INSERT INTO users (email, phone, name, role)
VALUES (
  'admin@cuisinefacile.africa',
  '+2250709302481', -- Remplacez par le numéro de téléphone réel si nécessaire
  'Administrateur',
  'admin'
)
ON CONFLICT (email) 
DO UPDATE SET 
  role = 'admin',
  name = 'Administrateur';

-- Vérifier que l'utilisateur a été créé
SELECT id, email, name, phone, role, created_at 
FROM users 
WHERE email = 'admin@cuisinefacile.africa';

