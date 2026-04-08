# 🔍 Debug : Problème de Calcul des Prix

## Problème identifié

L'utilisateur voit toujours le même prix (107 F) même quand il modifie les quantités d'ingrédients qui ont un `pricePerUnit` défini dans Supabase.

## Cause probable

Le calcul proportionnel était utilisé même quand `pricePerUnit` existe, ce qui donnait toujours le même résultat.

## Corrections apportées

### 1. Vérification explicite de `pricePerUnit`
```typescript
// AVANT : Vérifiait seulement si truthy
if (ing.pricePerUnit) { ... }

// APRÈS : Vérifie explicitement si défini et non null
if (ing.pricePerUnit !== undefined && ing.pricePerUnit !== null) {
  return acc + (ing.selectedQuantity * ing.pricePerUnit);
}
```

### 2. Amélioration du calcul proportionnel
Quand `pricePerUnit` n'existe pas, le calcul est maintenant basé sur :
- Les quantités réelles de chaque ingrédient
- Le poids proportionnel de chaque ingrédient dans le prix total

### 3. Affichage du prix par unité
- Affichage du prix par unité pour chaque ingrédient (ex: "100 F/pièce")
- Affichage du prix total de l'ingrédient quand sélectionné

## Comment vérifier que ça fonctionne

1. **Vérifiez dans Supabase** que vos ingrédients ont bien un `price_per_unit` :
   - Table Editor → Table `ingredients`
   - Vérifiez la colonne `price_per_unit`
   - Si c'est NULL, ajoutez les prix

2. **Dans l'application** :
   - Allez sur une recette
   - Regardez les ingrédients : vous devriez voir le prix par unité affiché
   - Modifiez la quantité d'un ingrédient qui a un prix
   - Le prix total devrait changer proportionnellement

3. **Console du navigateur** (F12) :
   - Regardez les données de la recette
   - Vérifiez que `pricePerUnit` est bien présent dans les ingrédients

## Si le problème persiste

1. **Vérifiez les données dans Supabase** :
   ```sql
   SELECT id, name, price_per_unit, quantity 
   FROM ingredients 
   WHERE recipe_id = 'VOTRE_RECIPE_ID';
   ```

2. **Vérifiez dans la console** :
   - Ouvrez F12 → Console
   - Tapez : `console.log(recipe.ingredients)`
   - Vérifiez que `pricePerUnit` est présent

3. **Vérifiez le calcul** :
   - Le prix devrait être : `selectedQuantity × pricePerUnit`
   - Si `pricePerUnit` est undefined, le calcul proportionnel est utilisé

## Exemple de calcul

**Avec `pricePerUnit` défini :**
- Ingrédient : Oignons
- `pricePerUnit` : 100 F
- Quantité sélectionnée : 3
- Prix de l'ingrédient : 3 × 100 = 300 F

**Sans `pricePerUnit` (calcul proportionnel) :**
- Prix de base de la recette : 4500 F
- Quantité par défaut de l'ingrédient : 2
- Quantité totale par défaut de tous les ingrédients : 20
- Poids de l'ingrédient : 2/20 = 10%
- Prix de base de l'ingrédient : 4500 × 10% = 450 F
- Quantité sélectionnée : 3
- Ratio : 3/2 = 1.5
- Prix final : 450 × 1.5 = 675 F

