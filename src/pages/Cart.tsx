import React from 'react';
import { motion } from 'framer-motion';
import { ArrowLeft, Trash2 } from 'lucide-react';
import { CartItem } from '../types';

interface CartProps {
  cart: CartItem[];
  onRemoveFromCart: (id: string) => void;
  onNavigate: (page: string, params?: any) => void;
}

const Cart: React.FC<CartProps> = ({ cart, onRemoveFromCart, onNavigate }) => {
  const subtotal = cart.reduce((acc, item) => acc + (item.totalPrice * item.quantity), 0);

  return (
    <div className="pt-40 pb-24 container mx-auto px-4">
      <div className="flex items-center justify-between mb-10">
        <button
          onClick={() => onNavigate('recipes')}
          className="flex items-center gap-2 text-dark/60 hover:text-primary transition-colors"
        >
          <ArrowLeft size={18} />
          Retour aux recettes
        </button>
        <div className="text-right">
          <div className="text-sm text-dark/50">Sous-total</div>
          <div className="text-xl font-black">{subtotal.toLocaleString()} F CFA</div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div className="lg:col-span-2">
          <div className="bg-white rounded-3xl border border-beige shadow-sm overflow-hidden">
            <div className="p-6 border-b border-beige">
              <h1 className="text-2xl font-black">Mon panier</h1>
              <p className="text-sm text-dark/50 mt-1">Retrouvez ici les recettes ajoutées à votre panier.</p>
            </div>

            {cart.length === 0 ? (
              <div className="p-10 text-center">
                <div className="text-lg font-black mb-2">Votre panier est vide</div>
                <div className="text-sm text-dark/60 mb-6">Ajoutez des recettes pour les voir ici.</div>
                <button
                  onClick={() => onNavigate('recipes')}
                  className="bg-primary text-white px-8 py-4 rounded-2xl font-black shadow-lg shadow-primary/20"
                >
                  Voir les recettes
                </button>
              </div>
            ) : (
              <div className="divide-y divide-beige">
                {cart.map((item) => (
                  <div key={item.recipe.id} className="p-6 flex items-center gap-4">
                    <img
                      src={item.recipe.image || `/recipes/${item.recipe.id}.jpg`}
                      alt={item.recipe.title}
                      className="w-20 h-20 rounded-2xl object-cover border border-beige"
                      onError={(e) => {
                        const img = e.currentTarget as HTMLImageElement;
                        const fallback = `/recipes/${item.recipe.id}.jpg`;
                        if (!img.src.endsWith(fallback)) {
                          img.src = fallback;
                        }
                      }}
                    />
                    <div className="flex-1 min-w-0">
                      <div className="font-black truncate">{item.recipe.title}</div>
                      <div className="text-sm text-dark/60">Qté: {item.quantity}</div>
                      <div className="text-sm text-dark/60 truncate">
                        {item.selectedIngredients.filter((i) => i.selected).length} ingrédient(s)
                      </div>
                    </div>
                    <div className="text-right">
                      <div className="font-black">{(item.totalPrice * item.quantity).toLocaleString()} F</div>
                      <button
                        onClick={() => onRemoveFromCart(item.recipe.id)}
                        className="mt-2 inline-flex items-center gap-2 text-xs font-black uppercase tracking-wider text-red-600 hover:text-red-700"
                      >
                        <Trash2 size={14} />
                        Retirer
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        <div>
          <motion.div
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            className="bg-white rounded-3xl border border-beige shadow-sm p-6 sticky top-32"
          >
            <div className="flex items-center justify-between">
              <div className="text-sm text-dark/50">Sous-total</div>
              <div className="text-lg font-black">{subtotal.toLocaleString()} F</div>
            </div>
            <div className="h-px bg-beige my-5" />
            <button
              onClick={() => onNavigate('checkout')}
              disabled={cart.length === 0}
              className={`w-full px-8 py-4 rounded-2xl text-[10px] font-black tracking-widest transition-all uppercase ${
                cart.length === 0
                  ? 'bg-gray-200 text-gray-500 cursor-not-allowed'
                  : 'bg-primary text-white shadow-lg shadow-primary/20 hover:bg-primary/90'
              }`}
            >
              Passer commande
            </button>
            <button
              onClick={() => onNavigate('recipes')}
              className="w-full mt-3 px-8 py-4 rounded-2xl text-[10px] font-black tracking-widest transition-all uppercase border border-beige text-dark/70 hover:bg-beige"
            >
              Ajouter d’autres recettes
            </button>
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default Cart;
