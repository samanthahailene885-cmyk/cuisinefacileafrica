
export interface Ingredient {
  id: string;
  name: string;
  unit: string;
  quantity: number;
  pricePerUnit?: number; // Optionnel : peut être undefined si le prix n'est pas disponible
  image?: string;
}

export interface PreparationStep {
  stepNumber: number;
  description: string;
  duration?: string;
}

export interface Recipe {
  id: string;
  title: string;
  description: string;
  image: string;
  price: number; // Prix de base pour le kit complet
  time: string;
  calories: string;
  category: string;
  tags: string[];
  ingredients: Ingredient[];
  preparation: PreparationStep[];
}

export interface SelectedIngredient extends Ingredient {
  selected: boolean;
  selectedQuantity: number;
}

export interface CartItem {
  recipe: Recipe;
  selectedIngredients: SelectedIngredient[];
  totalPrice: number;
  quantity: number; // Quantité de "boxes" de cette configuration
  personsCount: number;
  recipesCount: number;
}

export interface Order {
  id: string;
  date: string;
  total: number;
  items: CartItem[];
  status: 'pending' | 'delivered' | 'processing';
}

export interface User {
  email: string;
  phone: string;
  name: string;
  role?: 'user' | 'admin'; // Rôle de l'utilisateur (par défaut: 'user')
}
