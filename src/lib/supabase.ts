import { createClient } from '@supabase/supabase-js';
import { Recipe, Order, User, Ingredient, PreparationStep, CartItem } from '../types';
import { RECIPES } from '../constants';
import { getLocalRecipes } from './localRecipes';

const API_BASE_URL = String(import.meta.env.VITE_API_BASE_URL || '').replace(/\/+$/, '');

// Configuration Supabase
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

 const getAdminEmailAllowlist = (): Set<string> => {
   const raw = String(import.meta.env.VITE_ADMIN_EMAILS || '');
   const emails = raw
     .split(',')
     .map((e) => e.trim())
     .map((e) => e.replace(/^['"]+|['"]+$/g, ''))
     .map((e) => e.trim().toLowerCase())
     .filter(Boolean);
   return new Set(emails);
 };

 const getAdminEmailForRequest = (): string => {
   const direct = String(localStorage.getItem('admin_email') || '').trim().toLowerCase();
   if (direct) return direct;

   const rawUser = localStorage.getItem('user');
   if (!rawUser) return '';
   try {
     const parsed = JSON.parse(rawUser);
     const email = String(parsed?.email || '').trim().toLowerCase();
     if (!email) return '';
     if (getAdminEmailAllowlist().has(email)) return email;
     return '';
   } catch {
     return '';
   }
 };

export const supabaseConfigured = Boolean(supabaseUrl && supabaseAnonKey);

const apiConfigured = Boolean(API_BASE_URL);

export const supabase = supabaseConfigured
  ? createClient(supabaseUrl, supabaseAnonKey)
  : null;

const apiFetch = async <T>(
  path: string,
  opts?: {
    method?: 'GET' | 'POST';
    body?: any;
    adminEmail?: string;
  }
): Promise<T> => {
  if (!apiConfigured) {
    throw new Error('Missing API base url. Please set VITE_API_BASE_URL.');
  }

  const url = `${API_BASE_URL}${path.startsWith('/') ? '' : '/'}${path}`;
  const res = await fetch(url, {
    method: opts?.method || 'GET',
    headers: {
      'Content-Type': 'application/json',
      ...(opts?.adminEmail ? { 'X-Admin-Email': opts.adminEmail } : {}),
    },
    body: opts?.body ? JSON.stringify(opts.body) : undefined,
  });

  const rawText = await res.text().catch(() => '');
  const json = (() => {
    if (!rawText) return null;
    try {
      return JSON.parse(rawText);
    } catch {
      return null;
    }
  })();

  if (!res.ok) {
    const msg = (json && (json.error || json.message))
      ? String(json.error || json.message)
      : (rawText ? String(rawText).slice(0, 300) : `HTTP ${res.status}`);
    throw new Error(`${msg} (HTTP ${res.status})`);
  }

  if (!json || json.ok !== true) {
    const detail = json && (json.error || json.message)
      ? String(json.error || json.message)
      : (rawText ? String(rawText).slice(0, 300) : 'Unexpected API response');
    throw new Error(`${detail} (URL: ${url})`);
  }

  return (json as any).data as T;
};

const mapApiRecipe = (r: any): Recipe => {
  const ingredientsRaw = Array.isArray(r?.ingredients) ? r.ingredients : [];
  const stepsRaw = Array.isArray(r?.preparation_steps) ? r.preparation_steps : (Array.isArray(r?.preparation) ? r.preparation : []);

  return {
    id: String(r.id),
    title: String(r.title ?? ''),
    description: String(r.description ?? ''),
    image: String(r.image ?? ''),
    price: Number(r.price ?? 0),
    time: String(r.time ?? ''),
    calories: String(r.calories ?? ''),
    category: String(r.category ?? ''),
    tags: Array.isArray(r.tags) ? (r.tags as string[]) : [],
    ingredients: ingredientsRaw.map((ing: any) => ({
      id: String(ing.id),
      name: String(ing.name ?? ''),
      unit: String(ing.unit ?? ''),
      quantity: Number(ing.quantity ?? 0),
      pricePerUnit: ing.pricePerUnit !== undefined
        ? (ing.pricePerUnit === null ? undefined : Number(ing.pricePerUnit))
        : (ing.price_per_unit === null || ing.price_per_unit === undefined ? undefined : Number(ing.price_per_unit)),
      image: ing.image ? String(ing.image) : undefined,
    })),
    preparation: stepsRaw.map((s: any) => ({
      stepNumber: Number(s.stepNumber ?? s.step_number ?? 0),
      description: String(s.description ?? ''),
      duration: s.duration ? String(s.duration) : undefined,
    })),
  };
};

const normalizeRecipeTitleKey = (title: string): string => {
  return String(title || '')
    .trim()
    .toUpperCase()
    .replace(/[’]/g, "'")
    .replace(/\s+/g, ' ');
};

const CATEGORY_OVERRIDES: Record<string, 'Africaines' | 'Flexitariennes' | 'Boissons' | 'Calories Smart'> = (() => {
  const africaines = [
    'SAUCE DAH SIMPLE AVEC SOUMARA',
    'LA SAUCE TOMATE',
    'LA SAUCE PISTACHE',
    "LA SAUCE DAH AVEC PÂTE D’ARACHIDE",
    'LA SAUCE DAH AVEC ARACHIDE PILE',
    'LA SAUCE GOMBO',
    'LA SAUCE GRAINE',
    'BROCHETTES DE POULET',
    'TCHEP SENEGALAIS',
    'CHOUKOUYA DE GAMBAS',
    'SOUMARA LAFRI',
    'SAUCE ARACHIDE',
    'TRA TRA',
    'RAT BRAISE A LA VILLAGEOISE',
    'DJOUMBGLE SAUCE GRAINE AU PANGOLIN',
    "PEPE SOUPE A L’HERISSON",
    "GNANGNAN A L’HERISSON",
    'RIZ DINOR A LA SAUCE CURRY AU POULET',
    'GOUAGOUASSOU (mélange gnangnan et gombos frais)',
    "KEDJENOU D’AGOUTI",
    'AGOUTI PIQUE',
    'CHIPS DE PATATES DOUCES',
    'ZRIN',
    'SAUCE NANMOUKOU',
  ];

  const flexitariennes = [
    'CREME BRULEE',
    'SOUPES DE CRUSTACES',
    'CASSOLETTE DE MOULES',
    "GUACAMOLE D’ECREVISSES",
    "TARTARE D’ECREVISSES",
    'PRINTEMPS AUX GAMBAS',
    'RIZ AUX GAMBAS',
    'CROUSTILLANTS DE GAMBAS',
    'GAMBAS A LA CREME',
    'CREPES SALEES AUX CREVETTES',
    'BOUCHEES DE CREVETTES',
    'CREVETTES CREOLES',
    'BEIGNETS AUX CREVETTES',
    'GRATIN DE CREVETTES A LA BECHAMEL',
    'CRABES BRAISES 225',
    'BIEKOSSEU DE CRABES',
  ];

  const boissons = [
    'INFUSION GLACÉE BISSAP BLANC. ROSE. COROSSOL',
    'CHOCOLAT CHAUD AU PIMENT ET SA VERSION VIENNOIS AUX ÉPICES',
    "LAIT D'ARACHIDE VANILLÉ (1 litre)",
  ];

  const caloriesSmart = [
    'GRANDE SALADE VERTE',
    'PUDDING DE CHIA (2 personnes)',
    'HOUMOUS AU CITRON',
    'SMOOTHIE PROTEINE à la vanille et aux pois',
    'PAMPLEMOUSSES AUX CREVETTES',
    'BOUILLIE DE MIL AUX 4 SAVEURS',
    'SALADE DE FRUITS AU TAMARIN',
    'SALADE DE LEGUMES A L’AGOUTI',
    'COCKTAIL POMME-CITRON',
  ];

  const out: Record<string, 'Africaines' | 'Flexitariennes' | 'Boissons' | 'Calories Smart'> = {};
  for (const t of africaines) out[normalizeRecipeTitleKey(t)] = 'Africaines';
  for (const t of flexitariennes) out[normalizeRecipeTitleKey(t)] = 'Flexitariennes';
  for (const t of boissons) out[normalizeRecipeTitleKey(t)] = 'Boissons';
  for (const t of caloriesSmart) out[normalizeRecipeTitleKey(t)] = 'Calories Smart';
  return out;
})();

const applyCategoryOverride = (recipe: Recipe): Recipe => {
  const key = normalizeRecipeTitleKey(recipe.title);
  const forced = CATEGORY_OVERRIDES[key];
  if (!forced) return recipe;

  const existingTags = Array.isArray(recipe.tags) ? recipe.tags : [];
  const tags = existingTags.includes(forced) ? existingTags : [...existingTags, forced];
  return { ...recipe, category: forced, tags };
};

const mapApiRecipeOrNull = (r: any): Recipe | null => {
  if (!r) return null;
  return mapApiRecipe(r);
};

const mapApiOrder = (o: any): Order & { user?: User; deliveryAddress?: string } => {
  const date = String(o?.date ?? o?.created_at ?? o?.createdAt ?? new Date().toISOString());
  const total = Number(o?.total ?? 0);
  const status = (String(o?.status ?? 'pending') as any) as 'pending' | 'processing' | 'delivered';

  const userRaw = o?.user ?? null;
  const user: User | undefined = userRaw
    ? {
        email: String(userRaw?.email ?? ''),
        name: String(userRaw?.name ?? ''),
        phone: String(userRaw?.phone ?? ''),
        role: (userRaw?.role as any) ?? undefined,
      }
    : undefined;

  const deliveryAddress = String(o?.deliveryAddress ?? o?.delivery_address ?? '');

  const itemsRaw = Array.isArray(o?.items) ? o.items : [];
  const items = itemsRaw.map((it: any) => {
    const recipe = mapApiRecipe(it?.recipe ?? {});
    const selectedIngredientsRaw = Array.isArray(it?.selectedIngredients) ? it.selectedIngredients : [];
    const selectedIngredients = selectedIngredientsRaw.map((ing: any) => ({
      id: String(ing?.id ?? ''),
      name: String(ing?.name ?? ''),
      unit: String(ing?.unit ?? ''),
      quantity: Number(ing?.quantity ?? 0),
      pricePerUnit: ing?.pricePerUnit === null || ing?.pricePerUnit === undefined ? undefined : Number(ing.pricePerUnit),
      selected: Boolean(ing?.selected ?? true),
      selectedQuantity: Number(ing?.selectedQuantity ?? 0),
    }));

    return {
      recipe,
      selectedIngredients,
      totalPrice: Number(it?.totalPrice ?? it?.unitPrice ?? 0),
      quantity: Number(it?.quantity ?? 1),
      personsCount: Number(it?.personsCount ?? 0),
      recipesCount: Number(it?.recipesCount ?? 0),
    } as CartItem;
  });

  return {
    id: String(o?.id ?? ''),
    date,
    total,
    items,
    status,
    ...(user ? { user } : {}),
    ...(deliveryAddress ? { deliveryAddress } : {}),
  };
};

export const signUpWithPassword = async (
  email: string,
  password: string,
  profile?: { name?: string; phone?: string }
): Promise<User> => {
  if (apiConfigured) {
    throw new Error('Password auth disabled');
  }
  if (!supabaseConfigured || !supabase) {
    throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
  }

  let didSignIn = false;
  const { error } = await supabase.auth.signUp({
    email,
    password,
  });

  if (error) {
    const msg = String((error as any)?.message ?? error);
    // Si l'utilisateur existe déjà, on tente simplement de le connecter avec le mot de passe fourni.
    if (msg.toLowerCase().includes('already') || msg.toLowerCase().includes('registered') || msg.toLowerCase().includes('exists')) {
      await signInWithPassword(email, password);
      didSignIn = true;
    } else {
      throw error;
    }
  }

  // Forcer une session valide après création de compte.
  // Si la confirmation email est activée, la connexion échouera ici avec un message clair.
  if (!didSignIn) {
    try {
      await signInWithPassword(email, password);
    } catch (e) {
      const msg = String((e as any)?.message ?? e);
      if (msg.toLowerCase().includes('email') && msg.toLowerCase().includes('confirm')) {
        throw new Error('Email non confirmé. Désactivez la confirmation email dans Supabase (Option A) ou confirmez votre email.');
      }
      throw e;
    }
  }

  if (profile?.name || profile?.phone) {
    await upsertUser({
      email,
      name: profile?.name || '',
      phone: profile?.phone || '',
    } as User);
  }

  const user = await getUserByEmail(email);
  if (!user) {
    // Le profil peut ne pas exister si on ne l'a pas upsert.
    return {
      email,
      name: profile?.name || '',
      phone: profile?.phone || '',
      role: 'user',
    };
  }
  return user;
};

export const signInWithPassword = async (email: string, password: string): Promise<User> => {
  if (apiConfigured) {
    throw new Error('Password auth disabled');
  }
  if (!supabaseConfigured || !supabase) {
    throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
  }

  const { error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });
  if (error) throw error;

  const user = await getUserByEmail(email);
  if (!user) {
    throw new Error('Profil utilisateur introuvable');
  }
  return user;
};

export const signOut = async (): Promise<void> => {
  if (apiConfigured) return;
  if (!supabaseConfigured || !supabase) return;
  const { error } = await supabase.auth.signOut();
  if (error) throw error;
};

export const updatePassword = async (newPassword: string): Promise<void> => {
  if (apiConfigured) {
    throw new Error('Password auth disabled');
  }
  if (!supabaseConfigured || !supabase) {
    throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
  }
  const { error } = await supabase.auth.updateUser({ password: newPassword });
  if (error) throw error;
};

export const resendConfirmationEmail = async (email: string): Promise<void> => {
  if (apiConfigured) {
    throw new Error('Password auth disabled');
  }
  if (!supabaseConfigured || !supabase) {
    throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
  }
  const { error } = await supabase.auth.resend({
    type: 'signup',
    email,
  });
  if (error) throw error;
};

export const sendPasswordResetEmail = async (email: string, redirectTo?: string): Promise<void> => {
  if (apiConfigured) {
    throw new Error('Password auth disabled');
  }
  if (!supabaseConfigured || !supabase) {
    throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
  }
  const { error } = await supabase.auth.resetPasswordForEmail(email, {
    redirectTo,
  });
  if (error) throw error;
};

// Types pour les données de la base de données
interface RecipeRow {
  id: string;
  title: string;
  description: string;
  image: string;
  price: number;
  time: string;
  calories: string;
  category: string;
  tags: string[];
  created_at: string;
  updated_at: string;
}

interface IngredientRow {
  id: string;
  recipe_id: string;
  name: string;
  unit: string;
  quantity: number;
  price_per_unit: number | null; // Peut être NULL
  image: string | null;
}

interface PreparationStepRow {
  id: string;
  recipe_id: string;
  step_number: number;
  description: string;
  duration: string | null;
}

interface OrderRow {
  id: string;
  user_id: string | null;
  total: number;
  status: 'pending' | 'processing' | 'delivered';
  delivery_address: string | null;
  created_at: string;
  updated_at: string;
}

interface OrderItemRow {
  id: string;
  order_id: string;
  recipe_id: string;
  quantity: number;
  total_price: number;
  persons_count?: number | null;
  recipes_count?: number | null;
}

interface OrderItemIngredientRow {
  id: string;
  order_item_id: string;
  ingredient_id: string;
  selected: boolean;
  selected_quantity: number;
}

// ============================================
// SERVICE: Recipes (Recettes)
// ============================================

/**
 * Récupère toutes les recettes avec leurs ingrédients et étapes
 */
export const getRecipes = async (): Promise<Recipe[]> => {
  try {
    if (apiConfigured) {
      const rows = await apiFetch<any[]>('/recipes');
      return (rows || []).map(mapApiRecipe).map(applyCategoryOverride);
    }
    if (!supabaseConfigured || !supabase) {
      return getLocalRecipes().map(applyCategoryOverride);
    }
    // Récupérer les recettes
    const { data: recipes, error: recipesError } = await supabase
      .from('recipes')
      .select('*')
      .order('created_at', { ascending: false });

    if (recipesError) throw recipesError;
    if (!recipes) return [];

    // Pour chaque recette, récupérer les ingrédients et les étapes
    const recipesWithDetails = await Promise.all(
      recipes.map(async (recipe: RecipeRow) => {
        // Récupérer les ingrédients
        const { data: ingredients, error: ingredientsError } = await supabase
          .from('ingredients')
          .select('*')
          .eq('recipe_id', recipe.id)
          .order('name');

        if (ingredientsError) throw ingredientsError;

        // Récupérer les étapes de préparation
        const { data: steps, error: stepsError } = await supabase
          .from('preparation_steps')
          .select('*')
          .eq('recipe_id', recipe.id)
          .order('step_number');

        if (stepsError) throw stepsError;

        // Transformer les données au format Recipe
        return {
          id: recipe.id,
          title: recipe.title,
          description: recipe.description || '',
          image: recipe.image,
          price: Number(recipe.price),
          time: recipe.time,
          calories: recipe.calories,
          category: recipe.category,
          tags: recipe.tags || [],
          ingredients: (ingredients || []).map((ing: IngredientRow) => ({
            id: ing.id,
            name: ing.name,
            unit: ing.unit,
            quantity: Number(ing.quantity),
            pricePerUnit: ing.price_per_unit ? Number(ing.price_per_unit) : undefined,
            image: ing.image || undefined,
          })),
          preparation: (steps || []).map((step: PreparationStepRow) => ({
            stepNumber: step.step_number,
            description: step.description,
            duration: step.duration || undefined,
          })),
        } as Recipe;
      })
    );

    return recipesWithDetails.map(applyCategoryOverride);
  } catch (error) {
    console.error('Error fetching recipes:', error);
    throw error;
  }
};

/**
 * Récupère une recette par son ID
 */
export const getRecipeById = async (id: string): Promise<Recipe | null> => {
  try {
    if (apiConfigured) {
      const row = await apiFetch<any | null>(`/recipes/${id}`);
      const recipe = mapApiRecipeOrNull(row);
      return recipe ? applyCategoryOverride(recipe) : null;
    }
    if (!supabaseConfigured || !supabase) {
      const recipe = getLocalRecipes().find((r) => r.id === id) ?? null;
      return recipe ? applyCategoryOverride(recipe) : null;
    }
    // Récupérer la recette
    const { data: recipe, error: recipeError } = await supabase
      .from('recipes')
      .select('*')
      .eq('id', id)
      .single();

    if (recipeError) throw recipeError;
    if (!recipe) return null;

    // Récupérer les ingrédients
    const { data: ingredients, error: ingredientsError } = await supabase
      .from('ingredients')
      .select('*')
      .eq('recipe_id', id)
      .order('name');

    if (ingredientsError) throw ingredientsError;

    // Récupérer les étapes
    const { data: steps, error: stepsError } = await supabase
      .from('preparation_steps')
      .select('*')
      .eq('recipe_id', id)
      .order('step_number');

    if (stepsError) throw stepsError;

    // Transformer au format Recipe
    return applyCategoryOverride({
      id: recipe.id,
      title: recipe.title,
      description: recipe.description || '',
      image: recipe.image,
      price: Number(recipe.price),
      time: recipe.time,
      calories: recipe.calories,
      category: recipe.category,
      tags: recipe.tags || [],
      ingredients: (ingredients || []).map((ing: IngredientRow) => ({
        id: ing.id,
        name: ing.name,
        unit: ing.unit,
        quantity: Number(ing.quantity),
        pricePerUnit: ing.price_per_unit ? Number(ing.price_per_unit) : undefined,
        image: ing.image || undefined,
      })),
      preparation: (steps || []).map((step: PreparationStepRow) => ({
        stepNumber: step.step_number,
        description: step.description,
        duration: step.duration || undefined,
      })),
    } as Recipe);
  } catch (error) {
    console.error('Error fetching recipe:', error);
    throw error;
  }
};

// ============================================
// SERVICE: Users (Utilisateurs)
// ============================================

/**
 * Crée ou met à jour un utilisateur
 */
export const upsertUser = async (userData: User): Promise<User> => {
  try {
    if (apiConfigured) {
      return await apiFetch<User>('/users/upsert', {
        method: 'POST',
        body: {
          email: userData.email,
          phone: userData.phone,
          name: userData.name,
          role: userData.role || 'user',
        },
      });
    }
    if (!supabaseConfigured || !supabase) {
      throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
    }
    // NOTE: certains schémas n'ont pas encore la colonne `role`.
    // On tente avec `role`, puis on fallback sans `role` si la colonne n'existe pas.
    const tryUpsert = async (includeRole: boolean) => {
      const payload: any = {
        email: userData.email,
        phone: userData.phone,
        name: userData.name,
      };
      if (includeRole) {
        payload.role = userData.role || 'user';
      }

      const query = supabase
        .from('users')
        .upsert(payload, { onConflict: 'email' });

      // Si `role` n'existe pas, on ne peut pas faire `.select()` sur toutes les colonnes.
      const { data, error } = includeRole
        ? await query.select('email, phone, name, role').single()
        : await query.select('email, phone, name').single();

      return { data, error } as { data: any; error: any };
    };

    let { data, error } = await tryUpsert(true);
    if (error) {
      const msg = String((error as any)?.message ?? error);
      if (msg.toLowerCase().includes('column') && msg.toLowerCase().includes('role') && msg.toLowerCase().includes('does not exist')) {
        ({ data, error } = await tryUpsert(false));
      }
    }

    if (error) throw error;

    return {
      email: data.email,
      phone: data.phone,
      name: data.name,
      role: (data.role as 'user' | 'admin') || userData.role || 'user',
    };
  } catch (error) {
    console.error('Error upserting user:', error);
    throw error;
  }
};

/**
 * Récupère un utilisateur par email
 */
export const getUserByEmail = async (email: string): Promise<User | null> => {
  try {
    if (apiConfigured) {
      return await apiFetch<User | null>(`/users/by-email?email=${encodeURIComponent(email)}`);
    }
    if (!supabaseConfigured || !supabase) {
      return null;
    }
    const trySelect = async (includeRole: boolean) => {
      const { data, error } = await supabase
        .from('users')
        .select(includeRole ? 'email, phone, name, role' : 'email, phone, name')
        .eq('email', email)
        .single();

      return { data, error } as { data: any; error: any };
    };

    let { data, error } = await trySelect(true);
    if (error) {
      const msg = String((error as any)?.message ?? error);
      if (msg.toLowerCase().includes('column') && msg.toLowerCase().includes('role') && msg.toLowerCase().includes('does not exist')) {
        ({ data, error } = await trySelect(false));
      }
    }

    if (error) {
      if ((error as any).code === 'PGRST116') return null; // Pas trouvé
      throw error;
    }

    if (!data) return null;

    return {
      email: data.email,
      phone: data.phone,
      name: data.name,
      role: (data.role as 'user' | 'admin') || 'user',
    };
  } catch (error) {
    console.error('Error fetching user:', error);
    throw error;
  }
};

/**
 * Vérifie si un email existe déjà dans la base de données
 */
export const checkEmailExists = async (email: string): Promise<boolean> => {
  try {
    if (apiConfigured) {
      return await apiFetch<boolean>(`/users/email-exists?email=${encodeURIComponent(email)}`);
    }
    if (!supabaseConfigured || !supabase) {
      return false;
    }
    const { data, error } = await supabase
      .from('users')
      .select('email')
      .eq('email', email)
      .maybeSingle();

    if (error && error.code !== 'PGRST116') {
      throw error;
    }

    return !!data;
  } catch (error) {
    console.error('Error checking email:', error);
    return false;
  }
};

/**
 * Valide le format d'un email
 */
export const validateEmailFormat = (email: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};

// ============================================
// SERVICE: Orders (Commandes)
// ============================================

/**
 * Crée une nouvelle commande
 */
export const createOrder = async (
  userEmail: string,
  cartItems: CartItem[],
  deliveryAddress: string,
  total: number,
  userData?: { name: string; phone: string }
): Promise<Order> => {
  try {
    if (apiConfigured) {
      const created = await apiFetch<{ id: string; created_at?: string; total: number; status: 'pending' | 'processing' | 'delivered' }>(
        '/orders/create',
        {
          method: 'POST',
          body: {
            email: userEmail,
            address: deliveryAddress,
            total,
            items: cartItems.map((it) => ({
              recipeId: it.recipe.id,
              quantity: it.quantity,
              unitPrice: it.totalPrice,
              selectedIngredients: it.selectedIngredients,
            })),
            customer: userData ? { name: userData.name, phone: userData.phone } : { name: '', phone: '' },
          },
        }
      );

      return {
        id: created.id,
        date: created.created_at ? String(created.created_at) : new Date().toISOString(),
        total: Number(created.total),
        items: cartItems,
        status: created.status,
      };
    }
    if (!supabaseConfigured || !supabase) {
      throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
    }
    // 1. Récupérer ou créer l'utilisateur
    let user = await getUserByEmail(userEmail);
    let userId: string;

    if (!user) {
      // Si l'utilisateur n'existe pas et qu'on a les données, on le crée
      if (userData) {
        user = await upsertUser({
          email: userEmail,
          phone: userData.phone,
          name: userData.name,
        });
      } else {
        throw new Error('User data required to create new user');
      }
    }

    // Récupérer l'ID utilisateur depuis la DB
    const { data: userRow } = await supabase
      .from('users')
      .select('id')
      .eq('email', userEmail)
      .single();

    if (!userRow) throw new Error('User not found after creation');
    userId = userRow.id;

    // 2. Créer la commande
    const { data: order, error: orderError } = await supabase
      .from('orders')
      .insert({
        user_id: userId,
        total: total,
        status: 'processing',
        delivery_address: deliveryAddress,
      })
      .select()
      .single();

    if (orderError) throw orderError;

    // 3. Créer les items de commande
    const orderItems = [];
    for (const cartItem of cartItems) {
      // Créer l'order_item
      const insertPayload: any = {
        order_id: order.id,
        recipe_id: cartItem.recipe.id,
        quantity: cartItem.quantity,
        total_price: cartItem.totalPrice,
      };

      if (typeof (cartItem as any).personsCount === 'number') {
        insertPayload.persons_count = (cartItem as any).personsCount;
      }
      if (typeof (cartItem as any).recipesCount === 'number') {
        insertPayload.recipes_count = (cartItem as any).recipesCount;
      }

      let orderItem: any;
      let orderItemError: any;

      ({ data: orderItem, error: orderItemError } = await supabase
        .from('order_items')
        .insert(insertPayload)
        .select()
        .single());

      if (orderItemError) {
        const msg = String((orderItemError as any)?.message ?? orderItemError);
        if (msg.toLowerCase().includes('column') && (msg.toLowerCase().includes('persons_count') || msg.toLowerCase().includes('recipes_count'))) {
          ({ data: orderItem, error: orderItemError } = await supabase
            .from('order_items')
            .insert({
              order_id: order.id,
              recipe_id: cartItem.recipe.id,
              quantity: cartItem.quantity,
              total_price: cartItem.totalPrice,
            })
            .select()
            .single());
        }
      }

      if (orderItemError) throw orderItemError;
      orderItems.push(orderItem);

      // Créer les order_item_ingredients
      for (const selectedIng of cartItem.selectedIngredients) {
        if (selectedIng.selected) {
          const { error: ingError } = await supabase
            .from('order_item_ingredients')
            .insert({
              order_item_id: orderItem.id,
              ingredient_id: selectedIng.id,
              selected: true,
              selected_quantity: selectedIng.selectedQuantity,
            });

          if (ingError) throw ingError;
        }
      }
    }

    // 4. Retourner la commande au format Order
    return {
      id: order.id,
      date: order.created_at,
      total: Number(order.total),
      items: cartItems, // On garde les items du panier pour l'affichage immédiat
      status: order.status as 'pending' | 'delivered' | 'processing',
    };
  } catch (error) {
    console.error('Error creating order:', error);
    throw error;
  }
};

/**
 * Récupère toutes les commandes d'un utilisateur
 */
export const getOrdersByUserEmail = async (email: string): Promise<Order[]> => {
  try {
    if (apiConfigured) {
      return await apiFetch<Order[]>(`/orders/by-user?email=${encodeURIComponent(email)}`);
    }
    if (!supabaseConfigured || !supabase) {
      return [];
    }
    // Récupérer l'utilisateur
    const { data: userData } = await supabase
      .from('users')
      .select('id')
      .eq('email', email)
      .single();

    if (!userData) return [];

    // Récupérer les commandes
    const { data: orders, error: ordersError } = await supabase
      .from('orders')
      .select('*')
      .eq('user_id', userData.id)
      .order('created_at', { ascending: false });

    if (ordersError) throw ordersError;
    if (!orders) return [];

    // Pour chaque commande, récupérer les items et leurs ingrédients
    const ordersWithDetails = await Promise.all(
      orders.map(async (order: OrderRow) => {
        // Récupérer les order_items
        const { data: orderItems, error: itemsError } = await supabase
          .from('order_items')
          .select('*')
          .eq('order_id', order.id);

        if (itemsError) throw itemsError;

        // Pour chaque item, récupérer la recette et les ingrédients sélectionnés
        const cartItems = await Promise.all(
          (orderItems || []).map(async (item: OrderItemRow) => {
            // Récupérer la recette
            const recipe = await getRecipeById(item.recipe_id);
            if (!recipe) throw new Error(`Recipe ${item.recipe_id} not found`);

            // Récupérer les ingrédients sélectionnés
            const { data: selectedIngs, error: ingsError } = await supabase
              .from('order_item_ingredients')
              .select('*')
              .eq('order_item_id', item.id);

            if (ingsError) throw ingsError;

            // Mapper les ingrédients sélectionnés
            const selectedIngredients = (selectedIngs || []).map((si: OrderItemIngredientRow) => {
              // Trouver l'ingrédient complet
              const ingredient = recipe.ingredients.find((ing) => ing.id === si.ingredient_id);
              if (!ingredient) {
                throw new Error(`Ingredient ${si.ingredient_id} not found`);
              }

              return {
                ...ingredient,
                selected: si.selected,
                selectedQuantity: Number(si.selected_quantity),
              };
            });

            return {
              recipe,
              selectedIngredients,
              totalPrice: Number(item.total_price),
              quantity: item.quantity,
              personsCount: Number((item as any).persons_count ?? 0) || 0,
              recipesCount: Number((item as any).recipes_count ?? 0) || 0,
            } as CartItem;
          })
        );

        return {
          id: order.id,
          date: order.created_at,
          total: Number(order.total),
          items: cartItems,
          status: order.status as 'pending' | 'delivered' | 'processing',
        } as Order;
      })
    );

    return ordersWithDetails;
  } catch (error) {
    console.error('Error fetching orders:', error);
    throw error;
  }
};

/**
 * Met à jour le statut d'une commande
 */
export const updateOrderStatus = async (
  orderId: string,
  status: 'pending' | 'processing' | 'delivered'
): Promise<void> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      await apiFetch<boolean>('/admin/orders/status', {
        method: 'POST',
        adminEmail,
        body: { order_id: orderId, status },
      });
      return;
    }
    if (!supabaseConfigured || !supabase) {
      throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
    }
    const { error } = await supabase
      .from('orders')
      .update({ status })
      .eq('id', orderId);

    if (error) throw error;
  } catch (error) {
    console.error('Error updating order status:', error);
    throw error;
  }
};

