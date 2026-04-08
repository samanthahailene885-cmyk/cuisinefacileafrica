# Configuration Supabase pour CuisineFacile.Africa

## 📋 Instructions d'installation

### 1. Créer un projet Supabase

1. Allez sur [supabase.com](https://supabase.com)
2. Créez un compte ou connectez-vous
3. Cliquez sur "New Project"
4. Remplissez les informations :
   - **Name**: `cuisinefacile-africa`
   - **Database Password**: Choisissez un mot de passe fort (notez-le !)
   - **Region**: Choisissez la région la plus proche (Europe, US, etc.)

### 2. Exécuter le schéma SQL

1. Dans votre projet Supabase, allez dans **SQL Editor**
2. Cliquez sur **New Query**
3. Copiez tout le contenu du fichier `schema.sql`
4. Collez-le dans l'éditeur SQL
5. Cliquez sur **Run** (ou appuyez sur `Ctrl+Enter`)

### 3. Récupérer les clés API

1. Dans votre projet Supabase, allez dans **Settings** → **API**
2. Notez les informations suivantes :
   - **Project URL** (ex: `https://xxxxx.supabase.co`)
   - **anon/public key** (clé publique)
   - **service_role key** (clé secrète - à garder privée !)

### 4. Configurer les variables d'environnement

Créez un fichier `.env.local` à la racine du projet avec :

```env
VITE_SUPABASE_URL=https://votre-projet.supabase.co
VITE_SUPABASE_ANON_KEY=votre-clé-anon-publique
```

⚠️ **Important** : Ne commitez jamais le fichier `.env.local` dans Git !

### 5. Structure des tables

Le schéma crée les tables suivantes :

- **users** : Utilisateurs de l'application
- **recipes** : Recettes disponibles
- **ingredients** : Ingrédients de chaque recette
- **preparation_steps** : Étapes de préparation de chaque recette
- **orders** : Commandes des utilisateurs
- **order_items** : Items dans chaque commande
- **order_item_ingredients** : Ingrédients sélectionnés pour chaque item

### 6. Sécurité (RLS)

Les politiques Row Level Security (RLS) sont activées :
- **Recettes, ingrédients, étapes** : Lecture publique
- **Utilisateurs** : Lecture/écriture pour tous (peut être restreint plus tard)
- **Commandes** : Lecture/écriture pour tous (peut être restreint plus tard)

### 7. Insérer des données de test

Vous pouvez :
1. Utiliser l'interface Supabase (Table Editor) pour insérer manuellement
2. Ou décommenter la section "DONNÉES DE TEST" dans `schema.sql`
3. Ou utiliser l'API Supabase depuis votre application

## 🔧 Prochaines étapes

Une fois le schéma créé, vous devrez :
1. Installer le client Supabase dans votre projet React
2. Créer un service API pour interagir avec Supabase
3. Remplacer les données mockées par des appels à la base de données

## 📚 Documentation Supabase

- [Documentation Supabase](https://supabase.com/docs)
- [JavaScript Client](https://supabase.com/docs/reference/javascript/introduction)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)

