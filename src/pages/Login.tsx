import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Mail, ArrowLeft, LogIn, Shield } from 'lucide-react';
import { getUserByEmail, isAdmin, isAdminEmail } from '../lib/supabase';
import { User } from '../types';

interface LoginProps {
  onLogin: (user: User) => void;
  onAdminLogin: (email: string) => void;
  onBack: () => void;
  onNavigate: (page: string) => void;
}

const Login: React.FC<LoginProps> = ({ onLogin, onAdminLogin, onBack, onNavigate }) => {
  const [email, setEmail] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [isAdminMode, setIsAdminMode] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const emailTrimmed = email.trim();

      // Admin: on garde un mode email-only (table users) pour l'instant
      if (isAdminMode) {
        const allowed = await isAdminEmail(emailTrimmed);
        if (!allowed) {
          setError('Cet email n\'a pas les droits administrateur.');
          setLoading(false);
          return;
        }

        // Si l'utilisateur existe, on garde la logique précédente (utile pour récupérer nom/téléphone/role).
        // Sinon, App.tsx créera un profil admin minimal en localStorage.
        await onAdminLogin(emailTrimmed);
        onNavigate('admin');
        return;
      }

      // Utilisateur normal: email-only via table users
      const user = await getUserByEmail(emailTrimmed);
      if (!user) {
        setError('Aucun compte trouvé avec cet email.');
        setLoading(false);
        return;
      }
      onLogin(user);
      onNavigate('dashboard');
    } catch (error) {
      console.error('Error logging in:', error);
      const message = (error as any)?.message ? String((error as any).message) : 'Erreur lors de la connexion. Veuillez réessayer.';
      setError(message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="pt-32 pb-24 bg-beige min-h-screen">
      <div className="container mx-auto px-4 md:px-6 max-w-md">
        <button 
          onClick={onBack}
          className="flex items-center gap-2 text-dark/60 hover:text-primary transition-colors mb-8 font-bold group"
        >
          <ArrowLeft className="group-hover:-translate-x-1 transition-transform" />
          Retour
        </button>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="bg-white p-8 md:p-10 rounded-[40px] shadow-xl border border-beige/50"
        >
          <div className="text-center mb-8">
            <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-4">
              {isAdminMode ? (
                <Shield className="text-primary" size={32} />
              ) : (
                <LogIn className="text-primary" size={32} />
              )}
            </div>
            <h1 className="text-3xl font-black text-dark mb-2">
              {isAdminMode ? 'Connexion Admin' : 'Connexion'}
            </h1>
            <p className="text-dark/60 text-sm">
              {isAdminMode
                ? 'Connectez-vous avec votre email administrateur'
                : 'Connectez-vous avec l\'email utilisé lors de votre commande'}
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="space-y-2">
              <label className="text-sm font-bold text-dark/70 ml-1 flex items-center gap-2">
                <Mail size={16} className="text-primary" />
                Email
              </label>
              <input 
                required
                type="email" 
                placeholder="votre@email.com"
                className="w-full p-4 rounded-xl bg-beige border-none focus:ring-2 focus:ring-primary/20 focus:outline-none transition-all"
                value={email}
                onChange={(e) => {
                  setEmail(e.target.value);
                  setError(null);
                }}
                disabled={loading}
              />
            </div>

            {!isAdminMode ? null : null}

            {error && (
              <motion.div
                initial={{ opacity: 0, y: -10 }}
                animate={{ opacity: 1, y: 0 }}
                className="bg-red-50 border border-red-200 rounded-xl p-4"
              >
                <p className={`text-sm font-bold ${error.startsWith('OK:') ? 'text-green-700' : 'text-red-600'}`}>
                  {error.startsWith('OK:') ? error.slice(3) : error}
                </p>
              </motion.div>
            )}

            <button
              type="submit"
              disabled={loading || !email.trim()}
              className={`w-full py-4 rounded-xl font-black text-lg shadow-xl transition-all active:scale-95 flex items-center justify-center gap-3 ${
                loading || !email.trim()
                  ? 'bg-dark/10 text-dark/30 cursor-not-allowed'
                  : 'bg-primary text-white shadow-primary/20 hover:bg-red-900'
              }`}
            >
              {loading ? (
                <>
                  <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  Connexion...
                </>
              ) : (
                <>
                  <LogIn size={20} />
                  Se connecter
                </>
              )}
            </button>
          </form>

          <div className="mt-8 pt-6 border-t border-beige">
            {!isAdminMode ? (
              <>
                <p className="text-xs text-dark/40 text-center mb-4">
                  Vous n'avez pas encore de compte ?
                </p>
                <button
                  onClick={() => onNavigate('recipes')}
                  className="w-full py-3 rounded-xl font-bold text-sm bg-beige hover:bg-beige/80 text-dark/70 transition-colors"
                >
                  Créer un compte en commandant
                </button>
                <p className="text-[10px] text-dark/30 text-center mt-3">
                  Votre compte est créé automatiquement lors de votre première commande
                </p>
              </>
            ) : null}
            <div className="mt-4 pt-4 border-t border-beige">
              <button
                onClick={() => {
                  setIsAdminMode(!isAdminMode);
                  setEmail('');
                  setError(null);
                }}
                className="w-full py-3 rounded-xl font-bold text-sm bg-dark/5 hover:bg-dark/10 text-dark/70 transition-colors flex items-center justify-center gap-2"
              >
                <Shield size={16} />
                {isAdminMode ? 'Mode utilisateur' : 'Se connecter en tant qu\'admin'}
              </button>
            </div>
          </div>
        </motion.div>
      </div>
    </div>
  );
};

export default Login;

