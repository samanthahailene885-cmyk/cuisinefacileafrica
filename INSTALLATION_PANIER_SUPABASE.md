# 🛒 Installation : Sauvegarde du Panier dans Supabase

## 📋 Étapes d'installation

### 1. Créer la table `carts` dans Supabase

1. Allez dans votre projet Supabase → **SQL Editor**
2. Ouvrez le fichier `supabase/carts_table.sql`
3. **Copiez tout le contenu** du fichier
4. **Collez-le** dans l'éditeur SQL de Supabase
5. Cliquez sur **"Run"** (ou `Ctrl+Enter`)

Vous devriez voir "Success. No rows returned" - c'est normal !

### 2. Vérifier que la table est créée

1. Allez dans **Table Editor**
2. Vous devriez voir une nouvelle table `carts`
3. Vérifiez qu'elle contient les colonnes :
   - `id` (UUID)
   - `user_id` (UUID, nullable)
   - `user_email` (VARCHAR, nullable)
   - `items` (JSONB)
   - `created_at` (TIMESTAMP)
   - `updated_at` (TIMESTAMP)

## ✅ C'est tout !

Le code est déjà implémenté dans l'application. Une fois la table créée, tout fonctionnera automatiquement.

## 🔄 Comment ça fonctionne maintenant

### Système hybride (localStorage + Supabase)

1. **Affichage immédiat** :
   - Le panier s'affiche depuis localStorage (rapide)
   - Pas d'attente de chargement

2. **Sauvegarde automatique** :
   - Chaque modification du panier est sauvegardée dans Supabase
   - Délai de 1 seconde pour éviter trop de requêtes (debounce)

3. **Synchronisation** :
   - Au chargement, si un utilisateur est connecté :
     - Charge depuis localStorage (rapide)
     - Charge depuis Supabase en arrière-plan
     - Si Supabase a un panier plus récent, il remplace localStorage
   - Si pas d'utilisateur connecté :
     - Utilise uniquement localStorage

4. **Après commande** :
   - Le panier est vidé dans localStorage
   - Le panier est supprimé de Supabase

## 🎯 Avantages

✅ **Performance** : Affichage instantané depuis localStorage
✅ **Persistance** : Sauvegarde dans Supabase
✅ **Synchronisation** : Entre appareils et sessions
✅ **Récupération** : Même après suppression des données du navigateur
✅ **Transparent** : Fonctionne automatiquement, pas besoin de changer votre utilisation

## 🧪 Test

1. **Ajoutez des items au panier**
2. **Vérifiez dans Supabase** :
   - Table Editor → Table `carts`
   - Vous devriez voir votre panier sauvegardé
3. **Fermez et rouvrez le navigateur**
4. **Le panier devrait être restauré** automatiquement

## 📊 Structure de la table `carts`

```sql
carts
├── id (UUID) - Identifiant unique
├── user_id (UUID, nullable) - ID de l'utilisateur (si connecté)
├── user_email (VARCHAR, nullable) - Email de l'utilisateur
├── items (JSONB) - Tableau JSON des items du panier
├── created_at (TIMESTAMP) - Date de création
└── updated_at (TIMESTAMP) - Date de dernière mise à jour
```

## 🔒 Sécurité

Les politiques RLS (Row Level Security) sont activées :
- ✅ Les utilisateurs peuvent voir/modifier leur propre panier
- ✅ Les paniers sont liés à l'email utilisateur
- ✅ Pas d'accès aux paniers d'autres utilisateurs

## 🐛 Dépannage

### Le panier ne se sauvegarde pas

1. Vérifiez que la table `carts` existe dans Supabase
2. Vérifiez que les politiques RLS sont activées
3. Ouvrez la console du navigateur (F12) pour voir les erreurs
4. Vérifiez que l'utilisateur a un email (nécessaire pour la sauvegarde)

### Le panier ne se charge pas depuis Supabase

1. Vérifiez qu'un panier existe dans la table `carts`
2. Vérifiez que l'email correspond
3. Vérifiez les logs Supabase (Settings → Logs)

---

**🎉 Votre panier est maintenant sauvegardé dans Supabase !**

Le système fonctionne automatiquement en arrière-plan. Vous n'avez rien à faire de plus une fois la table créée.

