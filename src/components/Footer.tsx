
import React from 'react';
import { Phone, Mail, Instagram, Facebook, MapPin } from 'lucide-react';
import { CONTACT_INFO } from '../constants';

// Icône TikTok personnalisée
const TikTokIcon: React.FC<{ size?: number }> = ({ size = 18 }) => (
  <svg width={size} height={size} viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
    <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64 2.93 2.93 0 0 1 .88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1-.1z"/>
  </svg>
);

const Footer: React.FC = () => {
  const cardLogo = new URL('../public/payments/card.png', import.meta.url).toString();
  const waveLogo = new URL('../public/payments/wave.jpg', import.meta.url).toString();
  const orangeMoneyLogo = new URL('../public/payments/orange-money.jpg', import.meta.url).toString();
  const mtnMoneyLogo = new URL('../public/payments/mtn-money.png', import.meta.url).toString();
  const moovMoneyLogo = new URL('../public/payments/moov-money.png', import.meta.url).toString();

  return (
    <footer className="bg-dark text-white pt-16 pb-8 overflow-x-hidden max-w-full">
      <div className="container mx-auto px-4 md:px-6 max-w-full">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-12">
          {/* Brand */}
          <div className="space-y-4">
            <div className="flex items-center gap-2">
              <img 
                src="/CUISINE.png" 
                alt="Logo CuisineFacile" 
                className="h-16 w-auto object-contain" 
              />
            </div>
            <p className="text-white/60 text-sm leading-relaxed">
              Manger bien et sainement sans effort. Nous livrons des ingrédients de qualité supérieure directement chez vous.
            </p>
            <div className="flex gap-4">
              <a 
                href="https://www.instagram.com/cuisine_facile_africa/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center hover:bg-primary transition-colors"
                aria-label="Instagram"
              >
                <Instagram size={18} />
              </a>
              <a 
                href="https://www.facebook.com/CuisineFacileAfrica1/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center hover:bg-primary transition-colors"
                aria-label="Facebook"
              >
                <Facebook size={18} />
              </a>
              <a 
                href="https://www.tiktok.com/@cuisine.facile.af?_t=8f1cqdY7nc5&_r=1" 
                target="_blank" 
                rel="noopener noreferrer"
                className="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center hover:bg-primary transition-colors"
                aria-label="TikTok"
              >
                <TikTokIcon size={18} />
              </a>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="font-bold text-lg mb-6">Liens Rapides</h4>
            <ul className="space-y-3 text-white/60 text-sm">
              <li><a href="#" className="hover:text-primary transition-colors">Nos Recettes</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Abonnement</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Espace Client</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">FAQ</a></li>
            </ul>
          </div>

          {/* Legal */}
          <div>
            <h4 className="font-bold text-lg mb-6">Légal</h4>
            <ul className="space-y-3 text-white/60 text-sm">
              <li><a href="#" className="hover:text-primary transition-colors">CGV</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Politique de confidentialité</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Mentions Légales</a></li>
            </ul>
          </div>

          {/* Contact */}
          <div>
            <h4 className="font-bold text-lg mb-6">Contact</h4>
            <ul className="space-y-4 text-white/60 text-sm">
              <li className="flex items-start gap-3">
                <Phone size={18} className="text-primary mt-1" />
                <a 
                  href="https://wa.me/2250709302481" 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="hover:text-primary transition-colors"
                  aria-label="Contacter sur WhatsApp"
                >
                  {CONTACT_INFO.phone}
                </a>
              </li>
              <li className="flex items-start gap-3">
                <Mail size={18} className="text-primary mt-1" />
                <a 
                  href={`mailto:${CONTACT_INFO.email}`}
                  className="hover:text-primary transition-colors"
                  aria-label="Envoyer un email"
                >
                  {CONTACT_INFO.email}
                </a>
              </li>
              <li className="flex items-start gap-3">
                <MapPin size={18} className="text-primary mt-1" />
                <span>Abidjan, Côte d'Ivoire</span>
              </li>
            </ul>
          </div>
        </div>

        <div className="border-t border-white/10 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-white/40 text-xs text-center md:text-left">
            © {new Date().getFullYear()} CuisineFacile Africa. Tous droits réservés.
          </p>
          <div className="flex items-center gap-4">
            <img
              src={cardLogo}
              alt="Carte bancaire"
              className="h-7 md:h-8 opacity-80 hover:opacity-100 transition-opacity"
              onError={(e) => {
                (e.currentTarget as HTMLImageElement).src = 'https://img.icons8.com/color/48/visa.png';
              }}
            />
            <img src={orangeMoneyLogo} alt="Orange Money" className="h-7 md:h-8 opacity-80 hover:opacity-100 transition-opacity" />
            <img src={mtnMoneyLogo} alt="MTN Money" className="h-7 md:h-8 opacity-80 hover:opacity-100 transition-opacity" />
            <img src={moovMoneyLogo} alt="Moov Money" className="h-7 md:h-8 opacity-80 hover:opacity-100 transition-opacity" />
            <img src={waveLogo} alt="Wave" className="h-7 md:h-8 opacity-80 hover:opacity-100 transition-opacity" />
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
