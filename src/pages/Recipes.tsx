
import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { ShoppingCart, Search, Filter, Clock, Flame, Eye, Loader2, RefreshCw } from 'lucide-react';
import { Recipe } from '../types';

interface RecipesProps {
  recipes: Recipe[];
  loading: boolean;
  onAddToCart: (recipe: Recipe) => void;
  onNavigate: (page: string, params?: any) => void;
  onRefresh?: () => void;
}

const Recipes: React.FC<RecipesProps> = ({ recipes, loading, onAddToCart, onNavigate, onRefresh }) => {
  const [filter, setFilter] = useState('All');
  const [search, setSearch] = useState('');

  const normalizedRecipes = recipes.map((recipe) => {
    const c = (recipe.category || '').trim().toLowerCase();
    if (c === 'traditionnel') {
      return { ...recipe, category: 'Africaines' };
    }
    return recipe;
  });

  const filteredRecipes = normalizedRecipes.filter(recipe => {
    const normalizedFilter = filter.trim().toLowerCase();
    const normalizedCategory = (recipe.category || '').trim().toLowerCase();
    const matchesFilter = normalizedFilter === 'all' || normalizedCategory === normalizedFilter;
    const matchesSearch = recipe.title.toLowerCase().includes(search.toLowerCase());
    return matchesFilter && matchesSearch;
  });

  const fixedCategories = ['All', 'Boissons', 'Calories Smart', 'Africaines', 'Flexitariennes', 'Rapides'];
  const excludedCategories = new Set(['gibier', 'veggie', 'mer', 'classique']);
  const dynamicCategories = Array.from(
    new Set(
      normalizedRecipes
        .map((r) => r.category)
        .filter((c): c is string => Boolean(c))
        .filter((c) => !excludedCategories.has(c.trim().toLowerCase()))
    )
  );
  const categories = [
    ...fixedCategories,
    ...dynamicCategories.filter((c) => !fixedCategories.some((f) => f.trim().toLowerCase() === c.trim().toLowerCase())),
  ];

  return (
    <div className="pt-28 pb-20 container mx-auto px-4 md:px-6">
      <div className="flex flex-col md:flex-row justify-between items-center gap-6 mb-12">
        <div className="text-center md:text-left">
          <h1 className="text-3xl md:text-4xl font-black mb-2 tracking-tight">Le Menu de la Semaine</h1>
          <p className="text-dark/40 text-sm">Sélectionnez vos plats préférés.</p>
        </div>

        <div className="flex w-full md:w-auto gap-3">
          <div className="relative flex-grow md:w-64">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-dark/30" size={18} />
            <input 
              type="text" 
              placeholder="Chercher..."
              className="w-full pl-11 pr-4 py-3 rounded-xl bg-white border border-beige focus:outline-none focus:border-primary/30 shadow-sm text-sm"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <button className="bg-white border border-beige p-3 rounded-xl text-dark/70 hover:text-primary transition-colors">
            <Filter size={20} />
          </button>
        </div>
      </div>

      {/* Categories */}
      <div className="flex flex-wrap gap-2.5 sm:gap-3 mb-8">
        {categories.map(cat => (
          <button
            key={cat}
            onClick={() => setFilter(cat)}
            className={`whitespace-nowrap px-5 py-3 sm:px-6 sm:py-2 rounded-full text-sm sm:text-xs font-black transition-all min-h-[44px] sm:min-h-[36px] flex items-center justify-center shadow-sm ${
              filter === cat 
                ? 'bg-primary text-white shadow-md shadow-primary/30' 
                : 'bg-white text-dark/80 hover:bg-beige border border-beige/60 hover:border-primary/30 active:scale-95'
            }`}
          >
            <span className="tracking-wide">{cat.toUpperCase()}</span>
          </button>
        ))}
      </div>

      {/* Loading State - Seulement au premier chargement */}
      {loading && recipes.length === 0 && (
        <div className="flex items-center justify-center py-20">
          <Loader2 className="w-8 h-8 animate-spin text-primary" />
          <span className="ml-3 text-dark/60">Chargement des recettes...</span>
        </div>
      )}

      {/* Bouton de rafraîchissement (optionnel) */}
      {!loading && recipes.length > 0 && onRefresh && (
        <div className="flex justify-end mb-4">
          <button
            onClick={onRefresh}
            className="flex items-center gap-2 px-4 py-2 text-xs font-bold text-dark/60 hover:text-primary transition-colors"
            title="Rafraîchir les recettes"
          >
            <RefreshCw size={14} />
            Actualiser
          </button>
        </div>
      )}

      {/* Recipe Grid - Plus compact */}
      {(!loading || recipes.length > 0) && (
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {filteredRecipes.length === 0 ? (
            <div className="col-span-full text-center py-20">
              <p className="text-dark/60 font-bold">Aucune recette trouvée.</p>
            </div>
          ) : (
            filteredRecipes.map((recipe, index) => (
          <motion.div
            key={recipe.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.05 }}
            className="group bg-white rounded-[2rem] overflow-hidden shadow-sm hover:shadow-xl transition-all border border-beige/50"
          >
            <div className="relative h-48 overflow-hidden">
              <img
                src={recipe.image || `/recipes/${recipe.id}.jpg`}
                alt={recipe.title}
                loading="lazy"
                className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                onError={(e) => {
                  const img = e.currentTarget as HTMLImageElement;
                  const fallback = `/recipes/${recipe.id}.jpg`;
                  if (!img.src.endsWith(fallback)) {
                    img.src = fallback;
                  }
                }}
              />
              <div className="absolute top-3 left-3">
                <span className="bg-white/95 backdrop-blur px-3 py-1 rounded-full text-[8px] font-black text-primary uppercase tracking-widest shadow-sm">
                  {recipe.category}
                </span>
              </div>
            </div>
            <div className="p-6">
              <h3 className="font-black text-lg mb-2 group-hover:text-primary transition-colors leading-tight">{recipe.title}</h3>
              <p className="text-dark/40 text-xs mb-4 line-clamp-2">
                {recipe.description}
              </p>
              
              <div className="flex items-center gap-4 text-[9px] font-black text-dark/30 uppercase tracking-widest mb-6">
                <div className="flex items-center gap-1">
                  <Clock size={14} className="text-primary" />
                  {recipe.time}
                </div>
                <div className="flex items-center gap-1">
                  <Flame size={14} className="text-accent" />
                  {recipe.calories}
                </div>
              </div>

              <div className="flex flex-col gap-2 pt-4 border-t border-beige">
                <button 
                  onClick={() => onNavigate('recipe-detail', { recipe })}
                  className="w-full bg-beige hover:bg-primary/5 text-primary py-3 rounded-xl font-black text-[10px] uppercase tracking-widest transition-all flex items-center justify-center gap-2"
                >
                  <Eye size={16} />
                  DÉTAILS
                </button>
                <button 
                  onClick={() => onAddToCart(recipe)}
                  className="w-full bg-primary hover:bg-red-900 text-white py-3 rounded-xl font-black text-[10px] uppercase tracking-widest shadow-lg shadow-primary/10 transition-all flex items-center justify-center gap-2"
                >
                  <ShoppingCart size={16} />
                  AJOUTER BOX
                </button>
              </div>
              <div className="mt-3 text-center">
                <p className="text-lg font-black text-dark">{recipe.price.toLocaleString()} F CFA</p>
              </div>
            </div>
          </motion.div>
            ))
          )}
        </div>
      )}
    </div>
  );
};

export default Recipes;
