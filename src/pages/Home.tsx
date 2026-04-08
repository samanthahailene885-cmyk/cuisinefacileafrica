import React, { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence, useScroll, useTransform, Variants } from 'framer-motion';
import { 
  Clock, 
  Plus,
  Minus,
  ArrowRight,
  ChevronLeft,
  ChevronRight,
  Star,
  HelpCircle
} from 'lucide-react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import { HOW_IT_WORKS } from '../constants';
import { Recipe } from '../types';

interface HomeProps {
  onNavigate: (page: string, params?: any) => void;
  recipes?: Recipe[];
}

const TESTIMONIALS = [
  {
    name: "Sarah Koné",
    role: "Maman active",
    content: "CuisineFacile a changé mes soirées. Plus besoin de réfléchir au menu, tout est là !",
    avatar: "https://i.pravatar.cc/150?u=sarah",
    stars: 5
  },
  {
    name: "Marc Koffi",
    role: "Entrepreneur",
    content: "La qualité des produits est exceptionnelle. On sent la fraîcheur locale.",
    avatar: "https://i.pravatar.cc/150?u=marc",
    stars: 5
  },
  {
    name: "Awa Diop",
    role: "Étudiante",
    content: "Budget maîtrisé et repas équilibrés. C'est la solution parfaite.",
    avatar: "https://i.pravatar.cc/150?u=awa",
    stars: 4
  }
];

const FAQ_DATA = [
  {
    question: "CuisineFacile favorise-t-il une alimentation saine ?",
    answer: "Absolument. Nos recettes sont élaborées avec des nutritionnistes pour garantir un équilibre parfait entre protéines, glucides et légumes frais, sans conservateurs."
  },
  {
    question: "Comment fonctionne la création de mon compte ?",
    answer: "C'est simple : vous n'avez rien à faire. Un compte client est automatiquement créé après votre premier paiement réussi pour vous permettre de suivre vos livraisons."
  },
  {
    question: "Quels sont les délais de livraison à Abidjan ?",
    answer: "Nous livrons généralement sous 24h à 48h après validation de votre commande, selon votre zone géographique (Cocody, Marcory, Plateau, etc.)."
  },
  {
    question: "Puis-je modifier ma box après commande ?",
    answer: "Tant que la commande n'est pas en cours de préparation, vous pouvez contacter notre service client pour ajuster vos ingrédients ou vos quantités."
  }
];

interface FAQItemProps {
  question: string;
  answer: string;
  isOpen: boolean;
  onClick: () => void;
}

const FAQItem: React.FC<FAQItemProps> = ({ question, answer, isOpen, onClick }) => (
  <div className={`border-b border-beige transition-all ${isOpen ? 'bg-white' : ''} w-full max-w-full`}>
    <button 
      onClick={onClick}
      className="w-full py-4 sm:py-5 px-3 sm:px-4 flex items-center justify-between text-left group min-w-0"
    >
      <span className={`text-xs sm:text-sm font-bold tracking-tight transition-colors min-w-0 flex-1 pr-2 break-words ${isOpen ? 'text-primary' : 'text-dark/80 group-hover:text-primary'}`}>
        {question}
      </span>
      <div className={`shrink-0 ml-3 sm:ml-4 transition-transform duration-300 flex-shrink-0 ${isOpen ? 'rotate-180 text-primary' : 'text-dark/20'}`}>
        {isOpen ? <Minus size={16} /> : <Plus size={16} />}
      </div>
    </button>
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ height: 0, opacity: 0 }}
          animate={{ height: 'auto', opacity: 1 }}
          exit={{ height: 0, opacity: 0 }}
          className="overflow-hidden w-full"
        >
          <div className="px-3 sm:px-4 pb-4 sm:pb-6 text-xs leading-relaxed text-dark/50 font-medium break-words">
            {answer}
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  </div>
);

