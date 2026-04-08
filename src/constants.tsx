
import { Recipe } from './types';

export const COLORS = {
  primary: '#8B1D1D',
  secondary: '#A52A2A',
  accent: '#F2994A',
  beige: '#FAF7F2',
  dark: '#2B2B2B',
  white: '#FFFFFF',
};

export const CONTACT_INFO = {
  phone: '+225 07 09 30 24 81',
  email: 'admin@cuisinefacile.africa',
};

export const RECIPES: Recipe[] = [
  {
    id: '1',
    title: 'Poulet Yassa Traditionnel',
    description: 'Le classique sénégalais revisité avec des oignons caramélisés et du citron frais.',
    image: 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&q=80&w=800',
    price: 3500,
    time: '35 min',
    calories: '450 kcal',
    category: 'Classique',
    tags: ['Sain', 'Rapide'],
    ingredients: [
      { id: 'i1', name: 'Poulet fermier', unit: 'g', quantity: 500, pricePerUnit: 4 },
      { id: 'i2', name: 'Oignons', unit: 'pièce', quantity: 4, pricePerUnit: 100 },
      { id: 'i3', name: 'Citron vert', unit: 'pièce', quantity: 3, pricePerUnit: 150 },
      { id: 'i4', name: 'Riz parfumé', unit: 'g', quantity: 300, pricePerUnit: 2 }
    ],
    preparation: [
      { stepNumber: 1, description: 'Mariner le poulet avec le jus de citron et les oignons émincés.' },
      { stepNumber: 2, description: 'Faire dorer les morceaux de poulet.' },
      { stepNumber: 3, description: 'Mijoter à feu doux.' }
    ]
  },
  {
    id: '2',
    title: 'Poisson Braisé & Alloco',
    description: 'Daurade fraîche assaisonnée, accompagnée de bananes plantains frites.',
    image: 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&q=80&w=800',
    price: 4500,
    time: '45 min',
    calories: '520 kcal',
    category: 'Mer',
    tags: ['Premium', 'Local'],
    ingredients: [
      { id: 'i6', name: 'Daurade Royale', unit: 'pièce', quantity: 1, pricePerUnit: 2500 },
      { id: 'i7', name: 'Banane Plantain', unit: 'pièce', quantity: 3, pricePerUnit: 300 }
    ],
    preparation: [
      { stepNumber: 1, description: 'Nettoyer et écailler le poisson.' },
      { stepNumber: 2, description: 'Griller au charbon de bois.' }
    ]
  },
  {
    id: '3',
    title: 'Mafé de Légumes',
    description: 'Version végétarienne onctueuse avec une sauce arachide maison.',
    image: 'https://images.unsplash.com/photo-1540648336483-d045d737ca98?auto=format&fit=crop&q=80&w=800',
    price: 2500,
    time: '30 min',
    calories: '380 kcal',
    category: 'Veggie',
    tags: ['Végétarien'],
    ingredients: [
      { id: 'i10', name: 'Pâte d\'arachide', unit: 'g', quantity: 150, pricePerUnit: 3 },
      { id: 'i11', name: 'Carottes', unit: 'g', quantity: 200, pricePerUnit: 2 }
    ],
    preparation: [
      { stepNumber: 1, description: 'Diluer la pâte d\'arachide.' },
      { stepNumber: 2, description: 'Mijoter avec les légumes.' }
    ]
  }
];

export const HOW_IT_WORKS = [
  {
    title: 'Choisissez vos recettes',
    description: 'Parcourez notre menu hebdomadaire et sélectionnez vos plats préférés.',
  },
  {
    title: 'Ajustez votre box',
    description: 'Indiquez le nombre de personnes et la fréquence.',
  },
  {
    title: 'Recevez votre box',
    description: 'Livraison d\'ingrédients frais directement chez vous.',
  },
  {
    title: 'Cuisinez facilement',
    description: 'Suivez les étapes simples avec notre chef virtuel.',
  },
];
