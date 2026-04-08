-- ============================================
-- DÉFINIR UN UTILISATEUR COMME ADMINISTRATEUR
-- ============================================
-- Remplacez 'votre-email@example.com' par l'email de l'administrateur

UPDATE users 
SET role = 'admin' 
WHERE email = 'votre-email@example.com';

-- Vérifier que la mise à jour a fonctionné
SELECT email, name, role 
FROM users 
WHERE email = 'votre-email@example.com';

