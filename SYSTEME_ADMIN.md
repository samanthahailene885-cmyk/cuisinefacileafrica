# 🔐 Système d'Administration

## 🎯 Vue d'ensemble

Le système d'administration permet de gérer les commandes, recettes et utilisateurs de la plateforme.

## 🔑 Connexion Admin

### Accès
1. Aller sur la page de connexion
2. Cliquer sur "Se connecter en tant qu'admin"
3. Saisir un email admin (par défaut : `admin@cuisinefacile.africa`)
4. Le système vérifie si l'email a les droits admin
5. Redirection vers le dashboard admin

### Configuration des emails admin
Les emails admin sont définis dans `src/lib/supabase.ts` :
```typescript
const ADMIN_EMAILS = ['admin@cuisinefacile.africa'];
```

Pour ajouter d'autres admins, modifiez cette liste.

## 📊 Dashboard Admin

Le dashboard admin est divisé en 3 onglets :

### 1. Commandes
- **Voir toutes les commandes** : Liste complète avec détails
- **Filtrer** : Recherche par email, nom ou ID de commande
- **Modifier le statut** : 
  - En attente
  - En cours
  - Livrée
- **Détails** : 
  - Informations client (nom, email, téléphone)
  - Adresse de livraison
  - Articles commandés avec quantités
  - Total de la commande
  - Date de commande

### 2. Recettes
- **Voir toutes les recettes** : Liste avec images et détails
- **Ajouter une recette** : Formulaire pour créer une nouvelle recette
- **Modifier une recette** : Éditer les informations de base
- **Supprimer une recette** : Suppression avec confirmation
- **Recherche** : Filtrer par titre ou catégorie

**Note** : Le formulaire actuel permet de modifier les informations de base (titre, description, prix, etc.). Pour ajouter/modifier les ingrédients et étapes de préparation, vous pouvez :
- Les modifier directement dans Supabase
- Ou améliorer le formulaire pour inclure ces champs (future amélioration)

### 3. Utilisateurs
- **Voir tous les utilisateurs** : Liste complète
- **Recherche** : Filtrer par email ou nom
- **Supprimer un utilisateur** : Suppression avec confirmation

## 🔧 Fonctionnalités techniques

### Fonctions admin dans `src/lib/supabase.ts`

#### Commandes
- `getAllOrders()` : Récupère toutes les commandes avec détails
- `updateOrderStatus()` : Met à jour le statut d'une commande

#### Recettes
- `createRecipe()` : Crée une nouvelle recette avec ingrédients et étapes
- `updateRecipe()` : Met à jour une recette existante
- `deleteRecipe()` : Supprime une recette

#### Utilisateurs
- `getAllUsers()` : Récupère tous les utilisateurs
- `deleteUser()` : Supprime un utilisateur

#### Sécurité
- `isAdminEmail()` : Vérifie si un email a les droits admin

## 📁 Fichiers impliqués

### `src/pages/DashboardAdmin.tsx`
- Interface principale du dashboard admin
- Gestion des onglets (commandes, recettes, utilisateurs)
- Formulaire de création/modification de recettes
- Gestion des actions (modifier statut, supprimer, etc.)

### `src/pages/Login.tsx`
- Section de connexion admin
- Bascule entre mode utilisateur et mode admin
- Vérification des droits admin

### `src/App.tsx`
- Route `admin` pour le dashboard admin
- Fonction `handleAdminLogin` pour gérer la connexion admin
- Persistance de la session admin dans localStorage

### `src/lib/supabase.ts`
- Toutes les fonctions admin pour interagir avec Supabase

## 🔒 Sécurité

### Points importants
- ⚠️ **Vérification basique** : Seule l'email est vérifiée pour l'instant
- ⚠️ **Pas de mot de passe** : Le système utilise uniquement l'email
- 💡 **Pour la production** : Considérez ajouter :
  - Un système de mot de passe pour les admins
  - Une authentification Supabase Auth complète
  - Des rôles et permissions plus granulaires
  - Une colonne `is_admin` dans la table `users`

### Recommandations
1. **Ajouter une colonne `is_admin`** dans la table `users` de Supabase
2. **Utiliser Supabase Auth** pour une authentification sécurisée
3. **Implémenter des permissions** plus granulaires (lecture seule, etc.)
4. **Ajouter un audit log** pour tracer les actions admin

## 🎨 Interface utilisateur

### Design
- Interface moderne et épurée
- Navigation par onglets
- Recherche en temps réel
- Notifications pour les actions
- Confirmations pour les suppressions

### Responsive
- Adapté mobile et desktop
- Grille responsive pour les recettes
- Modales adaptatives

## 📝 Notes importantes

- **Session admin** : Stockée dans `localStorage` avec la clé `admin_email`
- **Déconnexion** : Supprime la session admin et redirige vers l'accueil
- **Recettes** : Les modifications sont immédiatement synchronisées avec la base de données
- **Commandes** : Les changements de statut sont enregistrés en temps réel

## 🚀 Améliorations futures

1. **Formulaire de recette complet** : Ajouter la gestion des ingrédients et étapes dans le formulaire
2. **Édition d'utilisateurs** : Permettre de modifier les informations utilisateur
3. **Statistiques** : Ajouter un tableau de bord avec statistiques (commandes par jour, revenus, etc.)
4. **Export de données** : Permettre d'exporter les commandes en CSV/Excel
5. **Notifications** : Notifier les admins des nouvelles commandes
6. **Historique** : Journaliser toutes les actions admin

---

**🎉 Le système d'administration est maintenant opérationnel !**

Pour vous connecter en tant qu'admin, utilisez l'email configuré dans `ADMIN_EMAILS` (par défaut : `admin@cuisinefacile.africa`).

