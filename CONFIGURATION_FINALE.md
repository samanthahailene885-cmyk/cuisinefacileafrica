# ✅ Configuration Finale - Après l'exécution des scripts SQL

## 🎉 Félicitations !

Vous avez exécuté les scripts SQL avec succès. Maintenant, il reste **2 étapes importantes** pour que tout fonctionne :

## 📝 Étape 1 : Créer le fichier `.env.local`

### 1. Récupérer vos clés Supabase

1. Allez dans votre projet Supabase
2. Cliquez sur **Settings** (⚙️) → **API**
3. Copiez ces 2 informations :
   - **Project URL** (ex: `https://xxxxx.supabase.co`)
   - **anon/public key** (la longue clé qui commence par `eyJ...`)

### 2. Créer le fichier `.env.local`

À la racine de votre projet (même niveau que `package.json`), créez un fichier nommé exactement : `.env.local`

**Contenu du fichier :**
```env
VITE_SUPABASE_URL=https://votre-projet.supabase.co
VITE_SUPABASE_ANON_KEY=votre-clé-anon-publique
```

**Exemple concret :**
```env
VITE_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYzODk2NzI4MCwiZXhwIjoxOTU0NTQzMjgwfQ.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

⚠️ **IMPORTANT :**
- Les variables **DOIVENT** commencer par `VITE_`
- Remplacez les valeurs par **VOS vraies valeurs** de Supabase
- Ne mettez **PAS** de guillemets autour des valeurs
- Ne mettez **PAS** d'espace autour du `=`

## 🚀 Étape 2 : Tester l'application

### 1. Redémarrer le serveur

**Si le serveur tourne déjà :**
- Arrêtez-le (Ctrl+C dans le terminal)
- Redémarrez-le :

```bash
npm run dev
```

**Si le serveur ne tourne pas :**
```bash
npm run dev
```

### 2. Ouvrir l'application

1. Ouvrez votre navigateur
2. Allez sur `http://localhost:3000` (ou le port affiché dans le terminal)
3. Cliquez sur **"Recettes"** dans le menu

### 3. Vérifier que ça fonctionne

✅ **Si vous voyez vos 3 recettes** (Agouti Braisé, Sauce Nanmoukou, Zrin) :
- **🎉 Ça marche !** Tout est bien configuré.

❌ **Si vous voyez une erreur** :
- Ouvrez la console du navigateur (F12 → Console)
- Regardez les erreurs en rouge
- Voir la section "Dépannage" ci-dessous

## 🐛 Dépannage

### Erreur : "Missing Supabase environment variables"

**Cause :** Le fichier `.env.local` n'existe pas ou les variables sont mal nommées.

**Solution :**
1. Vérifiez que le fichier `.env.local` existe à la racine du projet
2. Vérifiez que les variables commencent par `VITE_`
3. Redémarrez le serveur après avoir créé/modifié le fichier

### Erreur : "Failed to fetch" ou erreur réseau

**Causes possibles :**
- URL Supabase incorrecte
- Clé API incorrecte
- Problème de connexion

**Solutions :**
1. Vérifiez que l'URL Supabase est correcte (sans slash à la fin)
2. Vérifiez que la clé API est correcte (copiez-collez depuis Supabase)
3. Vérifiez votre connexion internet

### Les recettes ne s'affichent pas

**Vérifications :**
1. Dans Supabase → **Table Editor** → Table `recipes` :
   - Vérifiez que vous voyez bien 3 recettes
2. Dans la console du navigateur (F12) :
   - Regardez s'il y a des erreurs
3. Vérifiez que les politiques RLS sont activées (elles devraient l'être)

### Erreur : "relation does not exist"

**Cause :** Les tables n'ont pas été créées.

**Solution :**
- Ré-exécutez le script `schema.sql` dans Supabase

## ✅ Checklist finale

- [ ] Scripts SQL exécutés dans Supabase ✅ (Déjà fait !)
- [ ] Fichier `.env.local` créé avec les bonnes variables
- [ ] Variables commencent par `VITE_`
- [ ] Serveur redémarré après création de `.env.local`
- [ ] Page Recettes affiche les 3 recettes
- [ ] Pas d'erreurs dans la console du navigateur

## 🎯 Prochaines étapes (une fois que ça marche)

1. **Ajuster les prix** :
   - Allez dans Supabase → Table Editor → Table `recipes`
   - Modifiez la colonne `price` selon vos tarifs

2. **Ajouter des images** :
   - Modifiez la colonne `image` avec des URLs d'images
   - Ou utilisez Supabase Storage pour héberger vos images

3. **Tester une commande complète** :
   - Ajouter une recette au panier
   - Aller au checkout
   - Remplir le formulaire
   - Créer la commande
   - Vérifier dans Supabase → Table `orders` que la commande a été créée

---

**Besoin d'aide ?** Dites-moi quelle erreur vous voyez et je vous aiderai ! 🚀

