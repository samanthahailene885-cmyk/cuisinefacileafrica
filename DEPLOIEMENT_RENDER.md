# Guide de Déploiement sur Render

## Prérequis
- Un compte Render (https://render.com)
- Votre projet poussé sur GitHub
- Les variables d'environnement Supabase configurées

## Étapes de Déploiement

### 1. Créer un nouveau service sur Render

1. Connectez-vous à [Render Dashboard](https://dashboard.render.com)
2. Cliquez sur **"New +"** → **"Static Site"** (pour une application React/Vite)

### 2. Configuration du Service

#### Connexion au dépôt GitHub
- **Repository**: Sélectionnez `BriceYvan15/cuisinefacile.africa`
- **Branch**: `main`
- **Root Directory**: (laissez vide, ou `/` si nécessaire)

#### Configuration du Build
- **Build Command**: `npm run build`
- **Publish Directory**: `dist`

#### Variables d'environnement
Ajoutez ces variables d'environnement dans la section "Environment Variables" :

```
VITE_SUPABASE_URL=votre_url_supabase
VITE_SUPABASE_ANON_KEY=votre_clé_anon_supabase
```

⚠️ **Important**: Remplacez `votre_url_supabase` et `votre_clé_anon_supabase` par vos vraies valeurs depuis votre fichier `.env.local`

### 3. Déploiement

1. Cliquez sur **"Create Static Site"**
2. Render va automatiquement :
   - Cloner votre dépôt
   - Installer les dépendances (`npm install`)
   - Exécuter le build (`npm run build`)
   - Déployer le site statique

### 4. Configuration du domaine personnalisé (optionnel)

1. Dans les paramètres de votre service
2. Allez dans **"Custom Domains"**
3. Ajoutez votre domaine `cuisinefacile.africa`
4. Suivez les instructions pour configurer les DNS

### 5. Déploiements automatiques

Par défaut, Render déploie automatiquement à chaque push sur la branche `main`.

Pour désactiver les déploiements automatiques :
- Allez dans **"Settings"** → **"Auto-Deploy"** → Désactivez

## Commandes utiles

### Vérifier les logs de build
Dans le dashboard Render, cliquez sur votre service → **"Logs"**

### Redéployer manuellement
Dans le dashboard Render → **"Manual Deploy"** → **"Deploy latest commit"**

## Configuration recommandée

### Plan de service
- **Free Tier**: Suffisant pour commencer
- **Starter Plan**: Pour la production (meilleures performances)

### Headers de sécurité (optionnel)
Dans **"Headers"**, ajoutez :
```
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
```

## Dépannage

### Erreur de build
- Vérifiez que toutes les dépendances sont dans `package.json`
- Vérifiez les logs de build dans Render
- Assurez-vous que les variables d'environnement sont correctement configurées

### Erreur 404 sur les routes
- Vérifiez que votre `vite.config.ts` est correctement configuré
- Ajoutez un fichier `_redirects` dans `public/` si nécessaire

### Variables d'environnement non chargées
- Vérifiez que les variables commencent par `VITE_`
- Redéployez après avoir ajouté/modifié les variables

## URL de déploiement

Après le déploiement, votre site sera accessible à :
- `https://votre-service.onrender.com` (URL Render par défaut)
- `https://cuisinefacile.africa` (si vous avez configuré un domaine personnalisé)

