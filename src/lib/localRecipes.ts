import type { Ingredient, PreparationStep, Recipe } from '../types';
import { RECIPES } from '../constants';
import insertAllRecipesSql from '../../supabase/insert_all_recipes.sql?raw';

const DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800';

const createRecipeImage = (seed: string, title: string): string => {
  // URL déterministe par recette (évite que toutes les recettes aient la même image)
  // Utilise Unsplash Source (redirige vers une image). Le seed garantit une variation stable.
  const safeSeed = encodeURIComponent(seed);
  const safeQuery = encodeURIComponent(title);
  return `https://source.unsplash.com/featured/800x600?food,african,recipe,${safeQuery}&sig=${safeSeed}`;
};

const unescapeSqlString = (s: string): string => s.replace(/''/g, "'");

const parsePgTextArray = (raw: string): string[] => {
  // raw example: ARRAY['Traditionnel']::text[]
  const match = raw.match(/ARRAY\[(.*)\]::text\[\]/s);
  if (!match) return [];
  const inner = match[1].trim();
  if (!inner) return [];

  // Extract all single-quoted strings (handles doubled single quotes)
  const items: string[] = [];
  const re = /'((?:[^']|'')*)'/g;
  let m: RegExpExecArray | null;
  while ((m = re.exec(inner)) !== null) {
    items.push(unescapeSqlString(m[1]));
  }
  return items;
};

export const getLocalRecipes = (): Recipe[] => {
  try {
    const sql = insertAllRecipesSql;

    const recipesById = new Map<string, Recipe>();
    const ingredientsByRecipe = new Map<string, Ingredient[]>();
    const stepsByRecipe = new Map<string, PreparationStep[]>();

    // Recipes
    const recipeRe = /INSERT INTO recipes \(id, title, description, image, price, time, calories, category, tags\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(\d+(?:\.\d+)?)\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(ARRAY\[.*?\]::text\[\])\s*\n\s*\);/gs;

    let rm: RegExpExecArray | null;
    while ((rm = recipeRe.exec(sql)) !== null) {
      const id = rm[1];
      const title = unescapeSqlString(rm[2]);
      const description = unescapeSqlString(rm[3]);
      const image = unescapeSqlString(rm[4]) || DEFAULT_IMAGE;
      const price = Number(rm[5]);
      const time = unescapeSqlString(rm[6]);
      const calories = unescapeSqlString(rm[7]);
      const category = unescapeSqlString(rm[8]);
      const tags = parsePgTextArray(rm[9]);

      recipesById.set(id, {
        id,
        title,
        description,
        image,
        price,
        time,
        calories,
        category,
        tags,
        ingredients: [],
        preparation: [],
      });
    }

    // Ingredients
    const ingRe = /INSERT INTO ingredients \(id, recipe_id, name, unit, quantity, price_per_unit\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'([^']+)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(\d+(?:\.\d+)?)\s*,\s*\n\s*(NULL|\d+(?:\.\d+)?)\s*\n\s*\);/gs;

    let im: RegExpExecArray | null;
    while ((im = ingRe.exec(sql)) !== null) {
      const id = im[1];
      const recipeId = im[2];
      const name = unescapeSqlString(im[3]);
      const unit = unescapeSqlString(im[4]);
      const quantity = Number(im[5]);
      const pricePerUnit = im[6] === 'NULL' ? undefined : Number(im[6]);

      const arr = ingredientsByRecipe.get(recipeId) ?? [];
      arr.push({ id, name, unit, quantity, pricePerUnit });
      ingredientsByRecipe.set(recipeId, arr);
    }

    // Preparation steps
    const stepRe = /INSERT INTO preparation_steps \(id, recipe_id, step_number, description, duration\) VALUES \(\s*\n\s*'([^']+)'\s*,\s*\n\s*'([^']+)'\s*,\s*\n\s*(\d+)\s*,\s*\n\s*'((?:[^']|'')*)'\s*,\s*\n\s*(NULL|'((?:[^']|'')*)')\s*\n\s*\);/gs;

    let sm: RegExpExecArray | null;
    while ((sm = stepRe.exec(sql)) !== null) {
      const recipeId = sm[2];
      const stepNumber = Number(sm[3]);
      const description = unescapeSqlString(sm[4]);
      const duration = sm[6] ? unescapeSqlString(sm[6]) : undefined;

      const arr = stepsByRecipe.get(recipeId) ?? [];
      arr.push({ stepNumber, description, duration });
      stepsByRecipe.set(recipeId, arr);
    }

    // Merge
    for (const [id, recipe] of recipesById.entries()) {
      recipe.ingredients = ingredientsByRecipe.get(id) ?? [];
      recipe.preparation = (stepsByRecipe.get(id) ?? []).sort((a, b) => a.stepNumber - b.stepNumber);

      // Si l'image est la valeur par défaut répétée, on la remplace par une image unique
      if (recipe.image === DEFAULT_IMAGE) {
        recipe.image = createRecipeImage(recipe.id, recipe.title);
      }
    }

    const all = Array.from(recipesById.values());

    // Ajouter les recettes de démo (3) pour compléter le dataset (insert_all_recipes.sql commence à la recette 4)
    const merged = new Map<string, Recipe>();
    for (const r of all) merged.set(r.id, r);
    for (const r of RECIPES) {
      if (!merged.has(r.id)) merged.set(r.id, r);
    }

    // Appliquer aussi l'image unique aux recettes de démo si elles utilisent l'image par défaut
    for (const r of merged.values()) {
      if (r.image === DEFAULT_IMAGE) {
        r.image = createRecipeImage(r.id, r.title);
      }
    }

    // If parsing fails, keep a safe fallback.
    return merged.size > 0 ? Array.from(merged.values()) : RECIPES;
  } catch {
    return RECIPES;
  }
};
