#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script pour parser le fichier de recettes et générer un script SQL
"""

import re
import uuid

def parse_ingredient(ing_line):
    """Parse une ligne d'ingrédient pour extraire nom, quantité et unité"""
    ing_line = ing_line.strip().replace('•', '').strip()
    
    # Patterns pour extraire quantité et unité
    patterns = [
        (r'(\d+(?:[.,]\d+)?)\s*(g|kg|ml|cl|L|l|litre|litres)\s+(.+)', 'quantity_unit_name'),
        (r'(\d+(?:[.,]\d+)?)\s+(morceaux?|pièces?|tasses?|cuillères?|bottes?|poignées?|brins?|feuilles?|grains?|gousses?|pots?|sachets?|briques?|verres?|portions?)\s+(.+)', 'quantity_unit_name'),
        (r'(\d+(?:[.,]\d+)?)\s+(.+)', 'quantity_name'),
        (r'(\d+)\s*(.+)', 'quantity_name'),
        (r'(.+)', 'name_only'),
    ]
    
    for pattern, pattern_type in patterns:
        match = re.match(pattern, ing_line, re.IGNORECASE)
        if match:
            if pattern_type == 'quantity_unit_name':
                quantity = float(match.group(1).replace(',', '.'))
                unit = match.group(2).lower()
                name = match.group(3).strip()
                return name, quantity, unit
            elif pattern_type == 'quantity_name':
                quantity = float(match.group(1).replace(',', '.'))
                name = match.group(2).strip()
                # Essayer de deviner l'unité
                unit = 'pièce' if quantity == 1 else 'pièces'
                return name, quantity, unit
            else:
                name = match.group(1).strip()
                return name, 1, 'unité'
    
    return ing_line, 1, 'unité'

def parse_preparation_steps(prep_text):
    """Parse le texte de préparation pour extraire les étapes"""
    steps = []
    
    # Nettoyer le texte
    prep_text = prep_text.strip()
    
    # Séparer par points ou numéros
    # Chercher les numéros d'étapes (1., 2., etc.)
    step_pattern = r'(\d+)\.\s*(.+?)(?=\d+\.|$)'
    matches = re.findall(step_pattern, prep_text, re.DOTALL)
    
    if matches:
        for num, desc in matches:
            desc = desc.strip().replace('\n', ' ').replace('\t', ' ')
            desc = re.sub(r'\s+', ' ', desc)
            if desc:
                steps.append((int(num), desc))
    else:
        # Si pas de numérotation, séparer par phrases
        sentences = re.split(r'[.!?]\s+', prep_text)
        for i, sentence in enumerate(sentences, 1):
            sentence = sentence.strip().replace('\n', ' ').replace('\t', ' ')
            sentence = re.sub(r'\s+', ' ', sentence)
            if sentence and len(sentence) > 10:  # Ignorer les phrases trop courtes
                steps.append((i, sentence))
    
    # Si aucune étape trouvée, mettre tout le texte comme une seule étape
    if not steps:
        clean_text = prep_text.replace('\n', ' ').replace('\t', ' ')
        clean_text = re.sub(r'\s+', ' ', clean_text)
        if clean_text:
            steps.append((1, clean_text))
    
    return steps

def parse_recipes_file(filename):
    """Parse le fichier de recettes"""
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()
    
    recipes = []
    
    # Séparer par "RECETTE"
    recipe_blocks = re.split(r'RECETTE\s+(\d+)\s*:\s*', content)
    
    # Le premier élément est le header, on l'ignore
    for i in range(1, len(recipe_blocks), 2):
        if i + 1 >= len(recipe_blocks):
            break
            
        recipe_num = recipe_blocks[i]
        recipe_content = recipe_blocks[i + 1]
        
        # Extraire le titre (première ligne)
        lines = recipe_content.split('\n')
        title = lines[0].strip()
        
        # Trouver la section Ingrédients
        ingredients_section = None
        preparation_section = None
        
        in_ingredients = False
        in_preparation = False
        ingredients_lines = []
        preparation_lines = []
        
        for line in lines[1:]:
            if re.match(r'^Ingrédients\s*:', line, re.IGNORECASE):
                in_ingredients = True
                in_preparation = False
                continue
            elif re.match(r'^Mode\s+de\s+préparation\s*:', line, re.IGNORECASE):
                in_ingredients = False
                in_preparation = True
                continue
            elif line.strip() and not line.strip().startswith('•'):
                # Si on rencontre une ligne non vide qui n'est pas un ingrédient, on peut être dans la préparation
                if in_ingredients and line.strip():
                    # Peut-être qu'on est passé à la préparation sans le header
                    if 'préparation' in line.lower() or 'mode' in line.lower():
                        in_ingredients = False
                        in_preparation = True
                        continue
            
            if in_ingredients and line.strip():
                if line.strip().startswith('•') or line.strip().startswith('-'):
                    ingredients_lines.append(line)
            elif in_preparation:
                preparation_lines.append(line)
        
        # Parser les ingrédients
        ingredients = []
        for ing_line in ingredients_lines:
            if ing_line.strip():
                name, quantity, unit = parse_ingredient(ing_line)
                ingredients.append({
                    'name': name,
                    'quantity': quantity,
                    'unit': unit
                })
        
        # Parser les étapes de préparation
        prep_text = '\n'.join(preparation_lines)
        steps = parse_preparation_steps(prep_text)
        
        recipes.append({
            'number': recipe_num,
            'title': title,
            'ingredients': ingredients,
            'preparation_steps': steps
        })
    
    return recipes

