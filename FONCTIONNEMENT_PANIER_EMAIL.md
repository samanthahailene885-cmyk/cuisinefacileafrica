# 🛒 Fonctionnement : Panier avec Email (avant création du compte)

## 🎯 Solution implémentée

Le panier peut maintenant être sauvegardé dans Supabase **même avant la création du compte utilisateur**, en utilisant l'email saisi dans le formulaire de checkout.

## 🔄 Flux de fonctionnement

### 1. **Ajout au panier** (sans compte)
- ✅ L'utilisateur ajoute des items au panier
- ✅ Le panier est sauvegardé dans **localStorage** uniquement
- ✅ Pas de sauvegarde Supabase (pas d'email encore)

### 2. **Arrivée sur le checkout** (sans compte)
- ✅ L'utilisateur remplit le formulaire
- ✅ **Dès qu'il saisit son email** → Le panier est automatiquement sauvegardé dans Supabase avec cet email
- ✅ Le panier est lié à l'email (pas encore au user_id car le compte n'existe pas)

### 3. **Validation de la commande**
- ✅ Le compte utilisateur est créé
- ✅ Le panier est automatiquement migré vers le `user_id`
- ✅ La commande est créée
- ✅ Le panier est vidé

### 4. **Retour sur le site** (après création du compte)
- ✅ Si l'utilisateur revient avec le même email
- ✅ Le panier est récupéré depuis Supabase (par email ou user_id)
- ✅ Synchronisation automatique

## 📊 Avantages de cette approche

✅ **Pas besoin de créer un compte avant** : L'utilisateur peut commencer à shopper
✅ **Sauvegarde automatique** : Dès que l'email est saisi, le panier est sauvegardé
✅ **Récupération** : Même si l'utilisateur quitte avant de valider, le panier est sauvegardé
✅ **Migration automatique** : Le panier passe de l'email au user_id après création du compte
✅ **Transparent** : Fonctionne automatiquement, pas de changement pour l'utilisateur

## 🔧 Détails techniques

### Sauvegarde du panier

Le panier est sauvegardé dans Supabase dans ces cas :
1. **Avec user_id** : Si l'utilisateur a un compte (après commande)
2. **Avec user_email** : Si l'utilisateur a saisi son email mais n'a pas encore de compte
3. **localStorage** : Toujours, pour la performance

### Récupération du panier

Le panier est récupéré dans cet ordre :
1. **localStorage** : Pour l'affichage immédiat
2. **Supabase par user_id** : Si l'utilisateur a un compte
3. **Supabase par email** : Si un panier existe avec l'email (avant création du compte)

### Migration automatique

Quand le compte est créé :
- Le panier sauvegardé avec l'email est automatiquement migré vers le `user_id`
- Les deux références (email et user_id) pointent vers le même panier
- Pas de perte de données

## 🧪 Scénarios de test

### Scénario 1 : Utilisateur nouveau
1. Ajoute des items au panier
2. Va au checkout
3. Saisit son email → **Panier sauvegardé dans Supabase avec l'email**
4. Valide la commande → **Compte créé, panier migré vers user_id**
5. Revient plus tard → **Panier récupéré depuis Supabase**

### Scénario 2 : Utilisateur quitte avant validation
1. Ajoute des items au panier
2. Va au checkout
3. Saisit son email → **Panier sauvegardé dans Supabase**
4. Quitte le site (ferme le navigateur)
5. Revient plus tard avec le même email → **Panier récupéré !**

### Scénario 3 : Utilisateur avec compte existant
1. Se connecte (ou a déjà un compte)
2. Ajoute des items au panier
3. Panier sauvegardé avec `user_id` immédiatement
4. Pas besoin d'attendre le checkout

## 📝 Notes importantes

- L'email est stocké temporairement dans `localStorage` (`checkout_email`) pour permettre la sauvegarde
- L'email est nettoyé après création du compte
- Le panier peut exister avec juste l'email (pas de user_id) avant la création du compte
- Après création du compte, le panier est automatiquement lié au `user_id`

---

**🎉 Le panier fonctionne maintenant même avant la création du compte !**

