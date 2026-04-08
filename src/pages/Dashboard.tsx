
import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { 
  Package, 
  User as UserIcon, 
  LogOut, 
  Clock, 
  CheckCircle, 
  ChevronRight, 
  Settings, 
  Phone, 
  Mail, 
  ArrowLeft,
  Truck,
  CreditCard,
  MapPin,
  ChevronDown,
  ChevronUp,
  RefreshCw
} from 'lucide-react';
import { Order, User } from '../types';
import { isAdmin, updatePassword } from '../lib/supabase';
import { Shield } from 'lucide-react';

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

interface DashboardProps {
  user: User | null;
  orders: Order[];
  onLogout: () => void;
  onNavigate: (page: string) => void;
  onRefreshOrders?: () => Promise<void>;
}

const OrderDetailView: React.FC<{ order: Order; onBack: () => void }> = ({ order, onBack }) => (
  <motion.div 
    initial={{ opacity: 0, y: 10 }}
    animate={{ opacity: 1, y: 0 }}
    exit={{ opacity: 0, y: -10 }}
    className="space-y-6"
  >
    <button 
      onClick={onBack}
      className="flex items-center gap-2 text-dark/40 hover:text-primary transition-colors mb-4 text-xs font-black uppercase tracking-widest"
    >
      <ArrowLeft size={16} /> Retour à la liste
    </button>

    <div className="bg-white p-6 md:p-10 rounded-[2.5rem] shadow-sm border border-beige">
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-10 pb-6 border-b border-beige">
        <div>
          <h3 className="text-xl font-black text-dark">Détails de la commande</h3>
          <p className="text-dark/40 text-[10px] uppercase font-bold tracking-widest mt-1">ID TRANSACTION: #{order.id}</p>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <button
            onClick={() => void downloadOrderPdf(String(order.id))}
            className="inline-flex items-center justify-center px-4 py-2 rounded-full text-[10px] font-black uppercase tracking-widest bg-primary text-white hover:bg-red-900 transition-colors"
          >
            Télécharger PDF
          </button>
          <span className={`inline-flex items-center gap-2 px-4 py-2 rounded-full text-[10px] font-black uppercase tracking-widest ${order.status === 'delivered' ? 'bg-green-100 text-green-700' : 'bg-orange-100 text-orange-700'}`}>
            {order.status === 'delivered' ? <CheckCircle size={14} /> : <Clock size={14} />}
            {order.status === 'delivered' ? 'Livré' : 'En préparation'}
          </span>
        </div>
      </div>

      <div className="grid lg:grid-cols-5 gap-12">
        {/* Liste des articles - Colonne Large */}
        <div className="lg:col-span-3 space-y-6">
          <h4 className="text-xs font-black text-dark/30 uppercase tracking-[0.2em] mb-4">Articles & Ingrédients</h4>
          {order.items.map((item, idx) => (
            <div key={idx} className="p-6 rounded-[2rem] bg-beige/30 border border-beige/50 space-y-4">
              <div className="flex items-center gap-5">
                <img src={item.recipe.image} alt={item.recipe.title} loading="lazy" className="w-16 h-16 rounded-2xl object-cover shrink-0 shadow-sm" />
                <div className="flex-grow">
                  <p className="text-base font-black text-dark leading-tight">{item.recipe.title}</p>
                  <p className="text-[10px] text-primary font-black uppercase mt-1">
                    {item.recipesCount ? `${item.recipesCount} recette(s)` : 'Recette'}
                    {' • '}
                    {item.personsCount ? `${item.personsCount} personne(s)` : '2 personne(s)'}
                  </p>
                </div>
                <p className="text-sm font-black text-dark">{(item.totalPrice * item.quantity).toLocaleString()} F</p>
              </div>
              
              {/* Détail des ingrédients */}
              <div className="pt-4 border-t border-beige/60">
                <p className="text-[9px] font-black text-dark/30 uppercase tracking-widest mb-3">Composition de la box :</p>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-2">
                  {item.selectedIngredients.map((ing, iIdx) => (
                    <div key={iIdx} className="flex items-center justify-between py-1 px-3 bg-white/50 rounded-lg border border-white/80">
                      <span className="text-[11px] font-bold text-dark/70">{ing.name}</span>
                      <span className="text-[10px] font-black text-primary/60">{ing.selectedQuantity} {ing.unit}</span>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Récapitulatif et Livraison - Colonne Étroite */}
        <div className="lg:col-span-2 space-y-6">
          <div className="bg-white p-8 rounded-[2rem] border border-beige shadow-sm">
            <h4 className="text-xs font-black text-dark/30 uppercase tracking-[0.2em] mb-6">Résumé de la commande</h4>
            <div className="space-y-4 text-sm">
              <div className="flex justify-between text-dark/60 font-medium">
                <span>Total articles</span>
                <span>{(order.total - 1500).toLocaleString()} F CFA</span>
              </div>
              <div className="flex justify-between text-dark/60 font-medium">
                <span className="flex items-center gap-2">Frais de livraison</span>
                <span>1 500 F CFA</span>
              </div>
              <div className="flex justify-between pt-5 border-t border-beige text-xl font-black text-dark">
                <span>Total Payé</span>
                <span className="text-primary">{order.total.toLocaleString()} F CFA</span>
              </div>
            </div>
          </div>

          <div className="bg-beige/20 p-6 rounded-[2rem] border border-beige/50">
            <div className="flex gap-4 items-start">
              <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center text-primary shrink-0">
                <Truck size={20} />
              </div>
              <div>
                <p className="text-[10px] font-black text-dark/30 uppercase tracking-widest">Adresse de livraison</p>
                <p className="text-sm font-bold text-dark/70 mt-1">Abidjan, Côte d'Ivoire</p>
                <p className="text-[11px] text-dark/40 mt-1 italic">Livraison prévue entre 9h et 18h.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </motion.div>
);

const Dashboard: React.FC<DashboardProps> = ({ user, orders, onLogout, onNavigate, onRefreshOrders }) => {
  const [selectedOrderId, setSelectedOrderId] = useState<string | null>(null);
  const [activeSection, setActiveSection] = useState<'orders' | 'profile'>('orders');
  const [refreshing, setRefreshing] = useState(false);
  const [newPassword, setNewPassword] = useState('');
  const [confirmNewPassword, setConfirmNewPassword] = useState('');
  const [profileMessage, setProfileMessage] = useState<string | null>(null);
  const [savingProfile, setSavingProfile] = useState(false);

  if (!user) {
    return (
      <div className="pt-40 pb-24 container mx-auto px-4 text-center max-w-lg">
        <div className="w-20 h-20 bg-beige rounded-full flex items-center justify-center mx-auto mb-6">
          <UserIcon size={32} className="text-dark/20" />
        </div>
        <h2 className="text-3xl font-bold mb-4 tracking-tight">Connectez-vous</h2>
        <p className="text-dark/60 mb-8 text-sm">Votre compte est créé automatiquement lors de votre première commande.</p>
        <div className="flex flex-col gap-3">
          <button 
            onClick={() => onNavigate('login')}
            className="w-full bg-primary text-white py-4 rounded-2xl font-bold shadow-lg shadow-primary/20"
          >
            Se connecter
          </button>
          <button 
            onClick={() => onNavigate('recipes')}
            className="w-full bg-beige text-dark/70 py-4 rounded-2xl font-bold"
          >
            Commander maintenant
          </button>
        </div>
      </div>
    );
  }

  const selectedOrder = orders.find(o => o.id === selectedOrderId);

  return (
    <div className="pt-32 pb-24 container mx-auto px-4 md:px-6">
      <div className="grid lg:grid-cols-4 gap-12">
        {/* Sidebar - Fixe */}
        <aside className="lg:col-span-1 space-y-6">
          <div className="bg-white p-8 rounded-[2.5rem] shadow-sm border border-beige text-center">
            <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-4 border-4 border-white shadow-md">
              <span className="text-primary font-black text-2xl">{user.name.charAt(0)}</span>
            </div>
            <h3 className="text-lg font-bold mb-1">{user.name}</h3>
            <p className="text-dark/40 text-[10px] font-bold uppercase tracking-widest mb-6">Client VIP</p>
            
            <div className="space-y-3 pt-6 border-t border-beige text-left">
              <div className="flex items-center gap-3 text-xs text-dark/60">
                <Mail size={14} className="text-primary" />
                <span className="truncate">{user.email}</span>
              </div>
              <div className="flex items-center gap-3 text-xs text-dark/60">
                <Phone size={14} className="text-primary" />
                <span>{user.phone}</span>
              </div>
            </div>
          </div>

          <div className="bg-white p-3 rounded-3xl shadow-sm border border-beige">
            <nav className="flex flex-col gap-1">
              <button 
                onClick={() => setSelectedOrderId(null)}
                className={`flex items-center gap-3 p-4 rounded-2xl text-xs font-black uppercase tracking-widest transition-all ${!selectedOrderId ? 'bg-primary text-white shadow-lg shadow-primary/20' : 'text-dark/40 hover:bg-beige'}`}
              >
                <Package size={18} /> Commandes
              </button>
              {isAdmin(user) && (
                <button 
                  onClick={() => onNavigate('admin')}
                  className="flex items-center gap-3 p-4 rounded-2xl text-xs font-black uppercase tracking-widest text-primary bg-primary/10 hover:bg-primary/20 transition-all"
                >
                  <Shield size={18} /> Admin
                </button>
              )}
              <button
                onClick={() => {
                  setSelectedOrderId(null);
                  setActiveSection('profile');
                  setProfileMessage(null);
                }}
                className={`flex items-center gap-3 p-4 rounded-2xl text-xs font-black uppercase tracking-widest transition-all ${activeSection === 'profile' ? 'bg-primary text-white shadow-lg shadow-primary/20' : 'text-dark/40 hover:bg-beige'}`}
              >
                <Settings size={18} /> Profil
              </button>
              <button 
                onClick={onLogout}
                className="flex items-center gap-3 p-4 rounded-2xl text-xs font-black uppercase tracking-widest text-red-500 hover:bg-red-50 transition-all mt-4"
              >
                <LogOut size={18} /> Déconnexion
              </button>
            </nav>
          </div>
        </aside>

        {/* Main Content */}
        <main className="lg:col-span-3">
          <AnimatePresence mode="wait">
            {selectedOrderId && selectedOrder ? (
              <OrderDetailView key="detail" order={selectedOrder} onBack={() => setSelectedOrderId(null)} />
            ) : activeSection === 'profile' ? (
              <motion.div
                key="profile"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="space-y-8"
              >
                <div className="bg-white p-8 rounded-[2.5rem] shadow-sm border border-beige">
                  <h2 className="text-xl font-black text-dark mb-2">Profil</h2>
                  <p className="text-sm text-dark/50">Modifiez votre mot de passe pour sécuriser votre compte.</p>
                </div>

                <div className="bg-white p-8 rounded-[2.5rem] shadow-sm border border-beige">
                  <div className="grid sm:grid-cols-2 gap-6">
                    <div className="space-y-2 sm:col-span-2">
                      <label className="text-sm font-bold text-dark/70 ml-1">Email</label>
                      <input
                        disabled
                        value={user.email}
                        className="w-full p-4 rounded-xl bg-beige border-none text-dark/60"
                      />
                    </div>
                    <div className="space-y-2">
                      <label className="text-sm font-bold text-dark/70 ml-1">Nouveau mot de passe</label>
                      <input
                        type="password"
                        placeholder="••••••••"
                        className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all"
                        value={newPassword}
                        onChange={(e) => {
                          setNewPassword(e.target.value);
                          setProfileMessage(null);
                        }}
                      />
                    </div>
                    <div className="space-y-2">
                      <label className="text-sm font-bold text-dark/70 ml-1">Confirmer</label>
                      <input
                        type="password"
                        placeholder="••••••••"
                        className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all"
                        value={confirmNewPassword}
                        onChange={(e) => {
                          setConfirmNewPassword(e.target.value);
                          setProfileMessage(null);
                        }}
                      />
                    </div>
                    {profileMessage && (
                      <div className="sm:col-span-2">
                        <p className={`text-xs font-bold ${profileMessage.startsWith('OK:') ? 'text-green-700' : 'text-red-600'}`}>
                          {profileMessage.startsWith('OK:') ? profileMessage.slice(3) : profileMessage}
                        </p>
                      </div>
                    )}
                    <div className="sm:col-span-2">
                      <button
                        disabled={savingProfile}
                        onClick={async () => {
                          setProfileMessage(null);

                          if (!newPassword || newPassword.length < 6) {
                            setProfileMessage('Le mot de passe doit contenir au moins 6 caractères');
                            return;
                          }
                          if (newPassword !== confirmNewPassword) {
                            setProfileMessage('Les mots de passe ne correspondent pas');
                            return;
                          }

                          setSavingProfile(true);
                          try {
                            await updatePassword(newPassword);
                            setNewPassword('');
                            setConfirmNewPassword('');
                            setProfileMessage('OK: Mot de passe mis à jour');
                          } catch (e) {
                            console.error('Error updating password:', e);
                            setProfileMessage('Impossible de mettre à jour le mot de passe. Veuillez vous reconnecter et réessayer.');
                          } finally {
                            setSavingProfile(false);
                          }
                        }}
                        className={`w-full py-4 rounded-2xl font-black text-sm uppercase tracking-widest shadow-xl transition-all active:scale-95 ${
                          savingProfile
                            ? 'bg-dark/10 text-dark/30 cursor-not-allowed'
                            : 'bg-primary text-white shadow-primary/20 hover:bg-red-900'
                        }`}
                      >
                        {savingProfile ? 'Enregistrement...' : 'Mettre à jour le mot de passe'}
                      </button>
                    </div>
                  </div>
                </div>
              </motion.div>
            ) : (
              <motion.div 
                key="list"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="space-y-8"
              >
                <div className="bg-primary p-8 rounded-[2.5rem] text-white flex flex-col md:flex-row justify-between items-center gap-6 shadow-xl shadow-primary/10">
                  <div className="space-y-1 text-center md:text-left">
                    <h2 className="text-2xl font-black">Bonjour, {user.name.split(' ')[0]}</h2>
                    <p className="text-white/60 text-sm">Gérez vos commandes et vos préférences.</p>
                  </div>
                  <button 
                    onClick={() => onNavigate('recipes')}
                    className="bg-accent text-white px-6 py-3 rounded-xl font-black text-xs uppercase tracking-widest shadow-xl shadow-accent/20 hover:scale-105 transition-all"
                  >
                    Nouvelle box
                  </button>
                </div>

                <section>
                  <div className="flex items-center justify-between mb-6">
                    <h3 className="text-lg font-black flex items-center gap-2">
                      Historique <span className="text-[10px] font-black text-primary bg-primary/10 px-2 py-0.5 rounded-full">{orders.length}</span>
                    </h3>
                    {onRefreshOrders && (
                      <button
                        onClick={async () => {
                          setRefreshing(true);
                          await onRefreshOrders();
                          setRefreshing(false);
                        }}
                        disabled={refreshing}
                        className="flex items-center gap-2 px-4 py-2 bg-beige hover:bg-beige/80 text-dark/70 rounded-xl font-bold text-xs transition-all disabled:opacity-50"
                        title="Actualiser les commandes"
                      >
                        <RefreshCw size={16} className={refreshing ? 'animate-spin' : ''} />
                        Actualiser
                      </button>
                    )}
                  </div>
                  
                  {orders.length === 0 ? (
                    <div className="bg-white py-16 px-8 rounded-[2.5rem] text-center border-2 border-dashed border-beige">
                      <Package size={40} className="text-dark/10 mx-auto mb-4" />
                      <p className="text-dark/40 font-bold text-sm">Aucune commande pour le moment.</p>
                    </div>
                  ) : (
                    <div className="grid gap-4">
                      {orders.map((order) => (
                        <motion.div 
                          key={order.id}
                          whileHover={{ y: -2 }}
                          onClick={() => setSelectedOrderId(order.id)}
                          className="bg-white p-5 rounded-[2rem] shadow-sm border border-beige flex flex-col md:flex-row items-center gap-6 cursor-pointer hover:shadow-md transition-all group"
                        >
                          <div className="w-12 h-12 bg-beige rounded-xl flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-colors">
                            <Package size={24} />
                          </div>
                          
                          <div className="flex-grow space-y-1 text-center md:text-left">
                            <p className="text-[9px] font-black text-dark/30 uppercase tracking-widest">#{order.id.slice(0,8)}</p>
                            <h4 className="text-sm font-bold text-dark">
                              {new Date(order.date).toLocaleDateString('fr-FR', {day: 'numeric', month: 'long', year: 'numeric'})}
                            </h4>
                            <p className="text-[11px] text-dark/40 font-bold uppercase">{order.items.length} Recette(s) • <span className="text-primary">{order.total.toLocaleString()} F</span></p>
                          </div>

                          <div className="flex items-center gap-4">
                            <span className={`px-3 py-1.5 rounded-full text-[9px] font-black uppercase tracking-widest ${order.status === 'delivered' ? 'bg-green-100 text-green-700' : 'bg-orange-100 text-orange-700'}`}>
                              {order.status === 'delivered' ? 'Livré' : 'En cours'}
                            </span>
                            <ChevronRight size={18} className="text-dark/20 group-hover:text-primary transition-colors" />
                          </div>
                        </motion.div>
                      ))}
                    </div>
                  )}
                </section>
              </motion.div>
            )}
          </AnimatePresence>
        </main>
      </div>
    </div>
  );
};

export default Dashboard;