const Home: React.FC<HomeProps> = ({ onNavigate, recipes = [] }) => {
  const [openFAQIndex, setOpenFAQIndex] = useState<number | null>(0);
  const [isCarouselPaused, setIsCarouselPaused] = useState(false);
  const scrollRef = useRef<HTMLDivElement>(null);
  const heroRef = useRef(null);
  
  const { scrollYProgress } = useScroll({
    target: heroRef,
    offset: ["start start", "end start"]
  });

  const heroY = useTransform(scrollYProgress, [0, 1], [0, 200]);
  const heroOpacity = useTransform(scrollYProgress, [0, 0.8], [1, 0]);

  // Utiliser les recettes de Supabase, ou un tableau vide si pas encore chargées
  // Répéter les recettes pour créer un effet de carrousel infini
  const infiniteRecipes = recipes.length > 0 
    ? [...recipes, ...recipes, ...recipes, ...recipes]
    : [];

  useEffect(() => {
    return;
  }, []);

  const scrollCarouselBy = (delta: number) => {
    const el = scrollRef.current;
    if (!el) return;
    el.scrollBy({ left: delta, behavior: 'smooth' });
  };

  const containerVariants: Variants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.15,
        delayChildren: 0.4,
      }
    }
  };

  const itemVariants: Variants = {
    hidden: { y: 40, opacity: 0 },
    visible: { 
      y: 0, 
      opacity: 1,
      transition: { 
        duration: 0.8, 
        ease: [0.16, 1, 0.3, 1] as [number, number, number, number] 
      }
    }
  };

  return (
    <div className="flex flex-col gap-16 pb-20 bg-beige overflow-x-hidden max-w-full">
      {/* Hero Section */}
      <section ref={heroRef} className="relative min-h-[70vh] sm:min-h-[80vh] md:min-h-screen flex items-center justify-center overflow-hidden">
        <motion.div style={{ y: heroY, opacity: heroOpacity }} className="absolute inset-0 z-0">
          <motion.img 
            initial={{ scale: 1.2 }}
            animate={{ scale: 1 }}
            transition={{ duration: 3, ease: "easeOut" }}
            src="https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&q=80&w=2000" 
            alt="Cuisine Saine" 
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-accent/45 via-accent/15 to-transparent" />
          <div className="absolute inset-0 bg-gradient-to-b from-dark/95 via-dark/60 to-beige" />
        </motion.div>

        <div className="container relative z-10 mx-auto px-4 text-center pt-32 md:pt-44 pb-16 md:pb-20">
          <motion.div
            variants={containerVariants}
            initial="hidden"
            animate="visible"
            className="max-w-5xl mx-auto"
          >
            {/* Badge Premium avec lévitation */}
            <motion.div 
              variants={itemVariants}
              animate={{ y: [0, -8, 0] }}
              transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }}
              className="inline-flex items-center gap-3 bg-white/15 backdrop-blur-2xl text-white px-7 py-3 rounded-full mb-10 border border-white/30 shadow-[0_20px_50px_rgba(0,0,0,0.3)]"
            >
              <div className="w-2 h-2 bg-primary rounded-full animate-pulse shadow-[0_0_10px_#8B1D1D]" />
              <span className="text-[9px] md:text-[11px] font-black uppercase tracking-[0.4em]">Qualité Premium Africa</span>
            </motion.div>

            <motion.h1 variants={itemVariants} className="text-2xl sm:text-3xl md:text-6xl lg:text-7xl font-black leading-tight text-white mb-6 sm:mb-8 tracking-tight">
              Faites des économies de <span className="text-accent underline decoration-accent/30 decoration-4 sm:decoration-6 md:decoration-8 underline-offset-4 sm:underline-offset-8">temps</span> <br className="hidden md:block" /> et d'argent. <br/>
              <span className="text-secondary italic">Manger bien et sainement.</span>
            </motion.h1>

            <motion.p variants={itemVariants} className="text-sm sm:text-base md:text-xl text-white/80 mb-8 sm:mb-12 max-w-3xl mx-auto leading-relaxed font-medium">
              Des ingrédients frais et de qualité, livrés chez vous,<br className="hidden sm:block" /> pour des recettes faciles à réaliser.
            </motion.p>

            <motion.div variants={itemVariants} className="flex flex-col sm:flex-row items-center justify-center gap-6">
              <motion.button 
                whileHover={{ scale: 1.05, y: -4, boxShadow: "0 25px 50px -12px rgba(242,153,74,0.5)" }}
                whileTap={{ scale: 0.98 }}
                onClick={() => onNavigate('recipes')}
                className="w-full sm:w-auto bg-accent text-white px-12 py-6 rounded-[2rem] font-black text-xl shadow-2xl shadow-accent/30 flex items-center justify-center gap-4 transition-all"
              >
                Commander ma box
                <ArrowRight size={24} />
              </motion.button>
              <motion.div 
                whileHover={{ backgroundColor: "rgba(255,255,255,0.2)" }}
                className="px-10 py-6 rounded-[2rem] border border-white/30 bg-white/15 backdrop-blur-xl text-white font-black text-2xl shadow-2xl"
              >
                Dès 2 500 F
              </motion.div>
            </motion.div>

            {/* Scroll Indicator */}
            <motion.div 
              variants={itemVariants}
              animate={{ y: [0, 15, 0] }}
              transition={{ repeat: Infinity, duration: 2.5 }}
              className="mt-24 text-white/40 flex flex-col items-center gap-3"
            >
              <span className="text-[10px] font-black uppercase tracking-[0.3em]">Scrollez pour découvrir</span>
              <div className="w-0.5 h-16 bg-gradient-to-b from-primary to-transparent rounded-full shadow-[0_0_15px_#8B1D1D]" />
            </motion.div>
          </motion.div>
        </div>
      </section>

      {/* Comment ça marche */}
      <section id="how-it-works" className="container mx-auto px-4 md:px-6 py-10 overflow-x-hidden max-w-full">
        <motion.div 
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center max-w-2xl mx-auto mb-20"
        >
          <p className="text-primary font-black text-[11px] uppercase tracking-[0.4em] mb-4">Notre Magie</p>
          <h2 className="text-4xl md:text-5xl font-black mb-6 tracking-tighter text-dark leading-tight">Comment ça marche ?</h2>
          <div className="h-2 w-20 bg-primary mx-auto rounded-full" />
        </motion.div>
        
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-8">
          {HOW_IT_WORKS.map((step, index) => (
            <motion.div 
              key={index}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.15 }}
              whileHover={{ y: -10 }}
              className="bg-white p-4 sm:p-6 md:p-10 rounded-2xl sm:rounded-[2rem] md:rounded-[3rem] shadow-[0_10px_40px_rgba(0,0,0,0.03)] border border-beige/50 text-center group transition-all hover:shadow-[0_30px_60px_rgba(139,29,29,0.1)]"
            >
              <div className="w-12 h-12 sm:w-14 sm:h-14 md:w-16 md:h-16 bg-beige text-primary text-base sm:text-lg md:text-xl font-black rounded-2xl sm:rounded-3xl flex items-center justify-center mb-4 sm:mb-6 md:mb-8 mx-auto group-hover:bg-primary group-hover:text-white group-hover:rotate-6 transition-all duration-500">
                {index + 1}
              </div>
              <h3 className="text-sm sm:text-base md:text-lg font-black mb-2 sm:mb-3 md:mb-4 text-dark">{step.title}</h3>
              <p className="text-dark/40 text-xs sm:text-sm leading-relaxed font-medium">{step.description}</p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Carousel Recettes - TAILLE RÉDUITE MAINTENUE */}
      <section className="bg-white py-24 overflow-hidden border-y border-beige/50 w-full max-w-full">
        <div className="container mx-auto px-4 md:px-6 mb-16 flex flex-col md:flex-row items-center md:items-end justify-between gap-6 max-w-full">
          <motion.div 
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="space-y-3 text-center md:text-left"
          >
            <p className="text-accent font-black text-[11px] uppercase tracking-[0.4em]">Le Marché</p>
            <h2 className="text-4xl md:text-5xl font-black text-dark tracking-tighter leading-tight">Nos <span className="text-primary">recettes</span> phares</h2>
          </motion.div>
          <motion.button 
            whileHover={{ x: 5 }}
            onClick={() => onNavigate('recipes')} 
            className="text-xs font-black text-accent hover:text-orange-600 uppercase tracking-widest transition-colors mb-2 bg-accent/5 px-6 py-3 rounded-full"
          >
            Tout le catalogue →
          </motion.button>
        </div>

        <div className="relative">
          {infiniteRecipes.length === 0 ? (
            <div className="text-center py-16 text-dark/40">
              <p className="text-sm font-medium">Chargement des recettes...</p>
            </div>
          ) : (
            <div className="relative">
              <button
                type="button"
                onClick={() => scrollCarouselBy(-360)}
                className="hidden md:flex items-center justify-center absolute left-3 top-1/2 -translate-y-1/2 z-10 w-12 h-12 rounded-full bg-white/90 backdrop-blur shadow-lg border border-beige/60 text-dark/70 hover:text-primary hover:bg-white transition-colors"
                aria-label="Faire défiler vers la gauche"
              >
                <ChevronLeft size={20} />
              </button>
              <button
                type="button"
                onClick={() => scrollCarouselBy(360)}
                className="hidden md:flex items-center justify-center absolute right-3 top-1/2 -translate-y-1/2 z-10 w-12 h-12 rounded-full bg-white/90 backdrop-blur shadow-lg border border-beige/60 text-dark/70 hover:text-primary hover:bg-white transition-colors"
                aria-label="Faire défiler vers la droite"
              >
                <ChevronRight size={20} />
              </button>

              <div ref={scrollRef} onMouseEnter={() => setIsCarouselPaused(true)} onMouseLeave={() => setIsCarouselPaused(false)} className="flex gap-8 overflow-x-auto no-scrollbar pb-16 px-4 sm:px-6 md:px-10 max-w-full">
                {infiniteRecipes.map((recipe, index) => (
                <motion.div 
                  key={`${recipe.id}-${index}`} 
                  whileHover={{ scale: 1.02 }}
                  className="flex-shrink-0 w-[200px] sm:w-[240px] md:w-[280px] lg:w-[320px]"
                >
                  <div onClick={() => onNavigate('recipe-detail', { recipe })} className="relative h-[320px] sm:h-[380px] md:h-[400px] rounded-2xl sm:rounded-[2rem] overflow-hidden shadow-2xl border-[6px] sm:border-[8px] md:border-[10px] border-white group cursor-pointer">
                    <img 
                      src={recipe.image || `/recipes/${recipe.id}.jpg`} 
                      alt={recipe.title} 
                      loading="lazy"
                      className="absolute inset-0 w-full h-full object-cover object-center group-hover:scale-110 transition-transform duration-[1.5s]" 
                      style={{ objectFit: 'cover', objectPosition: 'center' }}
                      onError={(e) => {
                        const img = e.currentTarget as HTMLImageElement;
                        const fallback = `/recipes/${recipe.id}.jpg`;
                        if (!img.src.endsWith(fallback)) {
                          img.src = fallback;
                        }
                      }}
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-dark/95 via-dark/20 to-transparent opacity-80 group-hover:opacity-100 transition-opacity duration-500" />
                    <div className="absolute bottom-0 left-0 right-0 p-4 sm:p-6 md:p-8">
                      <motion.span 
                        whileHover={{ scale: 1.1 }}
                        className="bg-accent text-white px-2.5 sm:px-3.5 py-0.5 sm:py-1 rounded-full text-[8px] sm:text-[9px] font-black uppercase mb-2 sm:mb-3 inline-block shadow-xl shadow-accent/20"
                      >
                        Nouveauté
                      </motion.span>
                      <h3 className="text-base sm:text-lg md:text-xl font-black text-white leading-tight mb-2 sm:mb-3 group-hover:text-accent transition-colors duration-300">{recipe.title}</h3>
                      <div className="flex items-center gap-2 sm:gap-3 text-white/70 text-[10px] sm:text-xs font-bold">
                         <div className="flex items-center gap-2">
                           <Clock size={14} className="text-primary" />
                           <span>{recipe.time}</span>
                         </div>
                      </div>
                    </div>
                  </div>
                </motion.div>
                ))}
              </div>
            </div>
          )}
        </div>
      </section>

      {/* FAQ & Témoignages */}
      <section className="w-full px-4 sm:px-4 md:px-6 py-10 sm:py-12 md:py-16 overflow-x-hidden max-w-full">
        <div className="max-w-7xl mx-auto grid lg:grid-cols-2 gap-6 sm:gap-8 md:gap-12 lg:gap-20 w-full">
          {/* Section FAQ */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="w-full mx-auto min-w-0"
          >
            <div className="flex items-center gap-3 sm:gap-4 mb-4 sm:mb-6 md:mb-8 min-w-0">
              <div className="w-9 h-9 sm:w-12 sm:h-12 md:w-14 md:h-14 bg-primary text-white rounded-2xl sm:rounded-3xl md:rounded-[1.5rem] flex-shrink-0 flex items-center justify-center shadow-xl shadow-primary/20">
                <HelpCircle className="w-4 h-4 sm:w-6 sm:h-6 md:w-7 md:h-7" />
              </div>
              <h2 className="text-xl sm:text-2xl md:text-4xl font-black tracking-tight text-dark min-w-0 flex-shrink">Questions fréquentes</h2>
            </div>
            <div className="bg-white rounded-2xl sm:rounded-3xl md:rounded-[3.5rem] shadow-lg border border-beige overflow-hidden w-full max-w-full">
              {FAQ_DATA.map((item, index) => (
                <FAQItem
                  key={index}
                  question={item.question}
                  answer={item.answer}
                  isOpen={openFAQIndex === index}
                  onClick={() => setOpenFAQIndex(openFAQIndex === index ? null : index)}
                />
              ))}
            </div>
          </motion.div>

          {/* Section Témoignages */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="w-full max-w-2xl mx-auto lg:max-w-none min-w-0"
          >
            <div className="flex items-center gap-3 sm:gap-4 md:gap-5 mb-6 sm:mb-8 md:mb-12 min-w-0">
              <div className="w-10 h-10 sm:w-12 sm:h-12 md:w-14 md:h-14 bg-accent text-white rounded-2xl sm:rounded-3xl md:rounded-[1.5rem] flex-shrink-0 flex items-center justify-center shadow-xl shadow-accent/20">
                <Star className="w-5 h-5 sm:w-6 sm:h-6 md:w-8 md:h-8" />
              </div>
              <h2 className="text-2xl sm:text-3xl md:text-4xl font-black tracking-tight md:tracking-tighter text-dark min-w-0 flex-shrink">Avis de nos chefs</h2>
            </div>
          
            {/* Liste verticale pour tous les écrans */}
            <div className="space-y-4 sm:space-y-5 md:space-y-6">
              {TESTIMONIALS.map((t, i) => (
                <motion.div 
                  key={i}
                  initial={{ opacity: 0, y: 20 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true, margin: "-20% 0px" }}
                  transition={{ delay: i * 0.1 }}
                  whileHover={{ x: 10, backgroundColor: "rgba(255,255,255,0.8)" }}
                  className="bg-white p-5 sm:p-6 md:p-8 rounded-2xl sm:rounded-[1.5rem] md:rounded-[2rem] border border-beige flex gap-4 sm:gap-5 md:gap-6 items-start shadow-sm transition-all cursor-default w-full max-w-full min-w-0"
                >
                  <img 
                    src={t.avatar} 
                    className="w-14 h-14 sm:w-15 sm:h-15 md:w-16 md:h-16 rounded-xl sm:rounded-2xl md:rounded-[1.5rem] border-2 sm:border-3 md:border-4 border-beige object-cover shadow-lg flex-shrink-0" 
                    alt={t.name} 
                  />
                  <div className="space-y-2 sm:space-y-2.5 md:space-y-3 min-w-0 flex-1">
                    <div className="flex gap-1">
                      {[...Array(5)].map((_, s) => (
                        <Star 
                          key={s} 
                          size={14} 
                          className={`${s < t.stars ? 'fill-accent text-accent' : 'text-beige'} w-3.5 h-3.5 sm:w-4 sm:h-4 flex-shrink-0`} 
                        />
                      ))}
                    </div>
                    <p className="text-sm sm:text-base font-medium text-dark/80 italic leading-relaxed break-words">"{t.content}"</p>
                    <div>
                      <p className="text-xs sm:text-sm font-black uppercase text-dark tracking-wider break-words">{t.name}</p>
                      <p className="text-[10px] sm:text-[11px] font-bold text-primary uppercase mt-0.5 sm:mt-1 tracking-tight break-words">{t.role}</p>
                    </div>
                  </div>
                </motion.div>
              ))}
            </div>
          </motion.div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="container mx-auto px-4 md:px-6 py-16 overflow-x-hidden max-w-full">
        <motion.div 
          whileInView={{ scale: [0.95, 1], opacity: [0, 1] }}
          className="bg-primary rounded-[4rem] p-16 md:p-24 text-center relative overflow-hidden text-white shadow-[0_40px_100px_rgba(139,29,29,0.25)]"
        >
          <div className="relative z-10 max-w-3xl mx-auto">
            <h3 className="text-4xl md:text-6xl font-black mb-10 leading-tight tracking-tighter">Prêt à cuisiner comme un chef ?</h3>
            <p className="text-white/80 text-xl mb-14 font-medium max-w-xl mx-auto">Rejoignez des milliers de familles qui ont simplifié leur quotidien avec CuisineFacile.</p>
            <motion.button
              whileHover={{ scale: 1.05, y: -5, backgroundColor: "#FFFFFF", color: "#8B1D1D" }}
              whileTap={{ scale: 0.95 }}
              onClick={() => onNavigate('recipes')}
              className="bg-accent text-white px-14 py-6 rounded-[2rem] font-black text-xl shadow-2xl transition-all"
            >
              Découvrir le menu du jour
            </motion.button>
          </div>
          {/* Decorative elements */}
          <div className="absolute top-0 right-0 w-96 h-96 bg-white/10 rounded-full -mr-48 -mt-48 blur-[100px]" />
          <div className="absolute bottom-0 left-0 w-96 h-96 bg-accent/20 rounded-full -ml-48 -mb-48 blur-[100px]" />
        </motion.div>
      </section>
    </div>
  );
};

export default Home;
