-- ============================================
-- NETTOYAGE : Supprimer les paniers dupliqués
-- ============================================
-- Ce script supprime les paniers dupliqués, en gardant seulement le plus récent
-- Exécutez ce script si vous avez des paniers dupliqués dans votre base de données

-- Supprimer les paniers dupliqués par user_email (garder le plus récent)
DELETE FROM carts
WHERE id NOT IN (
  SELECT DISTINCT ON (user_email) id
  FROM carts
  WHERE user_email IS NOT NULL
  ORDER BY user_email, updated_at DESC
);

-- Supprimer les paniers dupliqués par user_id (garder le plus récent)
DELETE FROM carts
WHERE id NOT IN (
  SELECT DISTINCT ON (user_id) id
  FROM carts
  WHERE user_id IS NOT NULL
  ORDER BY user_id, updated_at DESC
);

-- Vérification : Compter les paniers restants
SELECT 
  COUNT(*) as total_carts,
  COUNT(DISTINCT user_email) as unique_emails,
  COUNT(DISTINCT user_id) as unique_user_ids
FROM carts;

