import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { 
  Package, 
  LogOut, 
  ArrowLeft,
  Plus,
  Edit,
  Trash2,
  Users,
  ShoppingBag,
  ChefHat,
  CheckCircle,
  Clock,
  XCircle,
  Search,
  Save,
  X,
  Mail,
  Phone,
  MapPin,
  Truck,
  User as UserIcon,
  List,
  ChefHat as ChefHatIcon
} from 'lucide-react';
import { Order, Recipe, User, Ingredient, PreparationStep } from '../types';
import { 
  getAllOrders, 
  updateOrderStatus, 
  getAllUsers, 
  deleteUser,
  getRecipes,
  createRecipe,
  updateRecipe,
  deleteRecipe,
  isAdmin
} from '../lib/supabase';

const getRecipeImageSrc = (recipe: Recipe): string => {
  const raw = String((recipe as any)?.image || '').trim();
  return raw ? raw : `/recipes/${recipe.id}.jpg`;
};

interface DashboardAdminProps {
  onLogout: () => void;
  onNavigate: (page: string) => void;
  onRefreshRecipes: () => void;
  user?: User | null;
}

type Tab = 'orders' | 'recipes' | 'users';

const DashboardAdmin: React.FC<DashboardAdminProps> = ({ onLogout, onNavigate, onRefreshRecipes, user }) => {
  const [activeTab, setActiveTab] = useState<Tab>('orders');
  const [orders, setOrders] = useState<(Order & { user?: User; deliveryAddress?: string })[]>([]);
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [showRecipeForm, setShowRecipeForm] = useState(false);
  const [editingRecipe, setEditingRecipe] = useState<Recipe | null>(null);
  const [notification, setNotification] = useState<string | null>(null);
  const [selectedOrderId, setSelectedOrderId] = useState<string | null>(null);

  useEffect(() => {
    loadData();
  }, [activeTab]);

  const loadData = async () => {
    setLoading(true);
    try {
      if (activeTab === 'orders') {
        const data = await getAllOrders();
        setOrders(data);
      } else if (activeTab === 'recipes') {
        const data = await getRecipes();
        setRecipes(data);
      } else if (activeTab === 'users') {
        const data = await getAllUsers();
        setUsers(data);
      }
    } catch (error) {
      console.error('Error loading data:', error);
      const msg = (error as any)?.message ? String((error as any).message) : 'Erreur lors du chargement des données';
      showNotification(`Erreur: ${msg}`);
    } finally {
      setLoading(false);
    }
  };

  const showNotification = (message: string) => {
    setNotification(message);
    setTimeout(() => setNotification(null), 3000);
  };

  const handleUpdateOrderStatus = async (orderId: string, status: 'pending' | 'processing' | 'delivered') => {
    try {
      await updateOrderStatus(orderId, status);
      await loadData();
      showNotification('Statut de la commande mis à jour');
    } catch (error) {
      console.error('Error updating order status:', error);
      showNotification('Erreur lors de la mise à jour');
    }
  };

  const handleDeleteUser = async (email: string) => {
    if (!confirm(`Êtes-vous sûr de vouloir supprimer l'utilisateur ${email} ?`)) return;
    
    try {
      await deleteUser(email);
      await loadData();
      showNotification('Utilisateur supprimé');
    } catch (error) {
      console.error('Error deleting user:', error);
      showNotification('Erreur lors de la suppression');
    }
  };

  const handleDeleteRecipe = async (recipeId: string) => {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette recette ?')) return;
    
    try {
      await deleteRecipe(recipeId);
      await loadData();
      onRefreshRecipes();
      showNotification('Recette supprimée');
    } catch (error) {
      console.error('Error deleting recipe:', error);
      showNotification('Erreur lors de la suppression');
    }
  };

  const handleSaveRecipe = async (recipeData: Omit<Recipe, 'id'> | Recipe) => {
    try {
      setLoading(true);
      if (editingRecipe) {
        await updateRecipe(recipeData as Recipe);
        showNotification('Recette mise à jour avec succès');
      } else {
        await createRecipe(recipeData as Omit<Recipe, 'id'>);
        showNotification('Recette créée avec succès');
      }
      setShowRecipeForm(false);
      setEditingRecipe(null);
      await loadData();
      onRefreshRecipes();
    } catch (error: any) {
      console.error('Error saving recipe:', error);
      const errorMessage = error?.message || 'Erreur lors de la sauvegarde';
      showNotification(`Erreur: ${errorMessage}`);
    } finally {
      setLoading(false);
    }
  };

  const filteredOrders = orders.filter(order => 
    order.user?.email?.toLowerCase().includes(searchTerm.toLowerCase()) ||
    order.user?.name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
    order.id.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const filteredRecipes = recipes.filter(recipe =>
    recipe.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
    recipe.category.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const filteredUsers = users.filter(user =>
    user.email.toLowerCase().includes(searchTerm.toLowerCase()) ||
    user.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'delivered': return 'bg-green-100 text-green-800';
      case 'processing': return 'bg-blue-100 text-blue-800';
      default: return 'bg-yellow-100 text-yellow-800';
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'delivered': return <CheckCircle size={16} />;
      case 'processing': return <Clock size={16} />;
      default: return <XCircle size={16} />;
    }
  };

  return (
    <div className="pt-32 pb-24 bg-beige min-h-screen">
      <div className="container mx-auto px-4 md:px-6">
        {/* Header */}
        <div className="flex items-center justify-between mb-8">
          <div className="flex items-center gap-4">
            <button
              onClick={() => onNavigate('home')}
              className="p-2 rounded-xl hover:bg-white/50 transition-colors"
            >
              <ArrowLeft size={24} className="text-dark/60" />
            </button>
            <div>
              <h1 className="text-3xl font-black text-dark">Dashboard Admin</h1>
              <p className="text-dark/60 text-sm">Gestion de la plateforme</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            {user && isAdmin(user) && (
              <button
                onClick={() => onNavigate('dashboard')}
                className="flex items-center gap-2 px-4 py-2 bg-primary/10 text-primary rounded-xl font-bold text-sm hover:bg-primary/20 transition-colors"
              >
                <UserIcon size={18} />
                Dashboard Utilisateur
              </button>
            )}
            <button
              onClick={onLogout}
              className="flex items-center gap-2 px-4 py-2 bg-red-500 text-white rounded-xl font-bold text-sm hover:bg-red-600 transition-colors"
            >
              <LogOut size={18} />
              Déconnexion
            </button>
          </div>
        </div>

        {/* Tabs */}
        <div className="flex gap-2 mb-6 bg-white p-2 rounded-2xl shadow-lg">
          <button
            onClick={() => setActiveTab('orders')}
            className={`flex-1 flex items-center justify-center gap-2 py-3 rounded-xl font-bold transition-all ${
              activeTab === 'orders'
                ? 'bg-primary text-white shadow-lg'
                : 'text-dark/60 hover:text-primary'
            }`}
          >
            <ShoppingBag size={20} />
            Commandes ({orders.length})
          </button>
          <button
            onClick={() => setActiveTab('recipes')}
            className={`flex-1 flex items-center justify-center gap-2 py-3 rounded-xl font-bold transition-all ${
              activeTab === 'recipes'
                ? 'bg-primary text-white shadow-lg'
                : 'text-dark/60 hover:text-primary'
            }`}
          >
            <ChefHat size={20} />
            Recettes ({recipes.length})
          </button>
          <button
            onClick={() => setActiveTab('users')}
            className={`flex-1 flex items-center justify-center gap-2 py-3 rounded-xl font-bold transition-all ${
              activeTab === 'users'
                ? 'bg-primary text-white shadow-lg'
                : 'text-dark/60 hover:text-primary'
            }`}
          >
            <Users size={20} />
            Utilisateurs ({users.length})
          </button>
        </div>

        {/* Search */}
        <div className="mb-6 relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-dark/40" size={20} />
          <input
            type="text"
            placeholder="Rechercher..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-12 pr-4 py-3 rounded-xl bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none shadow-lg"
          />
        </div>

        {/* Notification */}
        {notification && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="mb-6 bg-primary text-white p-4 rounded-xl font-bold text-center"
          >
            {notification}
          </motion.div>
        )}

        {/* Content */}
        {loading ? (
          <div className="text-center py-20">
            <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-4" />
            <p className="text-dark/60">Chargement...</p>
          </div>
        ) : (
          <>
            {/* Orders Tab */}
            {activeTab === 'orders' && (
              <>
                {selectedOrderId ? (
                  <OrderDetailView
                    order={filteredOrders.find(o => o.id === selectedOrderId)!}
                    onBack={() => setSelectedOrderId(null)}
                    onUpdateStatus={handleUpdateOrderStatus}
                  />
                ) : (
                  <div className="space-y-4">
                    {filteredOrders.length === 0 ? (
                      <div className="text-center py-20 bg-white rounded-2xl">
                        <Package size={48} className="text-dark/20 mx-auto mb-4" />
                        <p className="text-dark/60">Aucune commande</p>
                      </div>
                    ) : (
                      filteredOrders.map((order) => {
                        const items = ((order as any)?.items ?? []) as any[];

                        return (
                          <motion.div
                            key={order.id}
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            className="bg-white p-6 rounded-2xl shadow-lg cursor-pointer hover:shadow-xl transition-all"
                            onClick={() => setSelectedOrderId(order.id)}
                          >
                            <div className="flex items-start justify-between mb-4">
                              <div className="flex-1">
                                <h3 className="text-lg font-black text-dark mb-1">Commande #{order.id.slice(0, 8)}</h3>
                                <p className="text-sm text-dark/60">
                                  {order.user?.name} - {order.user?.email}
                                </p>
                                <p className="text-sm text-dark/60">{order.deliveryAddress}</p>
                                <p className="text-sm font-bold text-primary mt-2">
                                  {new Date(order.date).toLocaleDateString('fr-FR')} - {order.total.toLocaleString()} FCFA
                                </p>
                              </div>
                              <div className={`px-3 py-1 rounded-full flex items-center gap-2 font-bold text-sm ${getStatusColor(order.status)}`}>
                                {getStatusIcon(order.status)}
                                {order.status === 'delivered' ? 'Livrée' : order.status === 'processing' ? 'En cours' : 'En attente'}
                              </div>
                            </div>
                            <div className="mb-4">
                              <p className="text-sm font-bold text-dark/80 mb-2">Articles ({items.length})</p>
                              <div className="space-y-2">
                                {items.slice(0, 2).map((item: any, idx: number) => (
                                  <div key={idx} className="flex items-center gap-3 p-2 bg-beige rounded-xl">
                                    <img
                                      src={getRecipeImageSrc(item.recipe)}
                                      alt={item.recipe.title}
                                      loading="lazy"
                                      className="w-12 h-12 rounded-lg object-cover"
                                      onError={(e) => {
                                        const img = e.currentTarget as HTMLImageElement;
                                        const fallback = `/recipes/${item.recipe.id}.jpg`;
                                        if (!img.src.endsWith(fallback)) img.src = fallback;
                                      }}
                                    />
                                    <div className="flex-1">
                                      <p className="font-bold text-sm">{item.recipe.title}</p>
                                      <p className="text-xs text-dark/60">
                                        {(item.recipesCount ? `${item.recipesCount} recette(s)` : 'Recette')}
                                        {' • '}
                                        {(item.personsCount ? `${item.personsCount} personne(s)` : '2 personne(s)')}
                                        {' • '}
                                        {item.totalPrice.toLocaleString()} FCFA
                                      </p>
                                    </div>
                                  </div>
                                ))}
                                {items.length > 2 && (
                                  <p className="text-xs text-dark/40 text-center py-2">+ {items.length - 2} autre(s) article(s)</p>
                                )}
                              </div>
                            </div>
                            <div className="flex gap-2">
                              <button
                                onClick={(e) => {
                                  e.stopPropagation();
                                  handleUpdateOrderStatus(order.id, 'pending');
                                }}
                                className={`flex-1 py-2 rounded-xl font-bold text-sm transition-all ${
                                  order.status === 'pending'
                                    ? 'bg-yellow-500 text-white'
                                    : 'bg-yellow-100 text-yellow-800 hover:bg-yellow-200'
                                }`}
                              >
                                En attente
                              </button>
                              <button
                                onClick={(e) => {
                                  e.stopPropagation();
                                  handleUpdateOrderStatus(order.id, 'processing');
                                }}
                                className={`flex-1 py-2 rounded-xl font-bold text-sm transition-all ${
                                  order.status === 'processing'
                                    ? 'bg-blue-500 text-white'
                                    : 'bg-blue-100 text-blue-800 hover:bg-blue-200'
                                }`}
                              >
                                En cours
                              </button>
                              <button
                                onClick={(e) => {
                                  e.stopPropagation();
                                  handleUpdateOrderStatus(order.id, 'delivered');
                                }}
                                className={`flex-1 py-2 rounded-xl font-bold text-sm transition-all ${
                                  order.status === 'delivered'
                                    ? 'bg-green-500 text-white'
                                    : 'bg-green-100 text-green-800 hover:bg-green-200'
                                }`}
                              >
                                Livrée
                              </button>
                            </div>
                            <div className="mt-4 pt-4 border-t border-beige text-center">
                              <p className="text-xs text-dark/40">Cliquez pour voir les détails complets</p>
                            </div>
                          </motion.div>
                        );
                      })
                    )}
                  </div>
                )}
              </>
            )}

            {/* Recipes Tab */}
            {activeTab === 'recipes' && (
              <div className="space-y-4">
                <div className="flex justify-end mb-4">
                  <button
                    onClick={() => {
                      setEditingRecipe(null);
                      setShowRecipeForm(true);
                    }}
                    className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-xl font-bold hover:bg-red-900 transition-colors"
                  >
                    <Plus size={18} />
                    Ajouter une recette
                  </button>
                </div>
                {filteredRecipes.length === 0 ? (
                  <div className="text-center py-20 bg-white rounded-2xl">
                    <ChefHat size={48} className="text-dark/20 mx-auto mb-4" />
                    <p className="text-dark/60">Aucune recette</p>
                  </div>
                ) : (
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {filteredRecipes.map((recipe) => (
                      <motion.div
                        key={recipe.id}
                        initial={{ opacity: 0, scale: 0.9 }}
                        animate={{ opacity: 1, scale: 1 }}
                        className="bg-white rounded-2xl shadow-lg overflow-hidden"
                      >
                        <img
                          src={getRecipeImageSrc(recipe)}
                          alt={recipe.title}
                          loading="lazy"
                          className="w-full h-48 object-cover"
                          onError={(e) => {
                            const img = e.currentTarget as HTMLImageElement;
                            const fallback = `/recipes/${recipe.id}.jpg`;
                            if (!img.src.endsWith(fallback)) img.src = fallback;
                          }}
                        />
                        <div className="p-4">
                          <h3 className="font-black text-lg mb-2">{recipe.title}</h3>
                          <p className="text-sm text-dark/60 mb-3">{recipe.description}</p>
                          <div className="flex items-center justify-between mb-4">
                            <span className="text-primary font-black">{recipe.price.toLocaleString()} FCFA</span>
                            <span className="text-xs text-dark/40">{recipe.time}</span>
                          </div>
                          <div className="flex gap-2">
                            <button
                              onClick={() => {
                                setEditingRecipe(recipe);
                                setShowRecipeForm(true);
                              }}
                              className="flex-1 py-2 bg-blue-100 text-blue-800 rounded-xl font-bold text-sm hover:bg-blue-200 transition-colors flex items-center justify-center gap-2"
                            >
                              <Edit size={16} />
                              Modifier
                            </button>
                            <button
                              onClick={() => handleDeleteRecipe(recipe.id)}
                              className="flex-1 py-2 bg-red-100 text-red-800 rounded-xl font-bold text-sm hover:bg-red-200 transition-colors flex items-center justify-center gap-2"
                            >
                              <Trash2 size={16} />
                              Supprimer
                            </button>
                          </div>
                        </div>
                      </motion.div>
                    ))}
                  </div>
                )}
              </div>
            )}

            {/* Users Tab */}
            {activeTab === 'users' && (
              <div className="space-y-4">
                {filteredUsers.length === 0 ? (
                  <div className="text-center py-20 bg-white rounded-2xl">
                    <Users size={48} className="text-dark/20 mx-auto mb-4" />
                    <p className="text-dark/60">Aucun utilisateur</p>
                  </div>
                ) : (
                  filteredUsers.map((user) => (
                    <motion.div
                      key={user.email}
                      initial={{ opacity: 0, y: 20 }}
                      animate={{ opacity: 1, y: 0 }}
                      className="bg-white p-6 rounded-2xl shadow-lg flex items-center justify-between"
                    >
                      <div>
                        <h3 className="font-black text-lg mb-1">{user.name}</h3>
                        <p className="text-sm text-dark/60">{user.email}</p>
                        <p className="text-sm text-dark/60">{user.phone}</p>
                      </div>
                      <button
                        onClick={() => handleDeleteUser(user.email)}
                        className="px-4 py-2 bg-red-100 text-red-800 rounded-xl font-bold text-sm hover:bg-red-200 transition-colors flex items-center gap-2"
                      >
                        <Trash2 size={16} />
                        Supprimer
                      </button>
                    </motion.div>
                  ))
                )}
              </div>
            )}
          </>
        )}

        {/* Recipe Form Modal */}
        {showRecipeForm && (
          <RecipeFormModal
            recipe={editingRecipe}
            onSave={handleSaveRecipe}
            onClose={() => {
              setShowRecipeForm(false);
              setEditingRecipe(null);
            }}
          />
        )}
      </div>
    </div>
  );
};