// ============================================
// SERVICE: Carts (Paniers)
// ============================================

interface CartRow {
  id: string;
  user_id: string | null;
  user_email: string | null;
  items: any; // JSONB
  created_at: string;
  updated_at: string;
}

/**
 * Sauvegarde le panier dans Supabase
 */
export const saveCart = async (
  cartItems: CartItem[],
  userEmail?: string
): Promise<void> => {
  try {
    if (apiConfigured) {
      if (!userEmail) return;
      await apiFetch<boolean>('/cart/save', {
        method: 'POST',
        body: { email: userEmail, items: cartItems },
      });
      return;
    }
    if (!supabaseConfigured || !supabase) {
      return;
    }
    // Récupérer l'ID utilisateur si email fourni
    let userId: string | null = null;
    if (userEmail) {
      const { data: userData } = await supabase
        .from('users')
        .select('id')
        .eq('email', userEmail)
        .single();
      
      if (userData) {
        userId = userData.id;
      }
    }

    // Vérifier si un panier existe déjà
    // On cherche d'abord par user_id si disponible, sinon par email
    let existingCart = null;
    
    if (userId) {
      const { data, error } = await supabase
        .from('carts')
        .select('*')
        .eq('user_id', userId)
        .order('updated_at', { ascending: false })
        .limit(1)
        .maybeSingle();
      
      if (!error && data) {
        existingCart = data;
      }
    }
    
    // Si pas de panier par user_id, chercher par email
    if (!existingCart && userEmail) {
      const { data, error } = await supabase
        .from('carts')
        .select('*')
        .eq('user_email', userEmail)
        .order('updated_at', { ascending: false })
        .limit(1)
        .maybeSingle();
      
      if (!error && data) {
        existingCart = data;
      }
    }

    if (!userEmail && !userId) {
      // Pas d'email ni d'utilisateur, on ne peut pas sauvegarder
      return;
    }

    // Convertir les CartItems en JSON pour la sauvegarde
    const cartJson = JSON.stringify(cartItems);

    if (existingCart) {
      // Mettre à jour le panier existant
      // Si l'utilisateur a maintenant un user_id mais le panier n'en avait pas, mettre à jour
      const updateData: any = {
        items: cartJson,
        updated_at: new Date().toISOString(),
      };
      
      // Si on a maintenant un user_id mais le panier n'en avait pas, l'ajouter
      if (userId && !existingCart.user_id) {
        updateData.user_id = userId;
      }
      
      const { error } = await supabase
        .from('carts')
        .update(updateData)
        .eq('id', existingCart.id);

      if (error) throw error;

      // Nettoyer les paniers dupliqués (garder seulement le plus récent)
      if (userEmail) {
        // Supprimer les autres paniers avec le même email (sauf celui qu'on vient de mettre à jour)
        await supabase
          .from('carts')
          .delete()
          .eq('user_email', userEmail)
          .neq('id', existingCart.id);
      }
    } else {
      // Créer un nouveau panier
      // Mais d'abord, supprimer les anciens paniers avec le même email pour éviter les doublons
      if (userEmail) {
        await supabase
          .from('carts')
          .delete()
          .eq('user_email', userEmail);
      }
      
      const { error } = await supabase
        .from('carts')
        .insert({
          user_id: userId,
          user_email: userEmail || null,
          items: cartJson,
        });

      if (error) throw error;
    }
  } catch (error) {
    console.error('Error saving cart:', error);
    // Ne pas bloquer l'application si la sauvegarde échoue
    // Le panier reste dans localStorage
  }
};

