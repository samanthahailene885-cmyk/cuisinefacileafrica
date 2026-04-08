const fs = require('fs');
const crypto = require('crypto');

function generateUUID() {
  return crypto.randomUUID();
}

function cleanIngredientName(name) {
  // Nettoyer les noms d'ingrédients
  name = name.trim();
  // Enlever "d'", "de ", "d " au début
  name = name.replace(/^(d'|de\s+|d\s+)/i, '');
  // Enlever aussi à la fin si présent
  name = name.replace(/\s+(d'|de|d)$/i, '');
  return name.trim();
}

function parseIngredient(ingLine) {
  ingLine = ingLine.trim().replace(/^[•\-]\s*/, '').trim();
  
  // Gérer les ingrédients avec "ou" (prendre la première option)
  if (ingLine.includes(' ou ')) {
    const parts = ingLine.split(' ou ');
    ingLine = parts[0].trim();
  }
  
  // Patterns pour extraire quantité et unité (ordre important)
  const patterns = [
    // Format: "500 g d'agouti" -> quantité=500, unité=g, nom=agouti
    /^(\d+(?:[.,]\d+)?)\s*(g|kg|ml|cl|L|l|litre|litres)\s+(?:d'|de\s+)?(.+)$/i,
    // Format: "6 cuillère à soupe d'huile" -> quantité=6, unité=cuillère à soupe, nom=huile
    /^(\d+(?:[.,]\d+)?)\s+(cuillères?\s+à\s+soupe|cuillères?\s+à\s+café|cuillères?)\s+(?:d'|de\s+)?(.+)$/i,
    // Format: "2 oignons" -> quantité=2, unité=pièces, nom=oignons
    /^(\d+(?:[.,]\d+)?)\s+(morceaux?|pièces?|tasses?|bottes?|poignées?|brins?|feuilles?|grains?|gousses?|pots?|sachets?|briques?|verres?|portions?)\s+(?:d'|de\s+)?(.+)$/i,
    // Format: "2 oignons" (sans "d'")
    /^(\d+(?:[.,]\d+)?)\s+(.+)$/,
    // Format: "Sel, poivre" -> séparer en deux ingrédients
  ];
  
  // Gérer les ingrédients multiples séparés par des virgules
  if (ingLine.includes(',') && !ingLine.match(/\d/)) {
    // Ex: "Sel, poivre" -> retourner un tableau
    const items = ingLine.split(',').map(i => i.trim()).filter(i => i);
    if (items.length > 1) {
      return items.map(item => ({ name: item, quantity: 1, unit: 'unité' }));
    }
  }
  
  for (const pattern of patterns) {
    const match = ingLine.match(pattern);
    if (match) {
      if (match.length === 4) {
        const quantity = parseFloat(match[1].replace(',', '.'));
        let unit = match[2].toLowerCase();
        let name = match[3].trim();
        
        // Nettoyer le nom (enlever "d'", "de", "d'", etc.)
        name = name.replace(/^(d'|de\s+|d\s+)/i, '').trim();
        // Enlever aussi à la fin si présent
        name = name.replace(/\s+(d'|de|d)$/i, '').trim();
        
        // Normaliser les unités
        if (unit.includes('cuillère')) {
          unit = 'cuillère à soupe';
        }
        
        return { name, quantity, unit };
      } else if (match.length === 3) {
        const quantity = parseFloat(match[1].replace(',', '.'));
        let name = match[2].trim();
        
        // Nettoyer le nom (enlever "d'", "de", "d'", etc.)
        name = name.replace(/^(d'|de\s+|d\s+)/i, '').trim();
        // Enlever aussi à la fin si présent
        name = name.replace(/\s+(d'|de|d)$/i, '').trim();
        
        // Deviner l'unité
        let unit = 'pièce';
        if (quantity !== 1) unit = 'pièces';
        if (name.includes('gousse')) unit = 'gousses';
        if (name.includes('grain')) unit = 'grains';
        
        return { name, quantity, unit };
      }
    }
  }
  
  // Si aucun pattern ne correspond, retourner tel quel
  const cleanName = cleanIngredientName(ingLine);
  return { name: cleanName, quantity: 1, unit: 'unité' };
}

function parsePreparationSteps(prepText) {
  const steps = [];
  prepText = prepText.trim();
  
  // Chercher les numéros d'étapes (1., 2., etc.)
  const stepPattern = /(\d+)\.\s*(.+?)(?=\d+\.|$)/gs;
  const matches = [...prepText.matchAll(stepPattern)];
  
  if (matches.length > 0) {
    matches.forEach(match => {
      const stepNum = parseInt(match[1]);
      let desc = match[2].trim().replace(/\s+/g, ' ');
      if (desc.length > 10) {
        steps.push({ stepNumber: stepNum, description: desc });
      }
    });
  } else {
    // Si pas de numérotation, séparer par phrases
    const sentences = prepText.split(/[.!?]\s+/).filter(s => s.trim().length > 10);
    sentences.forEach((sentence, index) => {
      const clean = sentence.trim().replace(/\s+/g, ' ');
      if (clean) {
        steps.push({ stepNumber: index + 1, description: clean });
      }
    });
  }
  
  // Si aucune étape trouvée, mettre tout le texte comme une seule étape
  if (steps.length === 0) {
    const clean = prepText.replace(/\s+/g, ' ').trim();
    if (clean) {
      steps.push({ stepNumber: 1, description: clean });
    }
  }
  
  return steps;
}

function escapeSqlString(s) {
  return `'${s.replace(/'/g, "''")}'`;
}

function parseRecipesFile(filename) {
  const content = fs.readFileSync(filename, 'utf-8');
  const recipes = [];
  
  // Séparer par "RECETTE"
  const recipeBlocks = content.split(/(?=RECETTE\s+\d+\s*:)/);
  
  for (const block of recipeBlocks) {
    if (!block.trim() || !block.includes('RECETTE')) continue;
    
    const match = block.match(/RECETTE\s+(\d+)\s*:\s*(.+?)(?=Ingrédients|$)/s);
    if (!match) continue;
    
    const recipeNum = match[1];
    const title = match[2].trim().split('\n')[0].trim();
    
    // Extraire les ingrédients
    const ingredientsMatch = block.match(/Ingrédients\s*:\s*\n((?:[^\n]*\n)*?)(?=Mode\s+de\s+préparation|$)/i);
    const ingredients = [];
    if (ingredientsMatch) {
      const ingLines = ingredientsMatch[1].split('\n')
        .filter(line => {
          const trimmed = line.trim();
          // Filtrer : doit contenir • ou - ET ne pas être trop long (probablement une description)
          return trimmed && 
                 (trimmed.includes('•') || trimmed.includes('-')) &&
                 trimmed.length < 200; // Limiter la longueur pour éviter les descriptions
        });
      ingLines.forEach(line => {
        const ing = parseIngredient(line);
        // Si parseIngredient retourne un tableau (ingrédients multiples)
        if (Array.isArray(ing)) {
          ingredients.push(...ing);
        } else if (ing && ing.name) {
          // Tronquer le nom à 255 caractères max
          if (ing.name.length > 255) {
            ing.name = ing.name.substring(0, 252) + '...';
          }
          ingredients.push(ing);
        }
      });
    }
    
    // Extraire la préparation
    const prepMatch = block.match(/Mode\s+de\s+préparation\s*:\s*\n((?:[^\n]*\n)*?)(?=RECETTE|$)/is);
    let preparationSteps = [];
    if (prepMatch) {
      preparationSteps = parsePreparationSteps(prepMatch[1]);
    }
    
    if (title && (ingredients.length > 0 || preparationSteps.length > 0)) {
      recipes.push({
        number: recipeNum,
        title,
        ingredients,
        preparationSteps
      });
    }
  }
  
  return recipes;
}

// Fonction pour déterminer la catégorie d'une recette
function determineCategory(recipe) {
  const title = recipe.title.toLowerCase();
  const number = parseInt(recipe.number);
  
  // Fruits de mer
  if (title.includes('crevette') || title.includes('gamba') || title.includes('langouste') || 
      title.includes('crab') || title.includes('moule') || title.includes('écrevisse') ||
      title.includes('crustacé') || title.includes('poisson') || number >= 27 && number <= 45) {
    return { name: 'Fruits de Mer', id: null };
  }
  
  // Desserts
  if (title.includes('gâteau') || title.includes('gateau') || title.includes('crème brûlée') ||
      title.includes('creme brulee') || title.includes('tartelette') || number === 20 || number === 46) {
    return { name: 'Dessert', id: null };
  }
  
  // Cocktails
  if (title.includes('cocktail') || title.includes('marquise') || number === 19 || number === 47) {
    return { name: 'Cocktail', id: null };
  }
  
  // Sauces
  if (title.includes('sauce') || title.includes('dah') || title.includes('graine') ||
      title.includes('gombo') || title.includes('pistache') || title.includes('tomate') ||
      title.includes('arachide') || title.includes('tchonron') || 
      (number >= 51 && number <= 62)) {
    return { name: 'Sauce', id: null };
  }
  
  // Santé & Bien-être
  if (title.includes('salade') || title.includes('smoothie') || title.includes('houmous') ||
      title.includes('pudding') || title.includes('tisane') || number === 21 || number === 22 ||
      number === 23 || (number >= 63 && number <= 66)) {
    return { name: 'Santé & Bien-être', id: null };
  }
  
  // Boissons
  if (title.includes('jus') || title.includes('infusion') || title.includes('milkshake') ||
      title.includes('chocolat chaud') || (number >= 67 && number <= 75)) {
    return { name: 'Boisson', id: null };
  }
  
  // Accompagnements
  if (title.includes('riz') || title.includes('tchep') || title.includes('bouillie')) {
    return { name: 'Accompagnement', id: null };
  }
  
  // Par défaut: Traditionnel
  return { name: 'Traditionnel', id: null };
}

function generateSql(recipes) {
  const sqlLines = [
    '-- ============================================',
    '-- INSERTION DES RECETTES',
    '-- ============================================',
    `-- Ce script a été généré automatiquement`,
    `-- Nombre de recettes: ${recipes.length}`,
    '',
    '-- Récupération des IDs de catégories',
    'DO $$',
    'DECLARE',
    '  cat_traditionnel_id UUID;',
    '  cat_fruits_mer_id UUID;',
    '  cat_dessert_id UUID;',
    '  cat_cocktail_id UUID;',
    '  cat_sauce_id UUID;',
    '  cat_sante_id UUID;',
    '  cat_boisson_id UUID;',
    '  cat_accompagnement_id UUID;',
    'BEGIN',
    `  SELECT id INTO cat_traditionnel_id FROM categories WHERE name = 'Traditionnel';`,
    `  SELECT id INTO cat_fruits_mer_id FROM categories WHERE name = 'Fruits de Mer';`,
    `  SELECT id INTO cat_dessert_id FROM categories WHERE name = 'Dessert';`,
    `  SELECT id INTO cat_cocktail_id FROM categories WHERE name = 'Cocktail';`,
    `  SELECT id INTO cat_sauce_id FROM categories WHERE name = 'Sauce';`,
    `  SELECT id INTO cat_sante_id FROM categories WHERE name = 'Santé & Bien-être';`,
    `  SELECT id INTO cat_boisson_id FROM categories WHERE name = 'Boisson';`,
    `  SELECT id INTO cat_accompagnement_id FROM categories WHERE name = 'Accompagnement';`,
    '',
  ];
  
  recipes.forEach(recipe => {
    const recipeId = generateUUID();
    const category = determineCategory(recipe);
    
    // Valeurs par défaut
    const description = `Recette ${category.name.toLowerCase()} : ${recipe.title}`;
    const image = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800';
    const price = 3500;
    const time = '45 min';
    const calories = '450 kcal';
    const tags = [category.name];
    
    // Insert de la recette
    sqlLines.push(`-- RECETTE ${recipe.number}: ${recipe.title}`);
    
    // S'assurer que le titre ne dépasse pas 255 caractères
    let recipeTitle = recipe.title;
    if (recipeTitle.length > 255) {
      recipeTitle = recipeTitle.substring(0, 252) + '...';
    }
    
    // Déterminer l'ID de catégorie selon le nom
    let categoryIdVar = 'cat_traditionnel_id';
    if (category.name === 'Fruits de Mer') categoryIdVar = 'cat_fruits_mer_id';
    else if (category.name === 'Dessert') categoryIdVar = 'cat_dessert_id';
    else if (category.name === 'Cocktail') categoryIdVar = 'cat_cocktail_id';
    else if (category.name === 'Sauce') categoryIdVar = 'cat_sauce_id';
    else if (category.name === 'Santé & Bien-être') categoryIdVar = 'cat_sante_id';
    else if (category.name === 'Boisson') categoryIdVar = 'cat_boisson_id';
    else if (category.name === 'Accompagnement') categoryIdVar = 'cat_accompagnement_id';
    
    sqlLines.push(`INSERT INTO recipes (id, title, description, image, price, time, calories, category, category_id, tags) VALUES (`);
    sqlLines.push(`  '${recipeId}',`);
    sqlLines.push(`  ${escapeSqlString(recipeTitle)},`);
    sqlLines.push(`  ${escapeSqlString(description)},`);
    sqlLines.push(`  ${escapeSqlString(image)},`);
    sqlLines.push(`  ${price},`);
    sqlLines.push(`  ${escapeSqlString(time)},`);
    sqlLines.push(`  ${escapeSqlString(calories)},`);
    sqlLines.push(`  ${escapeSqlString(category.name)},`);
    sqlLines.push(`  ${categoryIdVar},`);
    // Convertir le tableau en format PostgreSQL avec guillemets simples
    const tagsSql = tags.map(tag => `'${tag.replace(/'/g, "''")}'`).join(', ');
    sqlLines.push(`  ARRAY[${tagsSql}]::text[]`);
    sqlLines.push(');');
    sqlLines.push('');
    
      // Insert des ingrédients
      if (recipe.ingredients.length > 0) {
        sqlLines.push('-- Ingrédients');
        recipe.ingredients.forEach(ing => {
          // S'assurer que le nom ne dépasse pas 255 caractères
          let ingName = ing.name;
          if (ingName.length > 255) {
            ingName = ingName.substring(0, 252) + '...';
          }
          
          const ingId = generateUUID();
          sqlLines.push(`INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (`);
          sqlLines.push(`  '${ingId}',`);
          sqlLines.push(`  '${recipeId}',`);
          sqlLines.push(`  ${escapeSqlString(ingName)},`);
          sqlLines.push(`  ${escapeSqlString(ing.unit)},`);
          sqlLines.push(`  ${ing.quantity},`);
          sqlLines.push(`  NULL`);
          sqlLines.push(');');
        });
        sqlLines.push('');
      }
    
    // Insert des étapes de préparation
    if (recipe.preparationSteps.length > 0) {
      sqlLines.push('-- Étapes de préparation');
      recipe.preparationSteps.forEach(step => {
        const stepId = generateUUID();
        sqlLines.push(`INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (`);
        sqlLines.push(`  '${stepId}',`);
        sqlLines.push(`  '${recipeId}',`);
        sqlLines.push(`  ${step.stepNumber},`);
        sqlLines.push(`  ${escapeSqlString(step.description)},`);
        sqlLines.push(`  NULL`);
        sqlLines.push(');');
      });
      sqlLines.push('');
    }
    
    sqlLines.push('');
  });
  
  sqlLines.push('END $$;');
  
  return sqlLines.join('\n');
}

// Exécution
try {
  const recipes = parseRecipesFile('RECETTES ET MODE DE CUISSON.txt');
  const sql = generateSql(recipes);
  
  fs.writeFileSync('supabase/insert_all_recipes.sql', sql, 'utf-8');
  
  console.log(`✅ ${recipes.length} recettes parsées avec succès!`);
  console.log('📄 Script SQL généré: supabase/insert_all_recipes.sql');
} catch (error) {
  console.error('❌ Erreur:', error.message);
  console.error(error.stack);
  process.exit(1);
}

