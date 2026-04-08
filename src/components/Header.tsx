
import React, { useState, useEffect, useRef } from 'react';
import { Menu, X, ShoppingBag, User as UserIcon, ChevronDown, LogOut } from 'lucide-react';
import { motion, AnimatePresence, Variants } from 'framer-motion';
import { User } from '../types';

interface HeaderProps {
  onNavigate: (page: string) => void;
  currentPage: string;
  cartCount: number;
  user?: User | null;
  onLogout?: () => void;
}

const Header: React.FC<HeaderProps> = ({ onNavigate, currentPage, cartCount, user, onLogout }) => {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [isAccountMenuOpen, setIsAccountMenuOpen] = useState(false);
  const [headerHeight, setHeaderHeight] = useState(80);
  const headerRef = useRef<HTMLElement>(null);
  const accountMenuRef = useRef<HTMLDivElement>(null);

  const displayName = (user?.name || user?.email || '').trim();
  const firstName = displayName.split(' ')[0] || displayName;

  useEffect(() => {
    const handleScroll = () => setIsScrolled(window.scrollY > 20);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  useEffect(() => {
    if (headerRef.current) {
      const updateHeaderHeight = () => {
        setHeaderHeight(headerRef.current?.offsetHeight || 80);
      };
      updateHeaderHeight();
      window.addEventListener('resize', updateHeaderHeight);
      return () => window.removeEventListener('resize', updateHeaderHeight);
    }
  }, [isScrolled, isMobileMenuOpen]);

  useEffect(() => {
    const onDocumentClick = (e: MouseEvent) => {
      if (!isAccountMenuOpen) return;
      const target = e.target as Node | null;
      if (accountMenuRef.current && target && !accountMenuRef.current.contains(target)) {
        setIsAccountMenuOpen(false);
      }
    };
    document.addEventListener('mousedown', onDocumentClick);
    return () => document.removeEventListener('mousedown', onDocumentClick);
  }, [isAccountMenuOpen]);

  const navLinks = [
    { name: 'Accueil', id: 'home' },
    { name: 'Nos Recettes', id: 'recipes' },
    { name: 'Fonctionnement', id: 'how-it-works' },
  ];

  const headerVariants: Variants = {
    initial: { y: -100, opacity: 0 },
    animate: { 
      y: 0, 
      opacity: 1,
      transition: { 
        duration: 0.8, 
        ease: [0.16, 1, 0.3, 1] as [number, number, number, number] 
      } 
    }
  };

  // Détermine si nous sommes sur la page d'accueil
  const isHomePage = currentPage === 'home';

  // Afficher l'effet de verre sur toutes les pages sauf sur l'accueil (où on l'affiche uniquement au scroll)
  const shouldShowGlassEffect = !isHomePage || isScrolled;

  return (
    <motion.header 
      ref={headerRef}
      variants={headerVariants}
      initial="initial"
      animate="animate"
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-700 overflow-visible max-w-full ${
        shouldShowGlassEffect 
          ? 'bg-white/95 backdrop-blur-xl shadow-[0_8px_40px_rgba(0,0,0,0.08)] py-3' 
          : 'bg-transparent py-8'
      }`}
    >
      <div className="container mx-auto px-4 md:px-6 flex items-center justify-between max-w-full">
        
        {/* Logo Badge Signature */}
        <motion.div 
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          className="flex items-center cursor-pointer group z-50"
          onClick={() => onNavigate('home')}
        >
          <div className={`relative bg-white p-1.5 md:p-2 rounded-2xl md:rounded-[1.25rem] 
            shadow-[0_15px_35px_-5px_rgba(0,0,0,0.12)] 
            border border-beige/50 transition-all duration-500
            group-hover:shadow-[0_20px_40px_-5px_rgba(139,29,29,0.15)]
            group-hover:-translate-y-0.5
          `}>
            <img 
              src="/cuisine_facile.africa.jpg" 
              alt="CuisineFacile" 
              className="h-12 w-auto object-contain"
            />
            <motion.div 
              animate={{ scale: [1, 1.2, 1] }}
              transition={{ repeat: Infinity, duration: 2 }}
              className="absolute -top-1 -right-1 w-3.5 h-3.5 bg-primary rounded-full border-2 border-white shadow-sm" 
            />
          </div>
        </motion.div>

        {/* Desktop Nav */}
        <nav className={`hidden md:flex items-center gap-10 px-10 py-3.5 rounded-2xl transition-all duration-700 ${
          shouldShowGlassEffect 
            ? 'bg-white/10 backdrop-blur-md shadow-lg'
            : 'bg-black/20 backdrop-blur-md shadow-lg'
        }`}>
          {navLinks.map((link) => (
            <button
              key={link.id}
              onClick={() => onNavigate(link.id)}
              className={`relative font-medium text-sm uppercase tracking-wider transition-colors ${
                currentPage === link.id 
                  ? 'text-accent font-bold' 
                  : shouldShowGlassEffect 
                    ? 'text-dark hover:text-accent/90' 
                    : 'text-white hover:text-accent/80 drop-shadow-lg'
              }`}
            >
              {link.name}
              <motion.span 
                layoutId="navUnderline"
                className={`absolute -bottom-1 left-0 h-0.5 bg-primary transition-all duration-300 ${currentPage === link.id ? 'w-full' : 'w-0 group-hover:w-full'}`} 
              />
            </button>
          ))}
        </nav>

        {/* Actions */}
        <div className="flex items-center gap-3 md:gap-5">
          <div className={`flex items-center gap-1.5 p-1.5 rounded-2xl transition-all duration-700 ${
            shouldShowGlassEffect 
              ? 'bg-white/10 backdrop-blur-md shadow-lg' 
              : 'bg-black/20 backdrop-blur-md shadow-lg'
          }`}>
            {user ? (
              <div className="flex items-center" ref={accountMenuRef}>
                <button
                  onClick={() => setIsAccountMenuOpen((v) => !v)}
                  className={`hidden sm:flex items-center gap-2 px-3 py-2 rounded-xl transition-all text-xs font-black tracking-wider uppercase ${
                    shouldShowGlassEffect
                      ? 'text-dark hover:bg-white/20 hover:text-primary'
                      : 'text-white hover:bg-white/20 drop-shadow-lg'
                  }`}
                  aria-label="Menu compte"
                >
                  <UserIcon size={18} />
                  {firstName}
                  <ChevronDown size={16} className={isAccountMenuOpen ? 'rotate-180 transition-transform' : 'transition-transform'} />
                </button>

                <button
                  onClick={() => {
                    onNavigate('dashboard');
                    setIsAccountMenuOpen(false);
                  }}
                  className={`sm:hidden p-3 rounded-xl transition-all ${
                    shouldShowGlassEffect
                      ? 'text-dark hover:bg-white/20 hover:text-primary'
                      : 'text-white hover:bg-white/20 drop-shadow-lg'
                  }`}
                  aria-label="Mon compte"
                >
                  <UserIcon size={20} />
                </button>

                <AnimatePresence>
                  {isAccountMenuOpen && (
                    <motion.div
                      initial={{ opacity: 0, y: 8, scale: 0.98 }}
                      animate={{ opacity: 1, y: 0, scale: 1 }}
                      exit={{ opacity: 0, y: 8, scale: 0.98 }}
                      transition={{ duration: 0.15 }}
                      className={`hidden sm:block absolute top-full right-0 mt-2 w-52 rounded-2xl overflow-hidden border shadow-xl ${
                        shouldShowGlassEffect
                          ? 'bg-white/95 backdrop-blur-xl border-beige'
                          : 'bg-black/70 backdrop-blur-xl border-white/10'
                      }`}
                    >
                      <button
                        onClick={() => {
                          onNavigate('dashboard');
                          setIsAccountMenuOpen(false);
                        }}
                        className={`w-full px-4 py-3 text-left text-xs font-black uppercase tracking-widest flex items-center gap-3 transition-colors ${
                          shouldShowGlassEffect
                            ? 'text-dark hover:bg-beige/60'
                            : 'text-white hover:bg-white/10'
                        }`}
                      >
                        <UserIcon size={16} />
                        Mon compte
                      </button>
                      {onLogout && (
                        <button
                          onClick={() => {
                            setIsAccountMenuOpen(false);
                            onLogout();
                          }}
                          className={`w-full px-4 py-3 text-left text-xs font-black uppercase tracking-widest flex items-center gap-3 transition-colors ${
                            shouldShowGlassEffect
                              ? 'text-red-600 hover:bg-red-50'
                              : 'text-red-200 hover:bg-white/10'
                          }`}
                        >
                          <LogOut size={16} />
                          Déconnexion
                        </button>
                      )}
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            ) : (
              <button
                onClick={() => onNavigate('login')}
                className={`p-3 rounded-xl transition-all ${
                  shouldShowGlassEffect
                    ? 'text-dark hover:bg-white/20 hover:text-primary'
                    : 'text-white hover:bg-white/20 drop-shadow-lg'
                }`}
                aria-label="Se connecter"
              >
                <UserIcon size={20} />
              </button>
            )}
            <button 
              onClick={() => onNavigate('cart')}
              className={`p-3 rounded-xl transition-all relative border shadow-sm ${
                shouldShowGlassEffect 
                  ? 'bg-primary text-white border-white/40 hover:bg-primary/90' 
                  : 'bg-accent text-white border-white/30 hover:bg-accent/90'
              }`}
            >
              <ShoppingBag size={20} />
              {cartCount > 0 && (
                <motion.span 
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  className={`absolute -top-1 -right-1 text-[10px] font-black w-5 h-5 rounded-full flex items-center justify-center border-2 shadow-md ${
                    shouldShowGlassEffect 
                      ? 'bg-accent text-white border-white' 
                      : 'bg-primary text-white border-white'
                  }`}
                >
                  {cartCount}
                </motion.span>
              )}
            </button>
          </div>
          
          <motion.button 
            whileHover={{ 
              scale: 1.05, 
              boxShadow: shouldShowGlassEffect 
                ? "0 20px 40px -10px rgba(0,0,0,0.15)" 
                : "0 20px 40px -10px rgba(242,153,74,0.3)"
            }}
            whileTap={{ scale: 0.95 }}
            onClick={() => onNavigate('recipes')}
            className={`hidden sm:block px-8 py-4 rounded-2xl text-[10px] font-black tracking-widest transition-all uppercase ${
              shouldShowGlassEffect
                ? 'bg-primary text-white shadow-lg hover:bg-primary/90'
                : 'bg-accent text-white shadow-xl shadow-accent/20 hover:bg-accent/90'
            }`}
          >
            Commander
          </motion.button>
          
          <button 
            className={`md:hidden p-3 rounded-2xl transition-all ${
              shouldShowGlassEffect 
                ? 'text-dark hover:bg-white/20' 
                : 'text-white hover:bg-white/10 drop-shadow-lg bg-black/20 backdrop-blur-sm'
            }`}
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          >
            {isMobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>
      </div>

      {/* Mobile Menu */}
      <AnimatePresence>
        {isMobileMenuOpen && (
          <>
            {/* Overlay pour fermer le menu en cliquant à l'extérieur */}
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={() => setIsMobileMenuOpen(false)}
              className="md:hidden fixed inset-0 bg-black/30 backdrop-blur-sm z-[45]"
            />
            
            {/* Menu mobile */}
            <motion.div
              initial={{ opacity: 0, y: -10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.2 }}
              className="md:hidden fixed left-0 right-0 z-[60] max-h-[calc(100vh-120px)] overflow-y-auto shadow-2xl"
              style={{
                top: `${headerHeight}px`,
                background: '#FFFFFF',
                borderTop: '1px solid rgba(245, 245, 240, 0.5)'
              }}
            >
              <div className="container mx-auto px-6 py-6 flex flex-col gap-3 bg-white">
                {navLinks.map((link) => (
                  <motion.button
                    key={link.id}
                    whileTap={{ scale: 0.98 }}
                    onClick={() => {
                      onNavigate(link.id);
                      setIsMobileMenuOpen(false);
                    }}
                    className={`text-sm font-bold uppercase tracking-wider text-left p-4 rounded-xl transition-all ${
                      currentPage === link.id 
                        ? 'bg-primary/10 text-primary' 
                        : 'text-dark/80 hover:bg-gray-50'
                    }`}
                  >
                    {link.name}
                  </motion.button>
                ))}
                <div className="h-px bg-gray-100 my-2" />
                <motion.button 
                  whileTap={{ scale: 0.98 }}
                  onClick={() => {
                    onNavigate('recipes');
                    setIsMobileMenuOpen(false);
                  }}
                  className="w-full bg-primary text-white p-5 rounded-2xl text-center font-black text-sm uppercase tracking-wider shadow-lg hover:bg-primary/90 transition-colors"
                >
                  Commander ma box
                </motion.button>
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </motion.header>
  );
};

export default Header;