/**
 * Récupère le panier depuis Supabase
 * Fonctionne avec l'email même si le compte n'existe pas encore
 */
export const getCart = async (userEmail?: string): Promise<CartItem[]> => {
  try {
    if (apiConfigured) {
      if (!userEmail) return [];
      return await apiFetch<CartItem[]>(`/cart?email=${encodeURIComponent(userEmail)}`);
    }
    if (!supabaseConfigured || !supabase) return [];
    if (!userEmail) return [];

    // Récupérer l'ID utilisateur si email fourni (peut ne pas exister encore)
    let userId: string | null = null;
    const { data: userData } = await supabase
      .from('users')
      .select('id')
      .eq('email', userEmail)
      .maybeSingle(); // Utiliser maybeSingle au lieu de single pour ne pas erreur si pas trouvé
    
    if (userData) {
      userId = userData.id;
    }

    // Récupérer le panier : d'abord par user_id si disponible, sinon par email
    let cart = null;
    
    if (userId) {
      const { data, error } = await supabase
        .from('carts')
        .select('*')
        .eq('user_id', userId)
        .order('updated_at', { ascending: false })
        .limit(1)
        .maybeSingle();
      
      if (!error && data) {
        cart = data;
      }
    }
    
    // Si pas de panier par user_id, chercher par email
    if (!cart) {
      const { data, error } = await supabase
        .from('carts')
        .select('*')
        .eq('user_email', userEmail)
        .order('updated_at', { ascending: false })
        .limit(1)
        .maybeSingle();
      
      if (!error && data) {
        cart = data;
      }
    }
    
    if (!cart || !cart.items) return [];

    // Parser le JSON et récupérer les recettes complètes
    const cartItemsJson = typeof cart.items === 'string' ? JSON.parse(cart.items) : cart.items;
    
    // Reconstruire les CartItems avec les recettes complètes
    const cartItems: CartItem[] = await Promise.all(
      cartItemsJson.map(async (item: any) => {
        // Récupérer la recette complète
        const recipe = await getRecipeById(item.recipe.id);
        if (!recipe) {
          console.warn(`Recipe ${item.recipe.id} not found, skipping cart item`);
          return null;
        }

        return {
          recipe,
          selectedIngredients: item.selectedIngredients || [],
          totalPrice: item.totalPrice || recipe.price,
          quantity: item.quantity || 1,
          personsCount: item.personsCount || 0,
          recipesCount: item.recipesCount || 0,
        } as CartItem;
      })
    );

    // Filtrer les items null (recettes supprimées)
    return cartItems.filter((item): item is CartItem => item !== null);
  } catch (error) {
    console.error('Error fetching cart:', error);
    return [];
  }
};

