# 🚀 Guide de Mise en Production - CuisineFacile.Africa

## 📋 Checklist avant la mise en production

### ✅ 1. Configuration Supabase

#### A. Vérifier les politiques RLS (Row Level Security)
Dans Supabase → **Authentication** → **Policies** :
- ✅ Les recettes sont accessibles en lecture publique
- ✅ Les utilisateurs peuvent créer leurs propres commandes
- ⚠️ **Important** : Vérifiez que les politiques sont bien configurées pour la production

#### B. Vérifier les URLs autorisées
Dans Supabase → **Settings** → **API** → **URL Configuration** :
- Ajoutez votre domaine de production (ex: `https://cuisinefacile.africa`)
- Ajoutez `https://*.vercel.app` si vous utilisez Vercel

#### C. Vérifier les clés API
- ✅ Utilisez la clé **anon/public** (jamais la clé service_role en frontend)
- ✅ La clé service_role doit rester secrète (uniquement pour le backend)

### ✅ 2. Variables d'environnement

#### Pour Vercel (Recommandé)

1. **Connectez votre projet à Vercel** :
   ```bash
   npm i -g vercel
   vercel login
   vercel
   ```

2. **Ajoutez les variables d'environnement** :
   - Allez sur [vercel.com](https://vercel.com) → Votre projet → **Settings** → **Environment Variables**
   - Ajoutez :
     ```
     VITE_SUPABASE_URL=https://eyypfwvxarpjiuevmula.supabase.co
     VITE_SUPABASE_ANON_KEY=votre-clé-anon-publique
     ```
   - Sélectionnez **Production**, **Preview**, et **Development**

#### Pour Netlify

1. Allez sur [netlify.com](https://netlify.com) → Votre site → **Site settings** → **Environment variables**
2. Ajoutez les mêmes variables

#### Pour Render

1. Allez sur [render.com](https://render.com) → Votre service → **Environment**
2. Ajoutez les variables

### ✅ 3. Build de l'application

#### Test du build local

```bash
# Installer les dépendances
npm install

# Tester le build
npm run build

# Prévisualiser le build
npm run preview
```

Vérifiez que :
- ✅ Le build se termine sans erreurs
- ✅ Le dossier `dist/` est créé
- ✅ L'application fonctionne en mode preview

### ✅ 4. Configuration Vercel

Votre `vercel.json` est déjà configuré ! ✅

Si vous utilisez Vercel, il détectera automatiquement :
- Le framework (Vite)
- La commande de build (`npm run build`)
- Le dossier de sortie (`dist`)

### ✅ 5. Optimisations pour la production

#### A. Vérifier les images
- ✅ Les images des recettes sont-elles optimisées ?
- ✅ Utilisez des formats modernes (WebP) si possible
- ✅ Considérez Supabase Storage pour héberger les images

#### B. Vérifier les performances
- ✅ Testez la vitesse de chargement
- ✅ Vérifiez le cache des recettes (déjà configuré : 5 minutes)

#### C. Vérifier la sécurité
- ✅ Les clés API ne sont jamais exposées dans le code
- ✅ Les variables d'environnement sont bien configurées
- ✅ Les politiques RLS sont activées dans Supabase

### ✅ 6. Tests avant production

Testez ces fonctionnalités :
- [ ] Affichage des recettes
- [ ] Ajout au panier
- [ ] Personnalisation des ingrédients
- [ ] Création d'une commande
- [ ] Affichage du dashboard
- [ ] Historique des commandes
- [ ] Responsive (mobile, tablette, desktop)

## 🚀 Déploiement sur Vercel

### Option 1 : Via GitHub (Recommandé)

1. **Poussez votre code sur GitHub** :
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/votre-username/cuisinefacile.africa.git
   git push -u origin main
   ```

2. **Connectez à Vercel** :
   - Allez sur [vercel.com](https://vercel.com)
   - Cliquez sur **"Add New Project"**
   - Importez votre repository GitHub
   - Vercel détectera automatiquement Vite

3. **Configurez les variables d'environnement** :
   - Dans les paramètres du projet → **Environment Variables**
   - Ajoutez `VITE_SUPABASE_URL` et `VITE_SUPABASE_ANON_KEY`

4. **Déployez** :
   - Cliquez sur **"Deploy"**
   - Votre site sera en ligne en quelques minutes !

### Option 2 : Via CLI Vercel

```bash
# Installer Vercel CLI
npm i -g vercel

# Se connecter
vercel login

# Déployer
vercel

# Pour la production
vercel --prod
```

## 🔒 Sécurité en production

### 1. Variables d'environnement
- ✅ **JAMAIS** de clés API dans le code source
- ✅ Utilisez les variables d'environnement de votre plateforme
- ✅ Vérifiez que `.env.local` est dans `.gitignore` ✅ (déjà fait)

### 2. Supabase
- ✅ Utilisez uniquement la clé **anon/public** en frontend
- ✅ Activez les politiques RLS
- ✅ Limitez les URLs autorisées dans Supabase

### 3. CORS
- ✅ Configurez les domaines autorisés dans Supabase
- ✅ Vérifiez que votre domaine est dans la liste blanche

## 📊 Monitoring et Analytics

### Options recommandées :
- **Vercel Analytics** : Intégré avec Vercel
- **Google Analytics** : Pour le suivi des utilisateurs
- **Supabase Dashboard** : Pour surveiller les requêtes API

## 🐛 Dépannage en production

### Problème : Les recettes ne se chargent pas
- Vérifiez les variables d'environnement dans Vercel
- Vérifiez les logs dans Vercel → **Functions** → **Logs**
- Vérifiez la console du navigateur (F12)

### Problème : Erreur CORS
- Vérifiez que votre domaine est dans les URLs autorisées de Supabase
- Vérifiez les politiques RLS

### Problème : Variables d'environnement non chargées
- Vérifiez que les variables commencent par `VITE_`
- Redéployez après avoir ajouté les variables
- Vérifiez que les variables sont dans **Production**, **Preview**, et **Development**

## ✅ Checklist finale avant le lancement

- [ ] Build local testé et fonctionnel
- [ ] Variables d'environnement configurées sur la plateforme
- [ ] Supabase configuré (RLS, URLs autorisées)
- [ ] Tous les tests fonctionnels passés
- [ ] Responsive testé sur mobile/tablette/desktop
- [ ] Performance vérifiée
- [ ] Sécurité vérifiée (pas de clés API exposées)
- [ ] Domaine configuré (si vous avez un nom de domaine)
- [ ] SSL/HTTPS activé (automatique avec Vercel)

## 🎯 Après le déploiement

1. **Testez votre site en production**
2. **Vérifiez les logs** dans Vercel
3. **Surveillez Supabase** pour les requêtes
4. **Testez une commande complète** en production
5. **Vérifiez que les données sont bien sauvegardées** dans Supabase

## 📝 Commandes utiles

```bash
# Build local
npm run build

# Preview local
npm run preview

# Déployer sur Vercel
vercel --prod

# Voir les logs Vercel
vercel logs
```

## 🔗 Ressources

- [Documentation Vercel](https://vercel.com/docs)
- [Documentation Supabase](https://supabase.com/docs)
- [Vite Production Guide](https://vitejs.dev/guide/build.html)

---

**🎉 Bon déploiement !**

Si vous avez des questions ou rencontrez des problèmes, n'hésitez pas à me demander !

