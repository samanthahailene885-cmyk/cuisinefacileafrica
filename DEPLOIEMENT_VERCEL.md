# 🚀 Déploiement Rapide sur Vercel

## Méthode la plus simple (5 minutes)

### 1. Préparer votre code

Assurez-vous que tout est commité :
```bash
git add .
git commit -m "Ready for production"
```

### 2. Déployer sur Vercel

#### Option A : Via le site web (Recommandé pour débuter)

1. Allez sur [vercel.com](https://vercel.com)
2. Créez un compte ou connectez-vous
3. Cliquez sur **"Add New Project"**
4. Si votre code est sur GitHub :
   - Importez votre repository
   - Vercel détectera automatiquement Vite
5. Si votre code n'est pas sur GitHub :
   - Installez Vercel CLI : `npm i -g vercel`
   - Dans votre projet : `vercel`
   - Suivez les instructions

#### Option B : Via CLI

```bash
# Installer Vercel CLI
npm i -g vercel

# Se connecter
vercel login

# Déployer (première fois)
vercel

# Pour la production
vercel --prod
```

### 3. Configurer les variables d'environnement

**IMPORTANT** : Après le premier déploiement :

1. Allez sur [vercel.com](https://vercel.com) → Votre projet
2. **Settings** → **Environment Variables**
3. Ajoutez :
   - **Name** : `VITE_SUPABASE_URL`
   - **Value** : `https://eyypfwvxarpjiuevmula.supabase.co`
   - Cochez : Production, Preview, Development
   
4. Ajoutez :
   - **Name** : `VITE_SUPABASE_ANON_KEY`
   - **Value** : Votre clé anon (depuis Supabase → Settings → API)
   - Cochez : Production, Preview, Development

5. **Redéployez** :
   - Allez dans **Deployments**
   - Cliquez sur les 3 points du dernier déploiement
   - **Redeploy**

### 4. Vérifier le déploiement

1. Votre site sera accessible sur `https://votre-projet.vercel.app`
2. Testez :
   - Les recettes se chargent
   - Vous pouvez ajouter au panier
   - Vous pouvez créer une commande

### 5. Configurer un domaine personnalisé (Optionnel)

1. Dans Vercel → Votre projet → **Settings** → **Domains**
2. Ajoutez votre domaine (ex: `cuisinefacile.africa`)
3. Suivez les instructions pour configurer le DNS

## ⚠️ Points importants

1. **Variables d'environnement** : N'oubliez pas de les ajouter dans Vercel !
2. **Supabase URLs** : Ajoutez votre domaine Vercel dans Supabase → Settings → API
3. **Redéploiement** : Après avoir ajouté les variables, redéployez !

## 🎉 C'est tout !

Votre site est maintenant en ligne ! 🚀