/**
 * Supprime le panier depuis Supabase
 */
export const deleteCart = async (userEmail?: string): Promise<void> => {
  try {
    if (apiConfigured) {
      if (!userEmail) return;
      await apiFetch<boolean>('/cart/delete', {
        method: 'POST',
        body: { email: userEmail },
      });
      return;
    }
    if (!supabaseConfigured || !supabase) return;
    if (!userEmail) return;

    // Récupérer l'ID utilisateur si email fourni
    let userId: string | null = null;
    const { data: userData } = await supabase
      .from('users')
      .select('id')
      .eq('email', userEmail)
      .single();
    
    if (userData) {
      userId = userData.id;
    }

    // Supprimer le panier
    const query = userId
      ? supabase.from('carts').delete().eq('user_id', userId)
      : supabase.from('carts').delete().eq('user_email', userEmail);

    const { error } = await query;
    if (error) throw error;
  } catch (error) {
    console.error('Error deleting cart:', error);
    // Ne pas bloquer l'application si la suppression échoue
  }
};

// ============================================
// ADMIN FUNCTIONS
// ============================================

/**
 * Vérifie si un email est un admin
 * Pour l'instant, on utilise une liste d'emails admin
 * TODO: Ajouter une colonne is_admin dans la table users
 */
/**
 * Vérifie si un email correspond à un administrateur
 * Vérifie dans la base de données le rôle de l'utilisateur
 */