// Composant pour le formulaire de recette
interface RecipeFormModalProps {
  recipe: Recipe | null;
  onSave: (recipe: Omit<Recipe, 'id'> | Recipe) => void;
  onClose: () => void;
}

const RecipeFormModal: React.FC<RecipeFormModalProps> = ({ recipe, onSave, onClose }) => {
  const [saving, setSaving] = useState(false);
  const [formData, setFormData] = useState({
    title: recipe?.title || '',
    description: recipe?.description || '',
    image: recipe?.image || '',
    price: recipe?.price || 0,
    time: recipe?.time || '',
    calories: recipe?.calories || '',
    category: recipe?.category || '',
    tags: recipe?.tags.join(', ') || '',
  });

  const [ingredients, setIngredients] = useState<Omit<Ingredient, 'id'>[]>(
    recipe?.ingredients.map(ing => ({
      name: ing.name,
      unit: ing.unit,
      quantity: ing.quantity,
      pricePerUnit: ing.pricePerUnit,
      image: ing.image,
    })) || []
  );

  const [preparationSteps, setPreparationSteps] = useState<Omit<PreparationStep, 'stepNumber'>[]>(
    recipe?.preparation.map(step => ({
      description: step.description,
      duration: step.duration,
    })) || []
  );

  const addIngredient = () => {
    setIngredients([...ingredients, { name: '', unit: 'g', quantity: 0, pricePerUnit: undefined }]);
  };

  const removeIngredient = (index: number) => {
    setIngredients(ingredients.filter((_, i) => i !== index));
  };

  const updateIngredient = (index: number, field: keyof Omit<Ingredient, 'id'>, value: any) => {
    const updated = [...ingredients];
    updated[index] = { ...updated[index], [field]: value };
    setIngredients(updated);
  };

  const addPreparationStep = () => {
    setPreparationSteps([...preparationSteps, { description: '', duration: undefined }]);
  };

  const removePreparationStep = (index: number) => {
    setPreparationSteps(preparationSteps.filter((_, i) => i !== index));
  };

  const updatePreparationStep = (index: number, field: keyof Omit<PreparationStep, 'stepNumber'>, value: any) => {
    const updated = [...preparationSteps];
    updated[index] = { ...updated[index], [field]: value };
    setPreparationSteps(updated);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    // Validation basique
    // Ingrédients et étapes peuvent être vides.
    // En revanche, si l'utilisateur en a ajouté, on valide les champs nécessaires.
    const invalidIngredients = ingredients.filter((ing) => !ing.name.trim());
    if (ingredients.length > 0 && invalidIngredients.length > 0) {
      alert('Veuillez remplir le nom de tous les ingrédients');
      return;
    }

    const invalidSteps = preparationSteps.filter((step) => !step.description.trim());
    if (preparationSteps.length > 0 && invalidSteps.length > 0) {
      alert('Veuillez remplir la description de toutes les étapes');
      return;
    }

    setSaving(true);
    
    try {
      // Générer des IDs temporaires pour les ingrédients
      const ingredientsWithIds: Ingredient[] = ingredients.map((ing, idx) => ({
        id: `temp-${idx}`,
        ...ing,
      }));

      // Générer les étapes avec numéros
      const preparationWithNumbers: PreparationStep[] = preparationSteps.map((step, idx) => ({
        stepNumber: idx + 1,
        ...step,
      }));

      const recipeData = {
        ...(recipe ? { id: recipe.id } : {}),
        title: formData.title,
        description: formData.description,
        image: formData.image,
        price: formData.price,
        time: formData.time,
        calories: formData.calories,
        category: formData.category,
        tags: formData.tags.split(',').map(t => t.trim()).filter(t => t),
        ingredients: ingredientsWithIds,
        preparation: preparationWithNumbers,
      };
      
      await onSave(recipeData as Recipe | Omit<Recipe, 'id'>);
    } catch (error) {
      console.error('Error in form submit:', error);
      alert('Une erreur est survenue lors de la sauvegarde');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <motion.div
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        className="bg-white rounded-2xl p-6 max-w-2xl w-full max-h-[90vh] overflow-y-auto relative"
      >
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-2xl font-black text-dark">
            {recipe ? 'Modifier la recette' : 'Nouvelle recette'}
          </h2>
          <button onClick={onClose} className="p-2 hover:bg-beige rounded-xl transition-colors">
            <X size={24} />
          </button>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-bold mb-2">Titre</label>
            <input
              type="text"
              required
              value={formData.title}
              onChange={(e) => setFormData({ ...formData, title: e.target.value })}
              className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
            />
          </div>
          <div>
            <label className="block text-sm font-bold mb-2">Description</label>
            <textarea
              required
              value={formData.description}
              onChange={(e) => setFormData({ ...formData, description: e.target.value })}
              className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
              rows={3}
            />
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-bold mb-2">Image URL</label>
              <input
                type="text"
                required
                value={formData.image}
                onChange={(e) => setFormData({ ...formData, image: e.target.value })}
                className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
              />
            </div>
            <div>
              <label className="block text-sm font-bold mb-2">Prix (FCFA)</label>
              <input
                type="number"
                required
                min="0"
                value={formData.price}
                onChange={(e) => setFormData({ ...formData, price: Number(e.target.value) })}
                className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
              />
            </div>
          </div>
          <div className="grid grid-cols-3 gap-4">
            <div>
              <label className="block text-sm font-bold mb-2">Temps</label>
              <input
                type="text"
                required
                value={formData.time}
                onChange={(e) => setFormData({ ...formData, time: e.target.value })}
                className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
                placeholder="35 min"
              />
            </div>
            <div>
              <label className="block text-sm font-bold mb-2">Calories</label>
              <input
                type="text"
                required
                value={formData.calories}
                onChange={(e) => setFormData({ ...formData, calories: e.target.value })}
                className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
                placeholder="450 kcal"
              />
            </div>
            <div>
              <label className="block text-sm font-bold mb-2">Catégorie</label>
              <input
                type="text"
                required
                value={formData.category}
                onChange={(e) => setFormData({ ...formData, category: e.target.value })}
                className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
                placeholder="Classique"
              />
            </div>
          </div>
          <div>
            <label className="block text-sm font-bold mb-2">Tags (séparés par des virgules)</label>
            <input
              type="text"
              value={formData.tags}
              onChange={(e) => setFormData({ ...formData, tags: e.target.value })}
              className="w-full p-3 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none"
              placeholder="Sain, Rapide, Premium"
            />
          </div>

          {/* Section Ingrédients */}
          <div className="pt-6 border-t border-beige">
            <div className="flex items-center justify-between mb-4">
              <div className="flex items-center gap-2">
                <List size={20} className="text-primary" />
                <h3 className="text-lg font-black text-dark">Ingrédients</h3>
              </div>
              <button
                type="button"
                onClick={addIngredient}
                className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-xl font-bold text-sm hover:bg-red-900 transition-colors"
              >
                <Plus size={16} />
                Ajouter
              </button>
            </div>
            <div className="space-y-3">
              {ingredients.map((ing, idx) => (
                <div key={idx} className="bg-beige/50 p-4 rounded-xl border border-beige">
                  <div className="flex items-start justify-between mb-3">
                    <span className="text-xs font-black text-primary">Ingrédient {idx + 1}</span>
                    {ingredients.length > 0 && (
                      <button
                        type="button"
                        onClick={() => removeIngredient(idx)}
                        className="p-1 hover:bg-red-100 rounded-lg transition-colors"
                      >
                        <Trash2 size={16} className="text-red-600" />
                      </button>
                    )}
                  </div>
                  <div className="grid grid-cols-2 gap-3 mb-3">
                    <div>
                      <label className="block text-xs font-bold mb-1">Nom</label>
                      <input
                        type="text"
                        required
                        value={ing.name}
                        onChange={(e) => updateIngredient(idx, 'name', e.target.value)}
                        className="w-full p-2 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                        placeholder="Ex: Poulet fermier"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold mb-1">Unité</label>
                      <input
                        type="text"
                        required
                        value={ing.unit}
                        onChange={(e) => updateIngredient(idx, 'unit', e.target.value)}
                        className="w-full p-2 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                        placeholder="Ex: g, pièce, L"
                      />
                    </div>
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="block text-xs font-bold mb-1">Quantité</label>
                      <input
                        type="number"
                        required
                        min="0"
                        step="0.01"
                        value={ing.quantity}
                        onChange={(e) => updateIngredient(idx, 'quantity', Number(e.target.value))}
                        className="w-full p-2 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                        placeholder="500"
                      />
                    </div>
                    <div>
                      <label className="block text-xs font-bold mb-1">Prix par unité (FCFA) - Optionnel</label>
                      <input
                        type="number"
                        min="0"
                        step="0.01"
                        value={ing.pricePerUnit || ''}
                        onChange={(e) => updateIngredient(idx, 'pricePerUnit', e.target.value ? Number(e.target.value) : undefined)}
                        className="w-full p-2 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                        placeholder="Optionnel"
                      />
                    </div>
                  </div>
                </div>
              ))}
              {ingredients.length === 0 && (
                <div className="text-center py-8 bg-beige/30 rounded-xl border border-dashed border-beige">
                  <p className="text-sm text-dark/40">Aucun ingrédient ajouté</p>
                  <button
                    type="button"
                    onClick={addIngredient}
                    className="mt-2 text-sm font-bold text-primary hover:underline"
                  >
                    Cliquez pour ajouter le premier ingrédient
                  </button>
                </div>
              )}
            </div>
          </div>

          {/* Section Mode de préparation */}
          <div className="pt-6 border-t border-beige">
            <div className="flex items-center justify-between mb-4">
              <div className="flex items-center gap-2">
                <ChefHatIcon size={20} className="text-primary" />
                <h3 className="text-lg font-black text-dark">Mode de préparation</h3>
              </div>
              <button
                type="button"
                onClick={addPreparationStep}
                className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-xl font-bold text-sm hover:bg-red-900 transition-colors"
              >
                <Plus size={16} />
                Ajouter une étape
              </button>
            </div>
            <div className="space-y-4">
              {preparationSteps.map((step, idx) => (
                <div key={idx} className="bg-beige/50 p-4 rounded-xl border border-beige">
                  <div className="flex items-start justify-between mb-3">
                    <div className="flex items-center gap-2">
                      <div className="w-8 h-8 bg-primary text-white rounded-lg flex items-center justify-center font-black text-sm">
                        {idx + 1}
                      </div>
                      <span className="text-xs font-black text-dark/60">Étape {idx + 1}</span>
                    </div>
                    {preparationSteps.length > 0 && (
                      <button
                        type="button"
                        onClick={() => removePreparationStep(idx)}
                        className="p-1 hover:bg-red-100 rounded-lg transition-colors"
                      >
                        <Trash2 size={16} className="text-red-600" />
                      </button>
                    )}
                  </div>
                  <div className="mb-3">
                    <label className="block text-xs font-bold mb-1">Description</label>
                    <textarea
                      required
                      value={step.description}
                      onChange={(e) => updatePreparationStep(idx, 'description', e.target.value)}
                      className="w-full p-3 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                      rows={3}
                      placeholder="Décrivez cette étape de préparation..."
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-bold mb-1">Durée (optionnel)</label>
                    <input
                      type="text"
                      value={step.duration || ''}
                      onChange={(e) => updatePreparationStep(idx, 'duration', e.target.value || undefined)}
                      className="w-full p-2 rounded-lg bg-white border-none focus:ring-2 focus:ring-primary/20 focus:outline-none text-sm"
                      placeholder="Ex: 15 min"
                    />
                  </div>
                </div>
              ))}
              {preparationSteps.length === 0 && (
                <div className="text-center py-8 bg-beige/30 rounded-xl border border-dashed border-beige">
                  <p className="text-sm text-dark/40">Aucune étape de préparation ajoutée</p>
                  <button
                    type="button"
                    onClick={addPreparationStep}
                    className="mt-2 text-sm font-bold text-primary hover:underline"
                  >
                    Cliquez pour ajouter la première étape
                  </button>
                </div>
              )}
            </div>
          </div>

          <div className="flex gap-3 pt-4">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 py-3 bg-beige text-dark rounded-xl font-bold hover:bg-beige/80 transition-colors"
            >
              Annuler
            </button>
            <button
              type="submit"
              disabled={saving}
              className="flex-1 py-3 bg-primary text-white rounded-xl font-bold hover:bg-red-900 transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {saving ? (
                <>
                  <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  Enregistrement...
                </>
              ) : (
                <>
                  <Save size={18} />
                  {recipe ? 'Mettre à jour' : 'Créer'}
                </>
              )}
            </button>
          </div>
        </form>
      </motion.div>
    </div>
  );
};