def generate_sql(recipes):
    """Génère le script SQL pour insérer les recettes"""
    sql_lines = [
        "-- ============================================",
        "-- INSERTION DES RECETTES",
        "-- ============================================",
        "-- Ce script a été généré automatiquement",
        "-- Nombre de recettes: " + str(len(recipes)),
        "",
    ]
    
    for recipe in recipes:
        recipe_id = str(uuid.uuid4())
        
        # Valeurs par défaut pour la recette
        description = f"Recette traditionnelle : {recipe['title']}"
        image = "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800"
        price = 3500  # Prix par défaut
        time = "45 min"  # Temps par défaut
        calories = "450 kcal"  # Calories par défaut
        category = "Traditionnel"  # Catégorie par défaut
        tags = ["Traditionnel"]
        
        # Insert de la recette
        sql_lines.append(f"-- RECETTE {recipe['number']}: {recipe['title']}")
        sql_lines.append(f"INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (")
        sql_lines.append(f"  '{recipe_id}',")
        sql_lines.append(f"  {escape_sql_string(recipe['title'])}, ")
        sql_lines.append(f"  {escape_sql_string(description)}, ")
        sql_lines.append(f"  {escape_sql_string(image)}, ")
        sql_lines.append(f"  {price}, ")
        sql_lines.append(f"  {escape_sql_string(time)}, ")
        sql_lines.append(f"  {escape_sql_string(calories)}, ")
        sql_lines.append(f"  {escape_sql_string(category)}, ")
        sql_lines.append(f"  ARRAY{tags}::text[]")
        sql_lines.append(");")
        sql_lines.append("")
        
        # Insert des ingrédients
        if recipe['ingredients']:
            sql_lines.append("-- Ingrédients")
            for ing in recipe['ingredients']:
                ing_id = str(uuid.uuid4())
                sql_lines.append(f"INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (")
                sql_lines.append(f"  '{ing_id}',")
                sql_lines.append(f"  '{recipe_id}',")
                sql_lines.append(f"  {escape_sql_string(ing['name'])}, ")
                sql_lines.append(f"  {escape_sql_string(ing['unit'])}, ")
                sql_lines.append(f"  {ing['quantity']}, ")
                sql_lines.append(f"  NULL")
                sql_lines.append(");")
            sql_lines.append("")
        
        # Insert des étapes de préparation
        if recipe['preparation_steps']:
            sql_lines.append("-- Étapes de préparation")
            for step_num, step_desc in recipe['preparation_steps']:
                step_id = str(uuid.uuid4())
                sql_lines.append(f"INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (")
                sql_lines.append(f"  '{step_id}',")
                sql_lines.append(f"  '{recipe_id}',")
                sql_lines.append(f"  {step_num}, ")
                sql_lines.append(f"  {escape_sql_string(step_desc)}, ")
                sql_lines.append(f"  NULL")
                sql_lines.append(");")
            sql_lines.append("")
        
        sql_lines.append("")
    
    return '\n'.join(sql_lines)

def escape_sql_string(s):
    """Échappe les chaînes SQL"""
    s = s.replace("'", "''")
    return f"'{s}'"

if __name__ == '__main__':
    recipes = parse_recipes_file('RECETTES ET MODE DE CUISSON.txt')
    sql = generate_sql(recipes)
    
    with open('supabase/insert_all_recipes.sql', 'w', encoding='utf-8') as f:
        f.write(sql)
    
    print(f"✅ {len(recipes)} recettes parsées avec succès!")
    print(f"📄 Script SQL généré: supabase/insert_all_recipes.sql")