export const isAdminEmail = async (email: string): Promise<boolean> => {
  try {
    if (apiConfigured) {
      if (getAdminEmailAllowlist().has(email.trim().toLowerCase())) return true;
      return await apiFetch<boolean>(`/admin/is-admin-email?email=${encodeURIComponent(email)}`);
    }
    if (!supabaseConfigured || !supabase) {
      return getAdminEmailAllowlist().has(email.trim().toLowerCase());
    }
    if (getAdminEmailAllowlist().has(email.trim().toLowerCase())) return true;
    const user = await getUserByEmail(email);
    return user?.role === 'admin';
  } catch (error) {
    console.error('Error checking admin status:', error);
    return false;
  }
};

/**
 * Vérifie si un utilisateur est admin (version synchrone avec l'objet User)
 */
export const isAdmin = (user: User | null): boolean => {
  if (!user) return false;
  if (user.role === 'admin') return true;
  return getAdminEmailAllowlist().has(user.email.trim().toLowerCase());
};

/**
 * Récupère toutes les commandes (admin)
 */
export const getAllOrders = async (): Promise<Order[]> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      const rows = await apiFetch<any[]>('/admin/orders', { adminEmail });
      return (rows || []).map(mapApiOrder);
    }
    if (!supabaseConfigured || !supabase) {
      return [];
    }
    const { data: orders, error } = await supabase
      .from('orders')
      .select(`
        *,
        users:user_id (
          email,
          name,
          phone
        )
      `)
      .order('created_at', { ascending: false });

    if (error) throw error;
    if (!orders) return [];

    // Récupérer les items pour chaque commande
    const ordersWithItems = await Promise.all(
      orders.map(async (order: any) => {
        const { data: orderItems } = await supabase
          .from('order_items')
          .select(`
            *,
            recipes:recipe_id (*)
          `)
          .eq('order_id', order.id);

        // Récupérer les ingrédients sélectionnés pour chaque item
        const itemsWithIngredients = await Promise.all(
          (orderItems || []).map(async (item: any) => {
            const { data: selectedIngredients } = await supabase
              .from('order_item_ingredients')
              .select(`
                *,
                ingredients:ingredient_id (*)
              `)
              .eq('order_item_id', item.id);

            // Reconstruire la recette
            const recipe: Recipe = {
              id: item.recipes.id,
              title: item.recipes.title,
              description: item.recipes.description,
              image: item.recipes.image,
              price: item.recipes.price,
              time: item.recipes.time,
              calories: item.recipes.calories,
              category: item.recipes.category,
              tags: item.recipes.tags || [],
              ingredients: [],
              preparation: [],
            };

            // Reconstruire les ingrédients sélectionnés
            const selectedIngs = (selectedIngredients || []).map((si: any) => ({
              ...si.ingredients,
              selected: true,
              selectedQuantity: Number(si.selected_quantity) || Number(si.quantity) || 0,
            }));

            return {
              recipe,
              selectedIngredients: selectedIngs,
              totalPrice: item.total_price,
              quantity: item.quantity,
              personsCount: Number(item.persons_count ?? 0) || 0,
              recipesCount: Number(item.recipes_count ?? 0) || 0,
            } as CartItem;
          })
        );

        return {
          id: order.id,
          date: order.created_at,
          total: order.total,
          items: itemsWithIngredients,
          status: order.status,
          user: order.users,
          deliveryAddress: order.delivery_address,
        } as Order & { user?: User; deliveryAddress?: string };
      })
    );

    return ordersWithItems as Order[];
  } catch (error) {
    console.error('Error fetching all orders:', error);
    throw error;
  }
};

