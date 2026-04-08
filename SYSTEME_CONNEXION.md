# 🔐 Système de Connexion

## 🎯 Vue d'ensemble

Le système de connexion permet aux utilisateurs de se connecter avec leur email après avoir créé un compte lors de leur première commande.

## 🔄 Flux de fonctionnement

### 1. **Création du compte (automatique)**
- ✅ L'utilisateur passe une commande
- ✅ Le compte est créé automatiquement avec l'email, nom et téléphone
- ✅ L'utilisateur est automatiquement connecté après la commande
- ✅ Les données sont sauvegardées dans Supabase

### 2. **Connexion (retour sur le site)**
- ✅ L'utilisateur clique sur l'icône "Utilisateur" dans le header
- ✅ Si non connecté → Redirection vers la page de connexion
- ✅ L'utilisateur saisit son email
- ✅ Vérification dans la base de données
- ✅ Si l'email existe → Connexion réussie
- ✅ Chargement automatique du panier et des commandes
- ✅ Redirection vers le dashboard

### 3. **Déconnexion**
- ✅ L'utilisateur clique sur "Déconnexion" dans le dashboard
- ✅ Les données locales sont supprimées (localStorage)
- ✅ Redirection vers l'accueil

## 📁 Fichiers impliqués

### `src/pages/Login.tsx`
- Page de connexion avec formulaire email
- Validation de l'email
- Vérification de l'existence du compte
- Messages d'erreur clairs

### `src/App.tsx`
- Fonction `handleLogin` : Gère la connexion
  - Sauvegarde l'utilisateur dans le state et localStorage
  - Charge les commandes depuis Supabase
  - Charge le panier depuis Supabase
- Fonction `handleLogout` : Gère la déconnexion
  - Supprime les données locales
  - Réinitialise le state

### `src/pages/Dashboard.tsx`
- Affiche les commandes si l'utilisateur est connecté
- Redirige vers la page de connexion si non connecté
- Bouton de déconnexion

### `src/components/Header.tsx`
- Icône "Utilisateur" qui redirige vers le dashboard
- Le dashboard gère automatiquement la redirection vers la connexion si nécessaire

## 🔧 Fonctionnalités

### ✅ Connexion par email uniquement
- Pas de mot de passe requis (simplifié pour l'expérience utilisateur)
- Vérification de l'existence du compte dans Supabase
- Messages d'erreur clairs si le compte n'existe pas

### ✅ Chargement automatique des données
- **Commandes** : Chargées depuis Supabase après connexion
- **Panier** : Chargé depuis Supabase après connexion
- **Synchronisation** : Les données sont synchronisées entre localStorage et Supabase

### ✅ Persistance de session
- L'utilisateur reste connecté même après fermeture du navigateur
- Les données sont sauvegardées dans localStorage
- Chargement automatique au démarrage de l'application

## 🧪 Scénarios d'utilisation

### Scénario 1 : Nouvel utilisateur
1. Utilisateur passe une commande
2. Compte créé automatiquement
3. Utilisateur connecté automatiquement
4. Peut accéder au dashboard immédiatement

### Scénario 2 : Utilisateur existant (retour)
1. Utilisateur clique sur l'icône "Utilisateur"
2. Redirigé vers la page de connexion
3. Saisit son email
4. Connexion réussie
5. Panier et commandes chargés automatiquement
6. Redirigé vers le dashboard

### Scénario 3 : Email inexistant
1. Utilisateur saisit un email qui n'existe pas
2. Message d'erreur : "Aucun compte trouvé avec cet email"
3. Proposition de créer un compte en commandant
4. Redirection vers les recettes

## 🔒 Sécurité

### Points à noter
- ⚠️ **Pas de mot de passe** : Le système utilise uniquement l'email pour la connexion
- ⚠️ **Vérification basique** : Seule l'existence de l'email est vérifiée
- 💡 **Pour la production** : Considérez ajouter :
  - Un système de mot de passe
  - Une authentification par code OTP (One-Time Password)
  - Une vérification d'email par lien

### Recommandations pour la production
1. **Authentification Supabase Auth** : Utiliser le système d'authentification complet de Supabase
2. **Vérification d'email** : Envoyer un email de vérification lors de la création du compte
3. **Code OTP** : Envoyer un code par email/SMS pour la connexion
4. **Sessions sécurisées** : Utiliser des tokens JWT pour les sessions

## 📝 Notes importantes

- Le compte est créé **automatiquement** lors de la première commande
- Pas besoin de créer un compte avant de commander
- La connexion est **optionnelle** : L'utilisateur peut commander sans être connecté
- Le panier est sauvegardé même sans compte (via email)
- Après connexion, le panier est automatiquement synchronisé

## 🎨 Interface utilisateur

### Page de connexion
- Design moderne et épuré
- Formulaire simple avec validation en temps réel
- Messages d'erreur clairs
- Bouton pour créer un compte en commandant
- Animation fluide avec Framer Motion

### Dashboard
- Affichage des commandes si connecté
- Message d'invitation à se connecter si non connecté
- Bouton de déconnexion visible
- Design cohérent avec le reste de l'application

---

**🎉 Le système de connexion est maintenant opérationnel !**

Les utilisateurs peuvent se connecter avec leur email après avoir créé un compte lors de leur première commande.

