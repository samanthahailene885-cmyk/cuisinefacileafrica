# 🛒 Explication : Comment fonctionne l'ajout au panier

## 📋 Deux façons d'ajouter au panier

### 1. Depuis la page **Recipes** (Liste des recettes)
Quand vous cliquez sur **"AJOUTER BOX"** :
- ✅ Ajoute la recette avec **tous les ingrédients par défaut**
- ✅ Utilise le **prix de base** de la recette (celui affiché dans la liste)
- ✅ Toutes les quantités sont celles définies dans Supabase
- ✅ Aucune personnalisation

**Exemple :**
- Recette : Agouti Braisé (4500 F)
- Ingrédients : Tous sélectionnés avec quantités par défaut
- Prix : 4500 F (prix de base)

### 2. Depuis la page **RecipeDetail** (Détails de la recette)
Quand vous cliquez sur **"Ajouter au Panier"** :
- ✅ Ajoute la recette avec **vos ingrédients personnalisés**
- ✅ Utilise le **prix calculé** selon vos modifications
- ✅ Quantités modifiables (vous pouvez enlever des ingrédients ou changer les quantités)
- ✅ Prix ajusté selon vos sélections

**Exemple :**
- Recette : Agouti Braisé
- Ingrédients : Vous avez modifié les quantités ou désélectionné certains
- Prix : Calculé selon vos modifications (peut être différent de 4500 F)

## 🔍 Comment savoir ce qui est dans le panier ?

Actuellement, le panier affiche :
- Le nom de la recette
- La quantité
- Le prix total

**Mais il ne montre pas clairement :**
- Si c'est une version personnalisée ou par défaut
- Quels ingrédients sont sélectionnés
- Les quantités exactes de chaque ingrédient

## 💡 Recommandation

Il serait utile d'améliorer l'affichage du panier pour montrer :
1. Si l'item vient de Recipes (par défaut) ou RecipeDetail (personnalisé)
2. Les ingrédients sélectionnés avec leurs quantités
3. Le détail du prix

Voulez-vous que j'améliore l'affichage du panier pour mieux distinguer les deux cas ?