/**
 * Crée une nouvelle recette (admin)
 */
export const createRecipe = async (recipe: Omit<Recipe, 'id'>): Promise<Recipe> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      const { id } = await apiFetch<{ id: string }>('/admin/recipes/create', {
        method: 'POST',
        adminEmail,
        body: {
          title: recipe.title,
          description: recipe.description,
          image: recipe.image,
          price: recipe.price,
          time: recipe.time,
          calories: recipe.calories,
          category: recipe.category,
          tags: recipe.tags,
        },
      });

      const full = await getRecipeById(id);
      if (!full) {
        throw new Error('Recipe created but not found');
      }
      return full;
    }

    if (!supabaseConfigured || !supabase) {
      throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
    }

    const { data: recipeData, error: recipeError } = await supabase
      .from('recipes')
      .insert({
        title: recipe.title,
        description: recipe.description,
        image: recipe.image,
        price: recipe.price,
        time: recipe.time,
        calories: recipe.calories,
        category: recipe.category,
        tags: recipe.tags,
      })
      .select()
      .single();

    if (recipeError) throw recipeError;
    if (!recipeData) throw new Error('Failed to create recipe');

    if (recipe.ingredients.length > 0) {
      const ingredientsData = recipe.ingredients.map((ing) => ({
        recipe_id: recipeData.id,
        name: ing.name,
        unit: ing.unit,
        quantity: ing.quantity,
        price_per_unit: ing.pricePerUnit || null,
        image: ing.image || null,
      }));

      const { error: ingredientsError } = await supabase
        .from('ingredients')
        .insert(ingredientsData);

      if (ingredientsError) throw ingredientsError;
    }

    if (recipe.preparation.length > 0) {
      const stepsData = recipe.preparation.map((step) => ({
        recipe_id: recipeData.id,
        step_number: step.stepNumber,
        description: step.description,
        duration: step.duration || null,
      }));

      const { error: stepsError } = await supabase
        .from('preparation_steps')
        .insert(stepsData);

      if (stepsError) throw stepsError;
    }

    const full = await getRecipeById(recipeData.id);
    if (!full) {
      throw new Error('Recipe created but not found');
    }
    return full;
  } catch (error) {
    console.error('Error creating recipe:', error);
    throw error;
  }
};

