
import React, { useState, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import { CreditCard, Truck, ShieldCheck, Trash2, ArrowLeft, X } from 'lucide-react';
import { CartItem, User } from '../types';
import { validateEmailFormat, checkEmailExists } from '../lib/supabase';

interface CheckoutProps {
  cart: CartItem[];
  onRemoveFromCart: (id: string) => void;
  onPlaceOrder: (userData: { email: string; phone: string; name: string; address: string }) => void;
  onNavigate: (page: string) => void;
  onEmailChange?: (email: string) => void; // Callback quand l'email change
  user?: User | null;
}

const Checkout: React.FC<CheckoutProps> = ({ cart, onRemoveFromCart, onPlaceOrder, onNavigate, onEmailChange, user }) => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    address: '',
    acceptedAccount: true, // Coché par défaut
    paymentMethod: 'delivery' as 'delivery' | 'card', // Paiement à la livraison par défaut
  });
  const [emailError, setEmailError] = useState<string | null>(null);
  const [isValidatingEmail, setIsValidatingEmail] = useState(false);
  const emailDebounceRef = useRef<NodeJS.Timeout | null>(null);
  const [expandedItems, setExpandedItems] = useState<Record<string, boolean>>({});
  const [selectedItemId, setSelectedItemId] = useState<string | null>(null);

  const subtotal = cart.reduce((acc, item) => acc + (item.totalPrice * item.quantity), 0);
  const deliveryFee = 1500;
  const total = subtotal + deliveryFee;

  const isLoggedIn = Boolean(user?.email);

  const selectedItem = selectedItemId ? cart.find((c) => c.recipe.id === selectedItemId) : null;

  useEffect(() => {
    if (!isLoggedIn || !user?.email) return;
    setFormData((prev) => ({
      ...prev,
      email: user.email,
      name: prev.name || user.name || '',
      phone: prev.phone || user.phone || '',
    }));
    if (onEmailChange) onEmailChange(user.email);
  }, [isLoggedIn, user?.email]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    // Valider l'email avant de soumettre
    const trimmedEmail = (isLoggedIn ? user?.email : formData.email).trim();
    if (!trimmedEmail) {
      setEmailError('L\'email est requis');
      return;
    }

    if (!validateEmailFormat(trimmedEmail)) {
      setEmailError('Format d\'email invalide');
      return;
    }

    if (!isLoggedIn) {
      // Vérifier si l'email existe déjà
      setIsValidatingEmail(true);
      try {
        const exists = await checkEmailExists(trimmedEmail);
        if (exists) {
          // L'email existe déjà, c'est OK (l'utilisateur utilisera son compte existant)
          // Pas d'erreur, on continue
        }
      } catch (error) {
        console.error('Error checking email:', error);
        // En cas d'erreur, on continue quand même
      } finally {
        setIsValidatingEmail(false);
      }
    }

    if ((isLoggedIn || formData.acceptedAccount) && formData.address.trim() && !emailError) {
      onPlaceOrder({ 
        email: trimmedEmail, 
        phone: formData.phone, 
        name: formData.name,
        address: formData.address,
      });
    }
  };

  if (cart.length === 0) {
    return (
      <div className="pt-40 pb-24 container mx-auto px-4 text-center">
        <h2 className="text-3xl font-bold mb-4">Votre panier est vide</h2>
        <p className="text-dark/60 mb-8">Commencez par choisir de délicieuses recettes pour votre box.</p>
        <button 
          onClick={() => onNavigate('recipes')}
          className="bg-primary text-white px-8 py-4 rounded-2xl font-bold shadow-lg shadow-primary/20"
        >
          Découvrir nos recettes
        </button>
      </div>
    );
  }

  return (
    <div className="pt-32 pb-24 container mx-auto px-4 md:px-6">
      <button 
        onClick={() => onNavigate('recipes')}
        className="flex items-center gap-2 text-dark/60 hover:text-primary transition-colors mb-8 font-semibold"
      >
        <ArrowLeft size={20} /> Retour aux recettes
      </button>

      <div className="grid lg:grid-cols-3 gap-12">
        {/* Checkout Form */}
        <div className="lg:col-span-2 space-y-8">
          {selectedItem && (
            <motion.section
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              className="bg-white p-8 rounded-[40px] shadow-sm border border-beige"
            >
              <div className="flex items-start justify-between gap-6">
                <div>
                  <h2 className="text-2xl font-black mb-2">{selectedItem.recipe.title}</h2>
                  <p className="text-sm text-dark/60 font-semibold">
                    {selectedItem.recipe.time} • {selectedItem.recipe.calories} • {selectedItem.recipe.category}
                  </p>
                </div>
                <button
                  type="button"
                  onClick={() => setSelectedItemId(null)}
                  className="w-10 h-10 rounded-2xl bg-beige flex items-center justify-center text-dark/60 hover:text-primary transition-colors"
                >
                  <X size={18} />
                </button>
              </div>

              <div className="mt-6 grid md:grid-cols-3 gap-6">
                <div className="md:col-span-1">
                  <div className="rounded-3xl overflow-hidden border border-beige">
                    <img
                      src={selectedItem.recipe.image || `/recipes/${selectedItem.recipe.id}.jpg`}
                      alt={selectedItem.recipe.title}
                      className="w-full h-44 object-cover"
                      loading="lazy"
                      onError={(e) => {
                        const img = e.currentTarget as HTMLImageElement;
                        const fallback = `/recipes/${selectedItem.recipe.id}.jpg`;
                        if (!img.src.endsWith(fallback)) {
                          img.src = fallback;
                        }
                      }}
                    />
                  </div>
                </div>
                <div className="md:col-span-2 space-y-5">
                  <p className="text-dark/70 leading-relaxed">{selectedItem.recipe.description}</p>

                  <div>
                    <h3 className="font-black text-sm uppercase tracking-widest text-primary mb-3">Ingrédients</h3>
                    <div className="grid sm:grid-cols-2 gap-2">
                      {selectedItem.recipe.ingredients.map((ing) => {
                        const selected = selectedItem.selectedIngredients.find((s) => s.id === ing.id);
                        const qty = selected ? selected.selectedQuantity : ing.quantity;
                        return (
                          <div key={ing.id} className="bg-beige/60 rounded-2xl px-4 py-3 flex items-center justify-between gap-3">
                            <span className="font-bold text-sm text-dark/70">{ing.name}</span>
                            <span className="text-xs font-black text-primary">
                              {qty} {ing.unit}
                            </span>
                          </div>
                        );
                      })}
                    </div>
                  </div>

                  <div>
                    <h3 className="font-black text-sm uppercase tracking-widest text-primary mb-3">Préparation</h3>
                    <div className="space-y-3">
                      {selectedItem.recipe.preparation
                        .slice()
                        .sort((a, b) => a.stepNumber - b.stepNumber)
                        .map((step) => (
                          <div key={step.stepNumber} className="bg-white rounded-2xl border border-beige p-4">
                            <p className="text-xs font-black text-primary uppercase tracking-widest mb-2">
                              Étape {step.stepNumber}
                              {step.duration ? ` • ${step.duration}` : ''}
                            </p>
                            <p className="text-sm text-dark/70 leading-relaxed">{step.description}</p>
                          </div>
                        ))}
                    </div>
                  </div>
                </div>
              </div>
            </motion.section>
          )}

          <section className="bg-white p-8 rounded-[40px] shadow-sm border border-beige">
            <h2 className="text-2xl font-bold mb-8 flex items-center gap-3">
              <span className="w-10 h-10 bg-primary text-white rounded-xl flex items-center justify-center text-lg">1</span>
              Informations de Livraison
            </h2>
            <form id="checkout-form" onSubmit={handleSubmit} className="grid sm:grid-cols-2 gap-6">
              <div className="space-y-2">
                <label className="text-sm font-bold text-dark/70 ml-1">Nom complet</label>
                <input 
                  required
                  type="text" 
                  placeholder="Jean Dupont"
                  className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all"
                  value={formData.name}
                  onChange={e => setFormData({...formData, name: e.target.value})}
                />
              </div>
              <div className="space-y-2">
                <label className="text-sm font-bold text-dark/70 ml-1">Email</label>
                <input 
                  required
                  type="email" 
                  placeholder="jean@example.com"
                  className={`w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:outline-none transition-all ${
                    emailError ? 'focus:ring-red-500/20 border-2 border-red-200' : 'focus:ring-primary/20'
                  }`}
                  value={formData.email}
                  disabled={isLoggedIn}
                  onChange={(e) => {
                    const emailValue = e.target.value;
                    setFormData({...formData, email: emailValue});
                    setEmailError(null);

                    // Annuler le debounce précédent
                    if (emailDebounceRef.current) {
                      clearTimeout(emailDebounceRef.current);
                    }

                    // Valider et sauvegarder seulement si l'email est valide et complet
                    if (emailValue.trim()) {
                      // Vérifier le format de l'email
                      if (!validateEmailFormat(emailValue.trim())) {
                        // Email invalide, ne pas sauvegarder encore
                        return;
                      }

                      // Email valide, sauvegarder avec debounce (2 secondes après la dernière frappe)
                      emailDebounceRef.current = setTimeout(() => {
                        const trimmedEmail = emailValue.trim();
                        if (trimmedEmail && validateEmailFormat(trimmedEmail)) {
                          localStorage.setItem('checkout_email', trimmedEmail);
                          // Notifier le parent pour sauvegarder le panier
                          if (onEmailChange) {
                            onEmailChange(trimmedEmail);
                          }
                        }
                      }, 2000);
                    } else {
                      localStorage.removeItem('checkout_email');
                    }
                  }}
                  onBlur={async () => {
                    if (isLoggedIn) return;
                    // Valider l'email quand l'utilisateur quitte le champ
                    const trimmedEmail = formData.email.trim();
                    if (trimmedEmail) {
                      if (!validateEmailFormat(trimmedEmail)) {
                        setEmailError('Format d\'email invalide');
                        return;
                      }

                      // Vérifier si l'email existe déjà (pour information)
                      setIsValidatingEmail(true);
                      try {
                        const exists = await checkEmailExists(trimmedEmail);
                        // Si l'email existe déjà, c'est OK (l'utilisateur pourra utiliser son compte existant)
                        // Pas d'erreur, on laisse continuer
                      } catch (error) {
                        console.error('Error checking email:', error);
                      } finally {
                        setIsValidatingEmail(false);
                      }
                    }
                  }}
                />
                {emailError && (
                  <p className="text-xs text-red-600 font-bold mt-1">{emailError}</p>
                )}
                {isValidatingEmail && (
                  <p className="text-xs text-dark/40 mt-1">Vérification de l'email...</p>
                )}
              </div>
              <div className="space-y-2">
                <label className="text-sm font-bold text-dark/70 ml-1">Téléphone</label>
                <input 
                  required
                  type="tel" 
                  placeholder="+225 07 00 00 00 00"
                  className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all"
                  value={formData.phone}
                  onChange={e => setFormData({...formData, phone: e.target.value})}
                />
              </div>
              <div className="sm:col-span-2 space-y-2">
                <label className="text-sm font-bold text-dark/70 ml-1">Adresse exacte d'Abidjan</label>
                <textarea 
                  required
                  placeholder="Cocody, Riviera 3, Rue de la Paix..."
                  className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all min-h-[100px]"
                  value={formData.address}
                  onChange={e => setFormData({...formData, address: e.target.value})}
                />
              </div>

              {null}
            </form>
          </section>

          <section className="bg-white p-8 rounded-[40px] shadow-sm border border-beige">
            <h2 className="text-2xl font-bold mb-8 flex items-center gap-3">
              <span className="w-10 h-10 bg-primary text-white rounded-xl flex items-center justify-center text-lg">2</span>
              Paiement & Compte
            </h2>
            
            {/* Méthode de paiement - Paiement à la livraison uniquement */}
            <div className="mb-8">
              <div className="bg-primary/5 border-2 border-primary rounded-2xl p-6 flex items-center justify-center gap-3">
                <Truck className="text-primary" size={24} />
                <div className="text-center">
                  <p className="font-bold text-primary text-lg">Paiement à la livraison</p>
                  <p className="text-sm text-dark/60 mt-1">Vous paierez lors de la réception de votre commande</p>
                </div>
              </div>
              <p className="text-xs text-dark/40 text-center mt-3 italic">
                Les paiements par carte et mobile money seront disponibles prochainement
              </p>
            </div>

            {isLoggedIn ? null : (
              <div className="bg-beige/50 p-6 rounded-2xl border border-beige">
                <label className="flex items-start gap-4 cursor-pointer group">
                  <div className="relative flex items-center mt-1">
                    <input 
                      type="checkbox" 
                      required
                      className="w-6 h-6 rounded-lg border-2 border-primary text-primary focus:ring-primary focus:ring-offset-0 transition-all cursor-pointer"
                      checked={formData.acceptedAccount}
                      onChange={e => setFormData({...formData, acceptedAccount: e.target.checked})}
                    />
                  </div>
                  <div className="flex-1">
                    <p className="text-sm md:text-base font-semibold leading-snug text-dark">
                      Un compte client sera automatiquement créé après le paiement afin de vous permettre de suivre vos commandes.
                    </p>
                    <p className="text-xs text-dark/40 mt-1">En cochant cette case, vous acceptez nos CGV et notre politique de confidentialité.</p>
                  </div>
                </label>
              </div>
            )}
          </section>
        </div>

        {/* Order Summary */}
        <div className="lg:col-span-1">
          <div className="bg-white p-8 rounded-[40px] shadow-lg border border-beige sticky top-32">
            <h3 className="text-xl font-bold mb-8">Ma Commande</h3>
            
            <div className="space-y-6 mb-8 max-h-[400px] overflow-y-auto pr-2 custom-scrollbar">
              {cart.map((item) => (
                <div key={item.recipe.id} className="flex gap-4 group">
                  <div className="w-16 h-16 rounded-2xl overflow-hidden flex-shrink-0">
                    <img
                      src={item.recipe.image || `/recipes/${item.recipe.id}.jpg`}
                      className="w-full h-full object-cover"
                      alt={item.recipe.title}
                      loading="lazy"
                      onError={(e) => {
                        const img = e.currentTarget as HTMLImageElement;
                        const fallback = `/recipes/${item.recipe.id}.jpg`;
                        if (!img.src.endsWith(fallback)) {
                          img.src = fallback;
                        }
                      }}
                    />
                  </div>
                  <div className="flex-grow">
                    <h4 className="font-bold text-sm leading-tight mb-1">{item.recipe.title}</h4>
                    <p className="text-xs text-dark/40">
                      Qté: {item.quantity} × {item.totalPrice.toLocaleString()} F
                      {item.totalPrice !== item.recipe.price && (
                        <span className="ml-2 text-primary font-bold">(personnalisé)</span>
                      )}
                    </p>
                    <div className="mt-1 flex items-center gap-2">
                      <p className="text-[10px] text-dark/30">
                        {item.selectedIngredients.length}/{item.recipe.ingredients.length} ingrédients
                      </p>
                      <button
                        type="button"
                        onClick={() => {
                          setExpandedItems((prev) => ({
                            ...prev,
                            [item.recipe.id]: !prev[item.recipe.id],
                          }));
                          setSelectedItemId(item.recipe.id);
                        }}
                        className="text-[10px] font-black uppercase tracking-widest text-primary/70 hover:text-primary transition-colors"
                      >
                        {expandedItems[item.recipe.id] ? 'Masquer' : 'Voir détails'}
                      </button>
                    </div>

                    {expandedItems[item.recipe.id] && (
                      <div className="mt-2 space-y-1">
                        {item.selectedIngredients.map((ing, iIdx) => (
                          <p key={iIdx} className="text-[10px] text-dark/50 leading-snug">
                            <span className="font-bold text-dark/60">{ing.name}</span>
                            {typeof ing.selectedQuantity === 'number' && ing.selectedQuantity > 0 && (
                              <span className="text-dark/40"> — {ing.selectedQuantity} {ing.unit}</span>
                            )}
                          </p>
                        ))}
                      </div>
                    )}
                  </div>
                  <button 
                    onClick={() => onRemoveFromCart(item.recipe.id)}
                    className="text-dark/20 hover:text-red-500 transition-colors"
                  >
                    <Trash2 size={16} />
                  </button>
                </div>
              ))}
            </div>

            <div className="space-y-4 pt-8 border-t border-beige">
              <div className="flex justify-between text-dark/60">
                <span>Sous-total</span>
                <span>{subtotal.toLocaleString()} F CFA</span>
              </div>
              <div className="flex justify-between text-dark/60">
                <span className="flex items-center gap-2">
                  <Truck size={16} /> Livraison Abidjan
                </span>
                <span>{deliveryFee.toLocaleString()} F CFA</span>
              </div>
              <div className="flex justify-between text-2xl font-bold pt-4 border-t border-beige">
                <span>Total</span>
                <span className="text-primary">{total.toLocaleString()} F CFA</span>
              </div>
            </div>

            <button 
              form="checkout-form"
              type="submit"
              disabled={isValidatingEmail}
              className={`w-full mt-10 py-5 rounded-2xl font-bold text-lg shadow-xl transition-all active:scale-95 flex items-center justify-center gap-3 ${!isValidatingEmail ? 'bg-accent text-white shadow-accent/20 hover:bg-orange-600' : 'bg-dark/10 text-dark/30 cursor-not-allowed'}`}
            >
              <ShieldCheck size={24} />
              Payer
            </button>
            <p className="text-center text-[10px] text-dark/30 mt-4 uppercase tracking-widest font-bold">Paiement sécurisé par SSL</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Checkout;
