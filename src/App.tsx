
import React, { useState, useEffect } from 'react';
import Header from './components/Header';
import Footer from './components/Footer';
import Home from './pages/Home';
import Recipes from './pages/Recipes';
import RecipeDetail from './pages/RecipeDetail';
import Cart from './pages/Cart';
import Checkout from './pages/Checkout';
import Dashboard from './pages/Dashboard';
import Login from './pages/Login';
import DashboardAdmin from './pages/DashboardAdmin';
import { Recipe, CartItem, Order, User, SelectedIngredient } from './types';
import { motion, AnimatePresence } from 'framer-motion';
import { upsertUser, createOrder, getOrdersByUserEmail, getRecipes, saveCart, getCart, deleteCart, isAdmin, getUserByEmail, signOut, supabase, supabaseConfigured, isAdminEmail, checkEmailExists } from './lib/supabase';

const App: React.FC = () => {
  const [currentPage, setCurrentPage] = useState('home');
  const [currentParams, setCurrentParams] = useState<any>({});
  const [user, setUser] = useState<User | null>(null);
  const [cart, setCart] = useState<CartItem[]>([]);
  const [orders, setOrders] = useState<Order[]>([]);
  const [lastOrderCreatedAccount, setLastOrderCreatedAccount] = useState<boolean>(false);
  const [lastCreatedOrder, setLastCreatedOrder] = useState<Order | null>(null);
  const [notification, setNotification] = useState<string | null>(null);
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [recipesLoading, setRecipesLoading] = useState(false);

  const downloadOrderPdf = (orderId: string) => {
    const base = String((import.meta as any)?.env?.VITE_API_BASE_URL || '').replace(/\/+$/, '');
    const url = `${base || '/api'}/orders/pdf?id=${encodeURIComponent(orderId)}`;

    try {
      const a = document.createElement('a');
      a.href = url;
      a.download = `commande-${orderId}.pdf`;
      a.style.display = 'none';
      document.body.appendChild(a);
      a.click();
      a.remove();
    } catch {
      window.open(url, '_blank');
    }
  };

  const RECIPES_CACHE_KEY = 'recipes_cache_v3';
  const RECIPES_CACHE_TIMESTAMP_KEY = 'recipes_cache_timestamp_v3';

  // Charger les recettes une seule fois au démarrage (avec cache)
  useEffect(() => {
    const loadRecipesWithCache = async () => {
      try {
        // Vérifier le cache dans localStorage
        const cachedRecipes = localStorage.getItem(RECIPES_CACHE_KEY);
        const cacheTimestamp = localStorage.getItem(RECIPES_CACHE_TIMESTAMP_KEY);
        const CACHE_DURATION = 5 * 60 * 1000; // 5 minutes en millisecondes

        if (cachedRecipes && cacheTimestamp) {
          const now = Date.now();
          const cacheAge = now - parseInt(cacheTimestamp, 10);

          // Si le cache est récent (moins de 5 minutes), l'utiliser
          if (cacheAge < CACHE_DURATION) {
            setRecipes(JSON.parse(cachedRecipes));
            setRecipesLoading(false);
            return;
          }
        }

        // Sinon, charger depuis Supabase
        setRecipesLoading(true);
        const data = await getRecipes();
        setRecipes(data);
        
        // Mettre en cache
        localStorage.setItem(RECIPES_CACHE_KEY, JSON.stringify(data));
        localStorage.setItem(RECIPES_CACHE_TIMESTAMP_KEY, Date.now().toString());
      } catch (error) {
        console.error('Error loading recipes:', error);
        // En cas d'erreur, essayer d'utiliser le cache même s'il est ancien
        const cachedRecipes = localStorage.getItem(RECIPES_CACHE_KEY);
        if (cachedRecipes) {
          setRecipes(JSON.parse(cachedRecipes));
        }
      } finally {
        setRecipesLoading(false);
      }
    };

    loadRecipesWithCache();
  }, []);

  // Restaurer la session au chargement (utilisateur normal ou admin)
  useEffect(() => {
    const savedUser = localStorage.getItem('user');
    
    if (savedUser) {
      try {
        const userData = JSON.parse(savedUser);
        setUser(userData);
        
        // Si l'utilisateur est admin et qu'on n'est pas sur la page admin, y rediriger
        if (isAdmin(userData) && currentPage !== 'admin') {
          setCurrentPage('admin');
        }
        // Si l'utilisateur n'est pas admin et qu'on est sur la page admin, rediriger vers home
        else if (!isAdmin(userData) && currentPage === 'admin') {
          setCurrentPage('home');
        }
      } catch (error) {
        console.error('Error parsing saved user:', error);
      }
    } else {
      // Si pas d'utilisateur et qu'on est sur la page admin, rediriger vers home
      if (currentPage === 'admin') {
        setCurrentPage('home');
      }
    }
  }, []); // Exécuter une seule fois au montage

  useEffect(() => {
    if (!supabaseConfigured || !supabase) return;

    const syncFromSession = async () => {
      const { data } = await supabase.auth.getSession();
      const email = data.session?.user?.email || '';
      if (!email) return;
      try {
        const profile = await getUserByEmail(email);
        const nextUser: User = profile ?? {
          email,
          name: '',
          phone: '',
          role: 'user',
        };
        setUser(nextUser);
        localStorage.setItem('user', JSON.stringify(nextUser));
        if (isAdmin(nextUser)) setCurrentPage('admin');
      } catch {
        // noop
      }
    };

    syncFromSession();

    const { data: sub } = supabase.auth.onAuthStateChange(async (event, session) => {
      const email = session?.user?.email || '';
      if (!email) {
        // IMPORTANT: quand on est en mode "email-only" (sans Auth), il n'y a pas de session Supabase.
        // On ne doit donc PAS déconnecter l'utilisateur sur les événements init / token refresh.
        // On nettoie uniquement lors d'un vrai logout.
        if (event === 'SIGNED_OUT') {
          setUser(null);
          localStorage.removeItem('user');
        }
        return;
      }
      try {
        const profile = await getUserByEmail(email);
        const nextUser: User = profile ?? {
          email,
          name: '',
          phone: '',
          role: 'user',
        };
        setUser(nextUser);
        localStorage.setItem('user', JSON.stringify(nextUser));
        if (!isAdmin(nextUser) && currentPage === 'admin') setCurrentPage('home');
      } catch {
        // noop
      }
    });

    return () => {
      sub.subscription.unsubscribe();
    };
  }, [currentPage]);

  // Charger le panier au démarrage (hybride : localStorage + Supabase)
  useEffect(() => {
    const loadCart = async () => {
      // 1. D'abord charger depuis localStorage (rapide)
      const savedCart = localStorage.getItem('cart');
      if (savedCart) {
        try {
          const cartData = JSON.parse(savedCart);
          setCart(cartData);
        } catch (error) {
          console.error('Error parsing saved cart:', error);
        }
      }

      // 2. Si un utilisateur est connecté, charger depuis Supabase (synchronisation)
      const savedUser = localStorage.getItem('user');
      if (savedUser) {
        try {
          const userData = JSON.parse(savedUser);
          setUser(userData);
          
          // Charger le panier depuis Supabase
          const supabaseCart = await getCart(userData.email);
          if (supabaseCart.length > 0) {
            // Si Supabase a un panier, l'utiliser (plus récent)
            setCart(supabaseCart);
            // Synchroniser avec localStorage
            localStorage.setItem('cart', JSON.stringify(supabaseCart));
          } else if (savedCart) {
            // Si pas de panier dans Supabase mais un dans localStorage, sauvegarder dans Supabase
            const cartData = JSON.parse(savedCart);
            if (cartData.length > 0) {
              await saveCart(cartData, userData.email);
            }
          }
          
          // Vérifier aussi si un panier existe avec l'email du checkout (avant création du compte)
          const checkoutEmail = localStorage.getItem('checkout_email');
          if (checkoutEmail && checkoutEmail === userData.email) {
            const checkoutCart = await getCart(checkoutEmail);
            if (checkoutCart.length > 0 && checkoutCart.length > (supabaseCart.length || 0)) {
              // Si le panier du checkout est plus récent, l'utiliser
              setCart(checkoutCart);
              localStorage.setItem('cart', JSON.stringify(checkoutCart));
              // Migrer vers le user_id
              await saveCart(checkoutCart, userData.email);
            }
            // Nettoyer l'email du checkout
            localStorage.removeItem('checkout_email');
          }
          
          // Charger les commandes depuis Supabase
          loadUserOrders(userData.email);
        } catch (error) {
          console.error('Error loading user data:', error);
        }
      }
    };

    loadCart();
  }, []);

  // Sauvegarder le panier (hybride : localStorage + Supabase)
  useEffect(() => {
    // Ne pas écraser un panier existant avec un panier vide.
    // Objectif: après commande (ou refresh), éviter que le panier devienne vide par erreur.
    if (cart.length === 0) return;

    // Sauvegarder dans localStorage immédiatement (performance)
    localStorage.setItem('cart', JSON.stringify(cart));
    
    // Sauvegarder dans Supabase de manière asynchrone (persistance)
    // On peut sauvegarder avec l'email même si le compte n'existe pas encore
    const emailToUse = user?.email || localStorage.getItem('checkout_email');
    
    if (emailToUse && cart.length > 0) {
      // Délai pour éviter trop de requêtes (debounce)
      const timeoutId = setTimeout(() => {
        saveCart(cart, emailToUse).catch(error => {
          console.error('Error saving cart to Supabase:', error);
        });
      }, 1000); // Attendre 1 seconde après le dernier changement

      return () => clearTimeout(timeoutId);
    }
  }, [cart, user]);
  useEffect(() => {
    if (user) {
      localStorage.setItem('user', JSON.stringify(user));
      // Recharger les commandes quand l'utilisateur change
      loadUserOrders(user.email);
    }
  }, [user]);

  // Fonction pour charger les commandes depuis Supabase
  const loadUserOrders = async (email: string) => {
    try {
      const userOrders = await getOrdersByUserEmail(email);
      setOrders(userOrders);
    } catch (error) {
      console.error('Error loading orders:', error);
      // En cas d'erreur, on garde les commandes du localStorage si elles existent
      const savedOrders = localStorage.getItem('orders');
      if (savedOrders) setOrders(JSON.parse(savedOrders));
    }
  };

  // Si l'utilisateur a déjà des commandes mais que le panier est vide (ex: nouvel appareil / localStorage vidé),
  // on restaure le panier depuis la dernière commande.
  useEffect(() => {
    const email = user?.email;
    if (!email) return;
    if (cart.length > 0) return;
    if (orders.length === 0) return;

    const last = orders[0];
    const items = (last as any)?.items;
    if (!Array.isArray(items) || items.length === 0) return;

    setCart(items);
    localStorage.setItem('cart', JSON.stringify(items));
    saveCart(items, email).catch(() => {
      // Ne pas bloquer si la persistance échoue
    });
  }, [orders, user?.email, cart.length]);

  const handleNavigate = (page: string, params?: any) => {
    setCurrentPage(page);
    setCurrentParams(params);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const showNotification = (message: string) => {
    setNotification(message);
    setTimeout(() => setNotification(null), 3000);
  };

  // Ajout au panier (soit un kit par défaut, soit un item personnalisé)
  const handleAddToCart = (item: Recipe | CartItem) => {
    let cartItem: CartItem;

    if ('selectedIngredients' in item) {
      // C'est déjà un CartItem (personnalisé depuis RecipeDetail)
      cartItem = item;
    } else {
      // C'est une Recipe (ajout direct depuis la liste)
      const selectedIngs: SelectedIngredient[] = item.ingredients.map(ing => ({
        ...ing,
        selected: true,
        selectedQuantity: ing.quantity
      }));
      cartItem = {
        recipe: item,
        selectedIngredients: selectedIngs,
        totalPrice: item.price,
        quantity: 1,
        personsCount: 2,
        recipesCount: 1,
      };
    }

    setCart(prev => {
      // Pour simplifier, on traite chaque ajout comme un nouvel item unique si les ingrédients diffèrent,
      // ou on incrémente si c'est exactement la même recette sans changement.
      // Ici, on va juste ajouter au panier.
      return [...prev, cartItem];
    });
    showNotification(`${cartItem.recipe.title} ajouté au panier !`);
    // Après ajout, rediriger directement vers le panier/checkout
    handleNavigate('cart');
  };

  const handleRemoveFromCart = (index: number) => {
    setCart(prev => prev.filter((_, i) => i !== index));
  };

  const handlePlaceOrder = async (userData: { email: string; phone: string; name: string; address: string }) => {
    try {
      showNotification('Traitement de votre commande...');
      
      // 1. Mode email-only: on met à jour le profil uniquement.
      const isAlreadyLoggedInForEmail = Boolean(user?.email && user.email.trim().toLowerCase() === userData.email.trim().toLowerCase());

      let nextUser: User;
      if (isAlreadyLoggedInForEmail && user) {
        nextUser = user;
        setLastOrderCreatedAccount(false);
      } else {
        let existedBefore = false;
        try {
          existedBefore = await checkEmailExists(userData.email);
        } catch {
          // If check fails, assume it existed to avoid showing a misleading message.
          existedBefore = true;
        }
        nextUser = await upsertUser({
          email: userData.email,
          phone: userData.phone,
          name: userData.name,
        });
        setLastOrderCreatedAccount(!existedBefore);
      }
      setUser(nextUser);
      localStorage.setItem('user', JSON.stringify(nextUser));
      
      // Migrer le panier vers le user_id maintenant que le compte existe
      // Le panier était peut-être sauvegardé avec juste l'email
      if (cart.length > 0) {
        await saveCart(cart, userData.email);
      }

      // 2. Calculer le total
      const subtotal = cart.reduce((acc, item) => acc + (item.totalPrice * item.quantity), 0);
      const total = subtotal + 1500;

      // 3. Créer la commande dans Supabase
      const newOrder = await createOrder(
        userData.email,
        cart,
        userData.address,
        total,
        {
          name: userData.name,
          phone: userData.phone,
        }
      );

      // 4. Mettre à jour l'état local
      setLastCreatedOrder(newOrder);
      setOrders(prev => [newOrder, ...prev]);
      // IMPORTANT: ne pas vider le panier après commande (le client veut le conserver)

      showNotification('Commande créée avec succès !');
      handleNavigate('success');
    } catch (error) {
      console.error('Error placing order:', error);
      const msg = (error as any)?.message ? String((error as any).message) : 'Erreur lors de la création de la commande. Veuillez réessayer.';
      // Eviter d'afficher des messages trop techniques, mais garder l'info utile
      if (msg.toLowerCase().includes('email') && msg.toLowerCase().includes('confirm')) {
        showNotification('Email non confirmé: vérifiez votre boîte mail ou désactivez la confirmation email dans Supabase.');
      } else if (msg.toLowerCase().includes('invalid login credentials')) {
        showNotification('Mot de passe incorrect pour cet email.');
      } else {
        showNotification(msg);
      }
    }
  };

  const handleRefreshOrders = async () => {
    if (user) {
      await loadUserOrders(user.email);
    }
  };

  const handleLogin = async (userData: User) => {
    setUser(userData);
    localStorage.setItem('user', JSON.stringify(userData));
    if (isAdmin(userData)) {
      localStorage.setItem('admin_email', userData.email);
    } else {
      localStorage.removeItem('admin_email');
    }
    // Charger les commandes et le panier
    await loadUserOrders(userData.email);
    // Charger le panier depuis Supabase
    const supabaseCart = await getCart(userData.email);
    if (supabaseCart.length > 0) {
      setCart(supabaseCart);
      localStorage.setItem('cart', JSON.stringify(supabaseCart));
    }
  };

  const handleAdminLogin = async (email: string) => {
    const emailTrimmed = email.trim();
    const allowed = await isAdminEmail(emailTrimmed);
    if (!allowed) return;

    localStorage.setItem('admin_email', emailTrimmed);

    // Récupérer le profil si existant (pour name/phone/role)
    const profile = await getUserByEmail(emailTrimmed);

    const adminUser: User = profile
      ? ({ ...profile, role: 'admin' } as User)
      : {
          email: emailTrimmed,
          name: '',
          phone: '',
          role: 'admin',
        };

    setUser(adminUser);
    localStorage.setItem('user', JSON.stringify(adminUser));

    // Charger les commandes et le panier (si le profil n'existe pas en DB, ces appels renverront vide)
    await loadUserOrders(adminUser.email);
    const supabaseCart = await getCart(adminUser.email);
    if (supabaseCart.length > 0) {
      setCart(supabaseCart);
      localStorage.setItem('cart', JSON.stringify(supabaseCart));
    }
  };

  const handleLogout = () => {
    // Déconnecter aussi Supabase Auth si configuré
    signOut().catch(() => {
      // Ne pas bloquer le logout si l'appel échoue
    });
    setUser(null);
    setOrders([]);
    localStorage.removeItem('user');
    localStorage.removeItem('admin_email');
    localStorage.removeItem('checkout_email');
    handleNavigate('home');
  };

  // Fonction pour forcer le rafraîchissement des recettes
  const refreshRecipes = async () => {
    try {
      setRecipesLoading(true);
      const data = await getRecipes();
      setRecipes(data);
      // Mettre à jour le cache
      localStorage.setItem(RECIPES_CACHE_KEY, JSON.stringify(data));
      localStorage.setItem(RECIPES_CACHE_TIMESTAMP_KEY, Date.now().toString());
    } catch (error) {
      console.error('Error refreshing recipes:', error);
    } finally {
      setRecipesLoading(false);
    }
  };

  const renderPage = () => {
    switch (currentPage) {
      case 'home': return <Home onNavigate={handleNavigate} recipes={recipes} />;
      case 'recipes': return <Recipes recipes={recipes} loading={recipesLoading} onAddToCart={(item) => { handleAddToCart(item); }} onNavigate={handleNavigate} onRefresh={refreshRecipes} />;
      case 'recipe-detail': return <RecipeDetail recipe={currentParams.recipe} recipes={recipes} onRefreshRecipes={refreshRecipes} onAddToCart={(item) => { handleAddToCart(item); }} onBack={() => handleNavigate('recipes')} />;
      case 'cart': return <Cart cart={cart} onRemoveFromCart={(id) => setCart((prev) => prev.filter((c) => c.recipe.id !== id))} onNavigate={handleNavigate} />;
      case 'checkout': return <Checkout user={user} cart={cart} onRemoveFromCart={(id) => handleRemoveFromCart(cart.findIndex(i => i.recipe.id === id))} onPlaceOrder={handlePlaceOrder} onNavigate={handleNavigate} onEmailChange={(email) => {
        // Sauvegarder le panier dans Supabase dès que l'email est saisi
        if (email && cart.length > 0) {
          saveCart(cart, email).catch(error => {
            console.error('Error saving cart:', error);
          });
        }
      }} />;
      case 'login': return <Login onLogin={handleLogin} onAdminLogin={handleAdminLogin} onBack={() => handleNavigate('home')} onNavigate={handleNavigate} />;
      case 'dashboard': return <Dashboard user={user} orders={orders} onLogout={handleLogout} onNavigate={handleNavigate} onRefreshOrders={handleRefreshOrders} />;
      case 'admin': {
        // Vérifier que l'utilisateur est bien admin
        if (!user || !isAdmin(user)) {
          // Si pas admin, rediriger vers home
          handleNavigate('home');
          return null;
        }
        return <DashboardAdmin user={user} onLogout={handleLogout} onNavigate={handleNavigate} onRefreshRecipes={refreshRecipes} />;
      }
      case 'success': return (
        <div className="pt-40 pb-24 container mx-auto px-4 text-center">
          <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} className="w-24 h-24 bg-primary text-white rounded-full flex items-center justify-center mx-auto mb-8 shadow-2xl shadow-primary/40">
            <svg className="w-12 h-12" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={4} d="M5 13l4 4L19 7" /></svg>
          </motion.div>
          <h1 className="text-4xl font-black mb-4 tracking-tight">C'est validé !</h1>
          <p className="text-xl text-dark/60 mb-2">Merci pour votre confiance.</p>
          <p className="text-sm text-dark/40 mb-12">
            {lastOrderCreatedAccount
              ? 'Votre compte a été créé. Vous pouvez suivre votre commande dans votre espace.'
              : 'Vous pouvez suivre votre commande dans votre espace.'}
          </p>
          <div className="flex flex-col sm:flex-row justify-center gap-4">
            {lastCreatedOrder && (
              <button
                onClick={() => void downloadOrderPdf(String(lastCreatedOrder.id))}
                className="bg-white text-dark/60 px-10 py-4 rounded-2xl font-black border border-beige"
              >
                Télécharger PDF
              </button>
            )}
            <button onClick={() => handleNavigate('dashboard')} className="bg-primary text-white px-10 py-4 rounded-2xl font-black shadow-lg shadow-primary/20">Accéder à mon espace</button>
            <button onClick={() => handleNavigate('home')} className="bg-white text-dark/60 px-10 py-4 rounded-2xl font-black border border-beige">Retour à l'accueil</button>
          </div>
        </div>
      );
      default: return <Home onNavigate={handleNavigate} />;
    }
  };

  return (
    <div className="min-h-screen bg-beige selection:bg-primary/20 overflow-x-hidden max-w-full">
      <Header onNavigate={handleNavigate} currentPage={currentPage} cartCount={cart.length} user={user} onLogout={handleLogout} />
      <main className="min-h-[80vh] overflow-x-hidden max-w-full">
        <AnimatePresence mode="wait">
          <motion.div key={currentPage} initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} transition={{ duration: 0.3 }}>
            {renderPage()}
          </motion.div>
        </AnimatePresence>
      </main>
      <Footer />
      <AnimatePresence>
        {notification && (
          <motion.div initial={{ opacity: 0, y: 50, x: '-50%' }} animate={{ opacity: 1, y: 0, x: '-50%' }} exit={{ opacity: 0, y: 20, x: '-50%' }} className="fixed bottom-10 left-1/2 -translate-x-1/2 z-[60] bg-dark text-white px-8 py-4 rounded-2xl shadow-2xl flex items-center gap-3 border border-white/10">
            <div className="w-2 h-2 rounded-full bg-primary" />
            <span className="font-bold text-sm">{notification}</span>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
};

export default App;