/**
 * Met à jour une recette (admin)
 */
export const updateRecipe = async (recipe: Recipe): Promise<Recipe> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      await apiFetch<boolean>('/admin/recipes/update', {
        method: 'POST',
        adminEmail,
        body: {
          id: recipe.id,
          title: recipe.title,
          description: recipe.description,
          image: recipe.image,
          price: recipe.price,
          time: recipe.time,
          calories: recipe.calories,
          category: recipe.category,
          tags: recipe.tags,
        },
      });

      const full = await getRecipeById(recipe.id);
      if (!full) {
        throw new Error('Recipe updated but not found');
      }
      return full;
    }

    if (!supabaseConfigured || !supabase) {
      throw new Error('Missing Supabase environment variables. Please check your .env.local file.');
    }

    const { error: recipeError } = await supabase
      .from('recipes')
      .update({
        title: recipe.title,
        description: recipe.description,
        image: recipe.image,
        price: recipe.price,
        time: recipe.time,
        calories: recipe.calories,
        category: recipe.category,
        tags: recipe.tags,
      })
      .eq('id', recipe.id);

    if (recipeError) throw recipeError;

    const { data: oldIngredients } = await supabase
      .from('ingredients')
      .select('id')
      .eq('recipe_id', recipe.id);

    let usedIngredientIds = new Set<string>();
    if (oldIngredients && oldIngredients.length > 0) {
      const { data: usedIngredients } = await supabase
        .from('order_item_ingredients')
        .select('ingredient_id')
        .in('ingredient_id', oldIngredients.map((ing) => ing.id));

      if (usedIngredients) {
        usedIngredientIds = new Set(usedIngredients.map((ui: any) => ui.ingredient_id));
      }
    }

    const ingredientsToDelete = (oldIngredients || []).filter((ing: any) => !usedIngredientIds.has(ing.id));
    if (ingredientsToDelete.length > 0) {
      const { error: deleteError } = await supabase
        .from('ingredients')
        .delete()
        .in('id', ingredientsToDelete.map((ing: any) => ing.id));

      if (deleteError) {
        console.warn('Error deleting unused ingredients:', deleteError);
      }
    }

    await supabase.from('preparation_steps').delete().eq('recipe_id', recipe.id);

    if (recipe.ingredients.length > 0) {
      const ingredientsData = recipe.ingredients.map((ing) => ({
        recipe_id: recipe.id,
        name: ing.name,
        unit: ing.unit,
        quantity: ing.quantity,
        price_per_unit: ing.pricePerUnit || null,
        image: ing.image || null,
      }));

      const { error: ingredientsError } = await supabase
        .from('ingredients')
        .insert(ingredientsData);

      if (ingredientsError) throw ingredientsError;
    }

    if (recipe.preparation.length > 0) {
      const stepsData = recipe.preparation.map((step) => ({
        recipe_id: recipe.id,
        step_number: step.stepNumber,
        description: step.description,
        duration: step.duration || null,
      }));

      const { error: stepsError } = await supabase
        .from('preparation_steps')
        .insert(stepsData);

      if (stepsError) throw stepsError;
    }

    const full = await getRecipeById(recipe.id);
    if (!full) {
      throw new Error('Recipe updated but not found');
    }
    return full;
  } catch (error) {
    console.error('Error updating recipe:', error);
    throw error;
  }
};
/**
 * Supprime une recette (admin)
 */
