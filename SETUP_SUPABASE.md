# 🚀 Guide de Configuration Supabase pour CuisineFacile.Africa

## 📋 Étapes d'installation

### 1. Créer un projet Supabase

1. Allez sur [supabase.com](https://supabase.com)
2. Créez un compte ou connectez-vous
3. Cliquez sur **"New Project"**
4. Remplissez les informations :
   - **Name**: `cuisinefacile-africa`
   - **Database Password**: Choisissez un mot de passe fort (⚠️ **Notez-le bien !**)
   - **Region**: Choisissez la région la plus proche (Europe, US, etc.)
5. Attendez que le projet soit créé (2-3 minutes)

### 2. Exécuter le schéma SQL

1. Dans votre projet Supabase, allez dans **SQL Editor** (menu de gauche)
2. Cliquez sur **"New Query"**
3. Ouvrez le fichier `supabase/schema.sql` dans votre projet
4. **Copiez tout le contenu** du fichier
5. **Collez-le** dans l'éditeur SQL de Supabase
6. Cliquez sur **"Run"** (ou appuyez sur `Ctrl+Enter` / `Cmd+Enter`)
7. Vous devriez voir "Success. No rows returned" - c'est normal !

### 3. Récupérer les clés API

1. Dans votre projet Supabase, allez dans **Settings** → **API**
2. Notez les informations suivantes :
   - **Project URL** (ex: `https://xxxxx.supabase.co`)
   - **anon/public key** (clé publique - commence par `eyJ...`)

### 4. Configurer les variables d'environnement

1. À la racine de votre projet, créez un fichier `.env.local`
2. Ajoutez les variables suivantes :

```env
VITE_SUPABASE_URL=https://votre-projet.supabase.co
VITE_SUPABASE_ANON_KEY=votre-clé-anon-publique
```

**Exemple :**
```env
VITE_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYzODk2NzI4MCwiZXhwIjoxOTU0NTQzMjgwfQ.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

⚠️ **Important** : 
- Ne commitez **JAMAIS** le fichier `.env.local` dans Git
- Le fichier `.env.local` est déjà dans `.gitignore`

### 5. Insérer des données de test (Optionnel)

Vous avez plusieurs options pour insérer des données :

#### Option A : Via l'interface Supabase
1. Allez dans **Table Editor**
2. Sélectionnez la table `recipes`
3. Cliquez sur **"Insert"** → **"Insert row"**
4. Remplissez les champs manuellement

#### Option B : Via SQL
1. Dans **SQL Editor**, créez une nouvelle requête
2. Utilisez ce template pour insérer une recette :

```sql
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
RETURNING id;
```

3. Notez l'ID retourné, puis insérez les ingrédients :

```sql
-- Remplacer 'RECIPE_ID' par l'ID retourné ci-dessus
INSERT INTO ingredients (recipe_id, name, unit, quantity, price_per_unit)
VALUES
  ('RECIPE_ID', 'Poulet fermier', 'g', 500, 4),
  ('RECIPE_ID', 'Oignons', 'pièce', 4, 100),
  ('RECIPE_ID', 'Citron vert', 'pièce', 3, 150),
  ('RECIPE_ID', 'Riz parfumé', 'g', 300, 2);
```

4. Insérez les étapes de préparation :

```sql
-- Remplacer 'RECIPE_ID' par l'ID de la recette
INSERT INTO preparation_steps (recipe_id, step_number, description)
VALUES
  ('RECIPE_ID', 1, 'Mariner le poulet avec le jus de citron et les oignons émincés.'),
  ('RECIPE_ID', 2, 'Faire dorer les morceaux de poulet.'),
  ('RECIPE_ID', 3, 'Mijoter à feu doux.');
```

### 6. Tester l'application

1. Redémarrez votre serveur de développement :
   ```bash
   npm run dev
   ```

2. Allez sur la page **Recettes** dans votre application
3. Les recettes devraient se charger depuis Supabase !

## 📊 Structure de la base de données

### Tables créées :

- **users** : Utilisateurs de l'application
- **recipes** : Recettes disponibles
- **ingredients** : Ingrédients de chaque recette
- **preparation_steps** : Étapes de préparation
- **orders** : Commandes des utilisateurs
- **order_items** : Items dans chaque commande
- **order_item_ingredients** : Ingrédients sélectionnés pour chaque item

### Relations :

```
users (1) ──< (N) orders
orders (1) ──< (N) order_items
order_items (1) ──< (N) order_item_ingredients
recipes (1) ──< (N) ingredients
recipes (1) ──< (N) preparation_steps
recipes (1) ──< (N) order_items
ingredients (1) ──< (N) order_item_ingredients
```

## 🔒 Sécurité (RLS)

Les politiques Row Level Security (RLS) sont activées :
- **Recettes, ingrédients, étapes** : Lecture publique ✅
- **Utilisateurs** : Lecture/écriture pour tous (peut être restreint plus tard)
- **Commandes** : Lecture/écriture pour tous (peut être restreint plus tard)

Pour renforcer la sécurité plus tard, vous pouvez :
- Restreindre l'accès aux commandes par utilisateur
- Ajouter l'authentification Supabase
- Créer des rôles admin

## 🐛 Dépannage

### Erreur : "Missing Supabase environment variables"
- Vérifiez que le fichier `.env.local` existe
- Vérifiez que les variables commencent par `VITE_`
- Redémarrez le serveur de développement

### Erreur : "Failed to fetch"
- Vérifiez que votre URL Supabase est correcte
- Vérifiez que votre clé API est correcte
- Vérifiez la console du navigateur pour plus de détails

### Les recettes ne s'affichent pas
- Vérifiez que vous avez inséré des données dans la table `recipes`
- Vérifiez la console du navigateur pour les erreurs
- Vérifiez que les politiques RLS permettent la lecture

### Erreur SQL lors de l'exécution du schéma
- Vérifiez que vous avez copié tout le contenu du fichier
- Vérifiez que vous n'avez pas déjà exécuté certaines parties
- Essayez d'exécuter section par section

## 📚 Ressources

- [Documentation Supabase](https://supabase.com/docs)
- [JavaScript Client](https://supabase.com/docs/reference/javascript/introduction)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)
- [SQL Editor Guide](https://supabase.com/docs/guides/database/tables)

## ✅ Checklist de vérification

- [ ] Projet Supabase créé
- [ ] Schéma SQL exécuté avec succès
- [ ] Variables d'environnement configurées (`.env.local`)
- [ ] Données de test insérées (optionnel)
- [ ] Application redémarrée
- [ ] Recettes s'affichent correctement
- [ ] Commande peut être créée

---

**Besoin d'aide ?** Vérifiez les logs dans la console du navigateur et la console Supabase pour plus de détails.

