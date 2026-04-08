
import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { Clock, Flame, ChevronLeft, Check, Minus, Plus, ShoppingBag, Utensils, Info, RefreshCw } from 'lucide-react';
import { Recipe, SelectedIngredient, CartItem } from '../types';
import { getRecipeById } from '../lib/supabase';

interface RecipeDetailProps {
  recipe: Recipe;
  recipes?: Recipe[];
  onRefreshRecipes?: () => void;
  onAddToCart: (item: CartItem) => void;
  onBack: () => void;
}

const RecipeDetail: React.FC<RecipeDetailProps> = ({ recipe: initialRecipe, recipes, onRefreshRecipes, onAddToCart, onBack }) => {
  const [recipe, setRecipe] = useState<Recipe>(initialRecipe);
  const [selectedIngredients, setSelectedIngredients] = useState<SelectedIngredient[]>([]);
  const [activeTab, setActiveTab] = useState<'ingredients' | 'steps'>('ingredients');
  const [refreshing, setRefreshing] = useState(false);
  const basePersons = 1;
  const [personsCount, setPersonsCount] = useState(basePersons);
  const [recipesCount, setRecipesCount] = useState(1);
  const [baseIngredients, setBaseIngredients] = useState<Recipe['ingredients']>([]);

  // Mettre à jour la recette si elle change depuis l'extérieur
  useEffect(() => {
    setRecipe(initialRecipe);
  }, [initialRecipe]);

  // Vérifier si une version plus récente de la recette existe dans la liste
  useEffect(() => {
    if (recipes && recipes.length > 0) {
      const updatedRecipe = recipes.find(r => r.id === recipe.id);
      if (updatedRecipe) {
        // Comparer les timestamps ou simplement mettre à jour si différent
        // Pour simplifier, on met à jour si les ingrédients ont changé
        const ingredientsChanged = JSON.stringify(updatedRecipe.ingredients) !== JSON.stringify(recipe.ingredients);
        const priceChanged = updatedRecipe.price !== recipe.price;
        
        if (ingredientsChanged || priceChanged) {
          setRecipe(updatedRecipe);
        }
      }
    }
  }, [recipes, recipe.id]);

  // Initialisation des ingrédients avec les valeurs par défaut de la recette
  useEffect(() => {
    setBaseIngredients(recipe.ingredients);
    setPersonsCount(basePersons);
    setSelectedIngredients(
      recipe.ingredients.map(ing => ({
        ...ing,
        selected: true,
        selectedQuantity: ing.quantity > 0 ? ing.quantity : 1
      }))
    );
  }, [recipe]);

  useEffect(() => {
    if (!baseIngredients.length) return;
    const ratio = (personsCount / basePersons) * recipesCount;
    setSelectedIngredients((prev) => {
      const prevById = new Map(prev.map((p) => [p.id, p]));
      return baseIngredients.map((ing) => {
        const prevIng = prevById.get(ing.id);
        const baseQty = ing.quantity > 0 ? ing.quantity : 1;
        const nextQty = Math.max(0, Math.round((baseQty * ratio + Number.EPSILON) * 100) / 100);
        const selected = prevIng ? prevIng.selected : true;
        return {
          ...ing,
          selected,
          selectedQuantity: selected ? nextQty : 0,
        };
      });
    });
  }, [personsCount, recipesCount, baseIngredients]);

  // Fonction pour recharger la recette depuis Supabase
  const refreshRecipe = async () => {
    try {
      setRefreshing(true);
      const freshRecipe = await getRecipeById(recipe.id);
      if (freshRecipe) {
        setRecipe(freshRecipe);
        // Si on a une fonction de rafraîchissement globale, l'appeler aussi
        if (onRefreshRecipes) {
          onRefreshRecipes();
        }
      }
    } catch (error) {
      console.error('Error refreshing recipe:', error);
    } finally {
      setRefreshing(false);
    }
  };

  const toggleIngredient = (id: string) => {
    setSelectedIngredients(prev => prev.map(ing => 
      ing.id === id ? { ...ing, selected: !ing.selected } : ing
    ));
  };

  const updateQuantity = (id: string, delta: number) => {
    setSelectedIngredients(prev => prev.map(ing => {
      if (ing.id === id) {
        const newQty = Math.max(0, ing.selectedQuantity + delta);
        return { ...ing, selectedQuantity: newQty, selected: newQty > 0 };
      }
      return ing;
    }));
  };

  // Calculer le prix total basé sur les ingrédients sélectionnés
  // Objectif: le total doit TOUJOURS augmenter quand personsCount et recipesCount augmentent.
  const ratio = (personsCount / basePersons) * recipesCount;
  const baseScaledPrice = recipe.price * ratio;

  const baseById = new Map(baseIngredients.map((b) => [b.id, b]));
  const baseQtyFor = (id: string): number => {
    const b = baseById.get(id);
    const q = b?.quantity ?? 0;
    return q > 0 ? q : 1;
  };

  const totalBaseQty = baseIngredients.reduce((sum, b) => sum + (b.quantity > 0 ? b.quantity : 1), 0);
  const selectedBaseQty = selectedIngredients.reduce((sum, ing) => sum + (ing.selected ? baseQtyFor(ing.id) : 0), 0);
  const selectedWeight = totalBaseQty > 0 ? (selectedBaseQty / totalBaseQty) : 1;

  // 1) Somme des ingrédients qui ont un prix unitaire
  const pricedSum = selectedIngredients.reduce((acc, ing) => {
    if (!ing.selected) return acc;
    if (ing.pricePerUnit === undefined || ing.pricePerUnit === null) return acc;
    return acc + (Number(ing.selectedQuantity) * Number(ing.pricePerUnit));
  }, 0);

  // 2) Pour les ingrédients sans prix unitaire, on prend le reste du prix de base (scalé)
  // réparti selon la pondération des ingrédients sélectionnés.
  const hasAnyUnitPrice = selectedIngredients.some((ing) => ing.selected && ing.pricePerUnit !== undefined && ing.pricePerUnit !== null);
  const unpricedPart = hasAnyUnitPrice
    ? Math.max(0, baseScaledPrice * selectedWeight - pricedSum)
    : (baseScaledPrice * selectedWeight);

  const totalPrice = pricedSum + unpricedPart;

  // Arrondir pour éviter les problèmes de précision
  const computedRoundedTotalPrice = Math.round(totalPrice);

  // Si le calcul donne 0 (ex: quantités à 0 / prix non renseigné), on retombe sur le prix de base.
  const roundedTotalPrice = computedRoundedTotalPrice > 0 ? computedRoundedTotalPrice : recipe.price;

  const handleAddToCart = () => {
    const cartItem: CartItem = {
      recipe,
      selectedIngredients: selectedIngredients.filter(ing => ing.selected),
      totalPrice: roundedTotalPrice,
      quantity: 1,
      personsCount,
      recipesCount,
    };
    onAddToCart(cartItem);
  };

  return (
    <div className="pt-24 pb-24 bg-beige min-h-screen">
      <div className="container mx-auto px-4 md:px-6">
        {/* Back Button & Refresh */}
        <div className="flex items-center justify-between mb-8">
          <button 
            onClick={onBack}
            className="flex items-center gap-2 text-dark/60 hover:text-primary transition-colors font-bold group"
          >
            <ChevronLeft className="group-hover:-translate-x-1 transition-transform" />
            Retour au menu
          </button>
          
          <button
            onClick={refreshRecipe}
            disabled={refreshing}
            className="flex items-center gap-2 px-4 py-2 text-sm font-bold text-dark/60 hover:text-primary transition-colors bg-white rounded-xl border border-beige hover:border-primary/20 disabled:opacity-50"
            title="Actualiser les données depuis Supabase"
          >
            <RefreshCw size={16} className={refreshing ? 'animate-spin' : ''} />
            {refreshing ? 'Actualisation...' : 'Actualiser'}
          </button>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-start">
          {/* Section Image & Meta */}
          <motion.div 
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            className="space-y-8"
          >
            <div className="relative aspect-[4/3] rounded-[40px] overflow-hidden shadow-2xl border-8 border-white">
              <img
                src={recipe.image || `/recipes/${recipe.id}.jpg`}
                alt={recipe.title}
                loading="eager"
                className="w-full h-full object-cover"
                onError={(e) => {
                  const img = e.currentTarget as HTMLImageElement;
                  const fallback = `/recipes/${recipe.id}.jpg`;
                  if (!img.src.endsWith(fallback)) {
                    img.src = fallback;
                  }
                }}
              />
              <div className="absolute top-6 left-6 bg-white/95 backdrop-blur px-4 py-2 rounded-full text-xs font-black text-primary uppercase tracking-widest shadow-lg">
                {recipe.category}
              </div>
            </div>

            <div className="bg-white p-8 rounded-[40px] shadow-sm border border-beige/50">
              <h1 className="text-3xl md:text-4xl font-black text-dark mb-4">{recipe.title}</h1>
              <p className="text-dark/60 text-lg leading-relaxed mb-8">{recipe.description}</p>
              
              <div className="flex items-center gap-8 py-6 border-y border-beige">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center text-primary">
                    <Clock size={20} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold text-dark/40 uppercase tracking-widest">Temps</p>
                    <p className="font-bold">{recipe.time}</p>
                  </div>
                </div>
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 bg-accent/10 rounded-xl flex items-center justify-center text-accent">
                    <Flame size={20} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold text-dark/40 uppercase tracking-widest">Calories</p>
                    <p className="font-bold">{recipe.calories}</p>
                  </div>
                </div>
              </div>
            </div>
          </motion.div>

          {/* Section Interactive (Ingrédients / Étapes) */}
          <motion.div 
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            className="bg-white rounded-[40px] shadow-xl border border-beige/50 overflow-hidden sticky top-32"
          >
            {/* Tabs */}
            <div className="flex border-b border-beige">
              <button 
                onClick={() => setActiveTab('ingredients')}
                className={`flex-1 py-6 font-black text-sm uppercase tracking-widest transition-all ${activeTab === 'ingredients' ? 'text-primary bg-primary/5 border-b-4 border-primary' : 'text-dark/40 hover:text-dark'}`}
              >
                1. Ingrédients
              </button>
              <button 
                onClick={() => setActiveTab('steps')}
                className={`flex-1 py-6 font-black text-sm uppercase tracking-widest transition-all ${activeTab === 'steps' ? 'text-primary bg-primary/5 border-b-4 border-primary' : 'text-dark/40 hover:text-dark'}`}
              >
                2. Préparation
              </button>
            </div>

            <div className="p-8">
              {activeTab === 'ingredients' ? (
                <div className="space-y-6">
                  <div className="flex items-center gap-2 text-dark/40 text-xs font-bold uppercase mb-4">
                    <Info size={14} />
                    Personnalisez votre box selon vos envies
                  </div>

                  <div className="grid md:grid-cols-2 gap-4">
                    <div className="p-5 rounded-3xl border border-beige bg-beige/30">
                      <p className="text-xs font-black text-dark/40 uppercase tracking-widest mb-3">Nombre de personnes :</p>
                      <div className="flex items-center justify-center gap-4">
                        <button
                          onClick={() => setPersonsCount((p) => Math.max(1, p - 1))}
                          className="w-9 h-9 rounded-xl bg-accent text-white font-black flex items-center justify-center hover:bg-orange-600 transition-colors"
                          aria-label="Diminuer le nombre de personnes"
                        >
                          <Minus size={18} />
                        </button>
                        <span className="font-black text-lg w-10 text-center">{personsCount}</span>
                        <button
                          onClick={() => setPersonsCount((p) => Math.min(12, p + 1))}
                          className="w-9 h-9 rounded-xl bg-accent text-white font-black flex items-center justify-center hover:bg-orange-600 transition-colors"
                          aria-label="Augmenter le nombre de personnes"
                        >
                          <Plus size={18} />
                        </button>
                      </div>
                    </div>

                    <div className="p-5 rounded-3xl border border-beige bg-beige/30">
                      <p className="text-xs font-black text-dark/40 uppercase tracking-widest mb-3">Nombre de recette :</p>
                      <div className="flex items-center justify-center gap-4">
                        <button
                          onClick={() => setRecipesCount((q) => Math.max(1, q - 1))}
                          className="w-9 h-9 rounded-xl bg-accent text-white font-black flex items-center justify-center hover:bg-orange-600 transition-colors"
                          aria-label="Diminuer le nombre de recettes"
                        >
                          <Minus size={18} />
                        </button>
                        <span className="font-black text-lg w-10 text-center">{recipesCount}</span>
                        <button
                          onClick={() => setRecipesCount((q) => Math.min(12, q + 1))}
                          className="w-9 h-9 rounded-xl bg-accent text-white font-black flex items-center justify-center hover:bg-orange-600 transition-colors"
                          aria-label="Augmenter le nombre de recettes"
                        >
                          <Plus size={18} />
                        </button>
                      </div>
                    </div>
                  </div>
                  
                  <div className="space-y-4 max-h-[400px] overflow-y-auto pr-2 custom-scrollbar">
                    {selectedIngredients.map(ing => (
                      <div 
                        key={ing.id} 
                        className={`flex items-center justify-between p-4 rounded-2xl border transition-all ${ing.selected ? 'border-primary/20 bg-primary/5' : 'border-beige bg-white opacity-60'}`}
                      >
                        <div className="flex items-center gap-4">
                          <button 
                            onClick={() => toggleIngredient(ing.id)}
                            className={`w-6 h-6 rounded-lg border-2 flex items-center justify-center transition-all ${ing.selected ? 'bg-primary border-primary text-white' : 'border-dark/10 bg-white'}`}
                          >
                            {ing.selected && <Check size={14} strokeWidth={4} />}
                          </button>
                          <div className="flex-1">
                            <p className="font-bold text-dark leading-tight">{ing.name}</p>
                            <div className="flex items-center gap-2 mt-1">
                              <p className="text-xs text-dark/40 uppercase font-black tracking-tighter">
                                {ing.selectedQuantity} {ing.unit}
                              </p>
                              {ing.pricePerUnit !== undefined && ing.pricePerUnit !== null && (
                                <span className="text-xs text-primary font-bold">
                                  ({ing.pricePerUnit.toLocaleString()} F/{ing.unit})
                                </span>
                              )}
                            </div>
                          </div>
                        </div>

                        <div className="flex flex-col items-end gap-2">
                          {/* Prix de l'ingrédient */}
                          {ing.selected && (
                            <div className="text-right">
                              {ing.pricePerUnit !== undefined && ing.pricePerUnit !== null ? (
                                <p className="text-sm font-black text-primary">
                                  {(ing.selectedQuantity * ing.pricePerUnit).toLocaleString()} F
                                </p>
                              ) : (
                                <p className="text-xs text-dark/40 italic">Prix calculé</p>
                              )}
                            </div>
                          )}
                          
                          {/* Contrôles de quantité */}
                          <div className="flex items-center gap-3 bg-white px-3 py-2 rounded-xl border border-beige shadow-sm">
                            <button 
                              onClick={() => updateQuantity(ing.id, -1)}
                              className="text-primary hover:bg-primary/10 p-1 rounded-md transition-colors"
                            >
                              <Minus size={16} />
                            </button>
                            <span className="font-black text-sm w-8 text-center">{ing.selectedQuantity}</span>
                            <button 
                              onClick={() => updateQuantity(ing.id, 1)}
                              className="text-primary hover:bg-primary/10 p-1 rounded-md transition-colors"
                            >
                              <Plus size={16} />
                            </button>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>

                  <div className="pt-8 border-t border-beige">
                    {/* Prix de base de la recette */}
                    <div className="flex justify-between items-center mb-3 pb-3 border-b border-beige/50">
                      <p className="text-dark/60 font-bold text-sm">Prix de base</p>
                      <p className="text-xl font-black text-dark">{recipe.price.toLocaleString()} F CFA</p>
                    </div>
                    
                    {/* Prix personnalisé */}
                    <div className="flex justify-between items-center mb-6">
                      <p className="text-dark/40 font-bold uppercase tracking-widest">Total Personnalisé</p>
                      <p className="text-3xl font-black text-primary">{roundedTotalPrice.toLocaleString()} F CFA</p>
                    </div>
                    
                    {/* Indication si le prix a changé */}
                    {Math.abs(roundedTotalPrice - recipe.price) > 1 && (
                      <div className={`mb-4 p-3 rounded-xl text-xs font-bold text-center ${
                        roundedTotalPrice > recipe.price 
                          ? 'bg-orange-50 text-orange-700 border border-orange-200' 
                          : 'bg-green-50 text-green-700 border border-green-200'
                      }`}>
                        {roundedTotalPrice > recipe.price 
                          ? `+${(roundedTotalPrice - recipe.price).toLocaleString()} F par rapport au prix de base`
                          : `-${(recipe.price - roundedTotalPrice).toLocaleString()} F par rapport au prix de base`
                        }
                      </div>
                    )}
                    <button 
                      onClick={handleAddToCart}
                      disabled={roundedTotalPrice <= 0}
                      className="w-full bg-accent hover:bg-orange-600 text-white py-5 rounded-2xl font-black text-lg shadow-xl shadow-accent/20 transition-all active:scale-95 flex items-center justify-center gap-3 disabled:bg-dark/10 disabled:shadow-none"
                    >
                      <ShoppingBag size={24} />
                      Ajouter au Panier
                    </button>
                  </div>
                </div>
              ) : (
                <div className="space-y-8 max-h-[600px] overflow-y-auto pr-2 custom-scrollbar">
                  <div className="bg-primary/5 p-6 rounded-3xl border border-primary/10 flex gap-4">
                    <Utensils className="text-primary shrink-0" size={24} />
                    <p className="text-sm font-medium text-dark/70 leading-relaxed italic">
                      "Suivez ces étapes simples pour réaliser ce plat chez vous. Ingrédients pré-dosés pour vous faciliter la vie !"
                    </p>
                  </div>
                  {recipe.preparation.map(step => (
                    <div key={step.stepNumber} className="flex gap-6">
                      <div className="w-12 h-12 rounded-2xl bg-beige flex items-center justify-center text-primary font-black text-xl shrink-0">
                        {step.stepNumber}
                      </div>
                      <div className="pt-2">
                        <p className="text-lg text-dark/80 leading-relaxed">{step.description}</p>
                        {step.duration && (
                          <span className="inline-flex items-center gap-1.5 text-xs font-bold text-primary mt-3 bg-primary/10 px-3 py-1 rounded-full">
                            <Clock size={12} /> {step.duration}
                          </span>
                        )}
                      </div>
                    </div>
                  ))}
                  <div className="p-8 bg-beige rounded-[32px] text-center border-2 border-dashed border-dark/5">
                    <p className="font-bold text-dark/40 uppercase tracking-widest text-xs">Fin de la préparation</p>
                    <p className="text-lg font-bold text-dark/60 mt-2">Bon appétit ! 🍽️</p>
                  </div>
                </div>
              )}
            </div>
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default RecipeDetail;