// Composant pour la vue détaillée d'une commande
interface OrderDetailViewProps {
  order: Order & { user?: User; deliveryAddress?: string };
  onBack: () => void;
  onUpdateStatus: (orderId: string, status: 'pending' | 'processing' | 'delivered') => void;
}

const OrderDetailView: React.FC<OrderDetailViewProps> = ({ order, onBack, onUpdateStatus }) => {
  const getStatusColor = (status: string) => {
    switch (status) {
      case 'delivered': return 'bg-green-100 text-green-800';
      case 'processing': return 'bg-blue-100 text-blue-800';
      default: return 'bg-yellow-100 text-yellow-800';
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'delivered': return <CheckCircle size={16} />;
      case 'processing': return <Clock size={16} />;
      default: return <XCircle size={16} />;
    }
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className="space-y-6"
    >
      <button
        onClick={onBack}
        className="flex items-center gap-2 text-dark/60 hover:text-primary transition-colors mb-4 font-bold"
      >
        <ArrowLeft size={20} />
        Retour à la liste
      </button>

      <div className="bg-white p-6 md:p-8 rounded-2xl shadow-lg">
        {/* Header */}
        <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-8 pb-6 border-b border-beige">
          <div>
            <h2 className="text-2xl font-black text-dark mb-2">Détails de la commande</h2>
            <p className="text-sm text-dark/40 font-bold uppercase tracking-widest">ID: #{order.id}</p>
            <p className="text-sm text-dark/60 mt-2">
              Date: {new Date(order.date).toLocaleDateString('fr-FR', { 
                day: 'numeric', 
                month: 'long', 
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
              })}
            </p>
          </div>
          <div className={`px-4 py-2 rounded-full flex items-center gap-2 font-bold ${getStatusColor(order.status)}`}>
            {getStatusIcon(order.status)}
            {order.status === 'delivered' ? 'Livrée' : order.status === 'processing' ? 'En cours' : 'En attente'}
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          {/* Informations client */}
          <div className="lg:col-span-1 space-y-6">
            <div className="bg-beige/30 p-6 rounded-2xl border border-beige">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center">
                  <UserIcon className="text-primary" size={20} />
                </div>
                <h3 className="text-lg font-black text-dark">Informations client</h3>
              </div>
              <div className="space-y-4">
                <div>
                  <p className="text-xs font-bold text-dark/40 uppercase tracking-widest mb-1">Nom complet</p>
                  <p className="text-sm font-bold text-dark">{order.user?.name || 'N/A'}</p>
                </div>
                <div>
                  <p className="text-xs font-bold text-dark/40 uppercase tracking-widest mb-1 flex items-center gap-2">
                    <Mail size={12} />
                    Email
                  </p>
                  <a 
                    href={`mailto:${order.user?.email}`}
                    className="text-sm font-bold text-primary hover:underline"
                  >
                    {order.user?.email || 'N/A'}
                  </a>
                </div>
                <div>
                  <p className="text-xs font-bold text-dark/40 uppercase tracking-widest mb-1 flex items-center gap-2">
                    <Phone size={12} />
                    Téléphone
                  </p>
                  <a 
                    href={`tel:${order.user?.phone}`}
                    className="text-sm font-bold text-primary hover:underline"
                  >
                    {order.user?.phone || 'N/A'}
                  </a>
                </div>
              </div>
            </div>

            {/* Adresse de livraison */}
            <div className="bg-beige/30 p-6 rounded-2xl border border-beige">
              <div className="flex items-center gap-3 mb-4">
                <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center">
                  <MapPin className="text-primary" size={20} />
                </div>
                <h3 className="text-lg font-black text-dark">Adresse de livraison</h3>
              </div>
              <div className="space-y-2">
                <p className="text-sm font-bold text-dark leading-relaxed">
                  {order.deliveryAddress || 'Adresse non spécifiée'}
                </p>
                <div className="flex items-center gap-2 mt-4 pt-4 border-t border-beige">
                  <Truck size={16} className="text-primary" />
                  <p className="text-xs text-dark/60">Livraison prévue entre 9h et 18h</p>
                </div>
              </div>
            </div>

            {/* Récapitulatif */}
            <div className="bg-primary/5 p-6 rounded-2xl border border-primary/10">
              <h3 className="text-lg font-black text-dark mb-4">Récapitulatif</h3>
              <div className="space-y-3">
                <div className="flex justify-between text-sm">
                  <span className="text-dark/60">Total articles</span>
                  <span className="font-bold text-dark">{(order.total - 1500).toLocaleString()} FCFA</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-dark/60">Frais de livraison</span>
                  <span className="font-bold text-dark">1 500 FCFA</span>
                </div>
                <div className="flex justify-between pt-4 border-t border-beige text-lg font-black text-primary">
                  <span>Total</span>
                  <span>{order.total.toLocaleString()} FCFA</span>
                </div>
              </div>
            </div>
          </div>

          {/* Articles */}
          <div className="lg:col-span-2 space-y-6">
            <h3 className="text-lg font-black text-dark">Articles commandés ({order.items.length})</h3>
            <div className="space-y-4">
              {order.items.map((item, idx) => (
                <div key={idx} className="bg-beige/30 p-6 rounded-2xl border border-beige">
                  <div className="flex items-start gap-4 mb-4">
                    <img 
                      src={getRecipeImageSrc(item.recipe)} 
                      alt={item.recipe.title} 
                      className="w-20 h-20 rounded-xl object-cover shadow-md"
                      onError={(e) => {
                        const img = e.currentTarget as HTMLImageElement;
                        const fallback = `/recipes/${item.recipe.id}.jpg`;
                        if (!img.src.endsWith(fallback)) img.src = fallback;
                      }}
                    />
                    <div className="flex-1">
                      <h3 className="font-black text-lg mb-1">{item.recipe.title}</h3>
                      <p className="text-sm text-dark/60">Quantité: {item.quantity}</p>
                      <p className="text-xs text-dark/60">{item.recipe.description}</p>
                      <div className="flex items-center gap-4">
                        <span className="text-sm font-bold text-dark">
                          {item.recipesCount ? `Recettes: ${item.recipesCount}` : 'Recettes: 1'}
                        </span>
                        <span className="text-sm font-bold text-dark">
                          {item.personsCount ? `Personnes: ${item.personsCount}` : 'Personnes: 2'}
                        </span>
                        <span className="text-sm font-black text-primary">{item.totalPrice.toLocaleString()} FCFA</span>
                      </div>
                    </div>
                  </div>
                  
                  {/* Ingrédients sélectionnés */}
                  {item.selectedIngredients && item.selectedIngredients.length > 0 && (
                    <div className="pt-4 border-t border-beige">
                      <p className="text-xs font-bold text-dark/40 uppercase tracking-widest mb-3">Ingrédients sélectionnés</p>
                      <div className="space-y-2">
                        {item.selectedIngredients.map((ing, iIdx) => (
                          <div key={iIdx} className="bg-white p-3 rounded-lg border border-beige flex items-center justify-between">
                            <div className="flex-1">
                              <p className="text-sm font-bold text-dark">{ing.name}</p>
                              {ing.pricePerUnit && (
                                <p className="text-xs text-dark/50 mt-0.5">
                                  {ing.pricePerUnit.toLocaleString()} FCFA / {ing.unit}
                                </p>
                              )}
                            </div>
                            <div className="text-right ml-4 min-w-[80px]">
                              <p className="text-base font-black text-primary">
                                {ing.selectedQuantity !== undefined ? ing.selectedQuantity : (ing.quantity || 0)}
                              </p>
                              <p className="text-xs text-dark/60 font-bold uppercase">
                                {ing.unit}
                              </p>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              ))}
            </div>

            {/* Actions */}
            <div className="bg-white p-6 rounded-2xl border border-beige">
              <h3 className="text-lg font-black text-dark mb-4">Modifier le statut</h3>
              <div className="flex gap-3">
                <button
                  onClick={() => onUpdateStatus(order.id, 'pending')}
                  className={`flex-1 py-3 rounded-xl font-bold transition-all ${
                    order.status === 'pending'
                      ? 'bg-yellow-500 text-white shadow-lg'
                      : 'bg-yellow-100 text-yellow-800 hover:bg-yellow-200'
                  }`}
                >
                  En attente
                </button>
                <button
                  onClick={() => onUpdateStatus(order.id, 'processing')}
                  className={`flex-1 py-3 rounded-xl font-bold transition-all ${
                    order.status === 'processing'
                      ? 'bg-blue-500 text-white shadow-lg'
                      : 'bg-blue-100 text-blue-800 hover:bg-blue-200'
                  }`}
                >
                  En cours
                </button>
                <button
                  onClick={() => onUpdateStatus(order.id, 'delivered')}
                  className={`flex-1 py-3 rounded-xl font-bold transition-all ${
                    order.status === 'delivered'
                      ? 'bg-green-500 text-white shadow-lg'
                      : 'bg-green-100 text-green-800 hover:bg-green-200'
                  }`}
                >
                  Livrée
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </motion.div>
  );
};

export default DashboardAdmin;