export const deleteRecipe = async (recipeId: string): Promise<void> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      await apiFetch<boolean>('/admin/recipes/delete', {
        method: 'POST',
        adminEmail,
        body: { id: recipeId },
      });
      return;
    }
    // Les ingrédients et étapes seront supprimés automatiquement grâce à ON DELETE CASCADE
    const { error } = await supabase
      .from('recipes')
      .delete()
      .eq('id', recipeId);

    if (error) throw error;
  } catch (error) {
    console.error('Error deleting recipe:', error);
    throw error;
  }
};

/**
 * Récupère tous les utilisateurs (admin)
 */
export const getAllUsers = async (): Promise<User[]> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      return await apiFetch<User[]>('/admin/users', { adminEmail });
    }

    const { data, error } = await supabase
      .from('users')
      .select('*');

    if (error) throw error;

    return (data || []).map((u: any) => ({
      email: u.email,
      phone: u.phone,
      name: u.name,
      role: (u.role as 'user' | 'admin') || 'user',
    }));
  } catch (error) {
    console.error('Error fetching all users:', error);
    throw error;
  }
};

/**
 * Supprime un utilisateur (admin)
 */
export const deleteUser = async (email: string): Promise<void> => {
  try {
    if (apiConfigured) {
      const adminEmail = getAdminEmailForRequest();
      await apiFetch<boolean>('/admin/users/delete', {
        method: 'POST',
        adminEmail,
        body: { email },
      });
      return;
    }
    const { error } = await supabase
      .from('users')
      .delete()
      .eq('email', email);

    if (error) throw error;
  } catch (error) {
    console.error('Error deleting user:', error);
    throw error;
  }
};

