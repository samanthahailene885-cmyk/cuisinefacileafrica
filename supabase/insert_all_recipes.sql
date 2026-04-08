-- ============================================
-- INSERTION DES RECETTES
-- ============================================
-- Ce script a été généré automatiquement
-- Nombre de recettes: 69

-- RECETTE 4: CHIPS DE PATATES DOUCES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  'CHIPS DE PATATES DOUCES',
  'Recette traditionnelle : CHIPS DE PATATES DOUCES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '64073c30-2e6b-4684-8c91-9f2a69a37841',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  'patates douces',
  'g',
  400,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '66f43d27-d7d9-446a-8f52-a7c1e8657b87',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  '½ L d’huile Dinor pour la friture',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dac6e081-359f-4389-8267-798f897f5495',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3ac87d36-5fe4-4efa-a2d4-df583aa41354',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  1,
  'Epluchez et coupez les patates en rondelles très fines',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6b7a1fe0-0fc0-453b-95b2-6dfddb38cfc9',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  2,
  'Rincez et séchez-les',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6c1d3f7b-17d4-4567-aef3-3b234130c9db',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  3,
  'Chauffez l’huile de friture et faites-y frire les rondelles de patates douces',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd5476075-84e6-4871-b1d7-a9e47a7d4085',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  4,
  'Retirez-les de l’huile lorsqu’elles remontent à la surface',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'aa9354fe-aaee-4fe5-9919-142a9fd09b13',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  5,
  'Egouttez-les sur du papier absorbant',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '364ab332-e542-4b37-96bd-f1a74504c0df',
  'a53d5eb8-a20e-40b3-b62c-35c48e6720f2',
  6,
  'Salez et servez aussitôt.',
  NULL
);


-- RECETTE 5: AGOUTI PIQUE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'AGOUTI PIQUE',
  'Recette traditionnelle : AGOUTI PIQUE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ecba88b1-9a0a-4ae1-ae28-eb3e8ac3bed8',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'agouti entier',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fdcb3741-dbb0-4112-bb89-da10a13fd0d1',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'piments secs',
  'pièces',
  10,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '76ce4618-ee95-4c40-921a-62ae80c3a1fb',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'oignons hachés',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8d8f2bb0-0443-44a4-9eb9-6e002d6006f4',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'gingembre haché',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b922a680-3b02-4a75-9267-00a7f899ef60',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'd’huile',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3c26a874-299c-495b-bc09-3dfa87cb5fd6',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'Des piques à brochettes en bambou',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '42b3de74-be69-4841-8fc6-327d8ab04176',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ca1c8e38-e1c7-4f59-bfab-59459c0eca9b',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e39eb78d-ad69-4879-9c11-e990d2a0b209',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  1,
  'Lavez l’agouti soigneusement et faites-le sécher',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7a9587e6-bf61-48ab-a7d4-f0a76d1d26ed',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  2,
  'Coupez-le en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ea3355d1-f581-44b9-b970-b9135e84a7af',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  3,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '84a00d59-c25f-45d3-8ac4-e4457d93ad6d',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  4,
  'Ecrasez le piment sec et mélangez-le aux oignons hachés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '48a18ea4-309b-4bd2-a234-a9f72e886da3',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  5,
  'Ajoutez le gingembre et l’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3e8feafd-3d25-48c8-8494-e80b42308aa4',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  6,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dee015f2-0636-4024-aa14-ba896c5aa84e',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  7,
  'Mélangez le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9eaa9586-d7bc-404d-a056-61f2da2ad416',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  8,
  'Farcissez les morceaux avec la marinade et embrochez-les avec des piques en bambou séché',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6af6a468-0b7a-4d85-b2b6-188fbdd3bafa',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  9,
  'Faites cuire l’agouti au feu de bois à la flamme pendant 2 h à 3 h',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f2b8020d-6daf-414b-8339-43e1b57ebf41',
  '498aabb7-ae44-418f-b9a1-e885a08e0859',
  10,
  'Servez l’agouti avec une sauce pimentée et de l’attiéké ou de l’igname vapeur.',
  NULL
);


-- RECETTE 6: KEDJENOU D’AGOUTI
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'KEDJENOU D’AGOUTI',
  'Recette traditionnelle : KEDJENOU D’AGOUTI',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e919f6d0-86dc-4491-96e6-9489089d6274',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'd’agouti frais',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a65ceef1-f8ba-4b1b-89e3-40973f2659e6',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '64969a76-657e-4de4-9a16-eb1b847d6664',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'tomates fraîches',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '12cb5b0d-09b2-4676-ad75-c421ac140383',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '10780a5a-f268-486b-a600-1fe82abdcb1b',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'piments frais',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '10720c3d-3951-4a5b-9426-af45cd360727',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  '½ L de vin de palme',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '32b21d86-1fcc-4543-818f-cb9baecbb73c',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd1fdb400-6065-417e-a15e-c481542555c2',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  1,
  'Lavez tous les légumes et écrasez-les dans un talié',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9cf18b6f-88ca-4677-a078-b1d9cad64359',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  2,
  'Nettoyez soigneusement les morceaux d’agouti',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fe156f31-3be5-4b4d-a2e0-5957d502041b',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  3,
  'Disposez la viande dans une casserole et ajoutez la purée de légumes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b425125b-2572-46d8-b4cc-ece58734dff3',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  4,
  'Salez généreusement et ajoutez le vin de palme',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7f9e5dee-ca15-40b9-9ccf-70239b56753d',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  5,
  'Couvrez et laissez cuire, à petit feu, pendant 40 min, en remuant chaque 15 min, sans ouvrir la casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9de77175-bdd3-48e5-a696-a46fd58025c3',
  'ce9978e8-8522-4721-821f-1ef2da4eaa91',
  6,
  'Une fois cuit, servez votre kedjenou avec de l’attiéké ou du riz.',
  NULL
);


-- RECETTE 7: MANKOU FLOLO (sauce piments doux) la biche
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'MANKOU FLOLO (sauce piments doux) la biche',
  'Recette traditionnelle : MANKOU FLOLO (sauce piments doux) la biche',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7decdb39-a3dc-408f-9082-dc203f24b598',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'biche fumée',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8848d761-5354-45b3-b745-1b3435d898ce',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'poisson faisandé (adjovan)',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd3469cb9-746d-4b51-80da-a93cf0763ce7',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'piments doux',
  'poignées',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'be55c728-5ed5-46ef-a51d-e3e3bae9dba5',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'oignons africains',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e425a5bf-df71-4b5d-b1e0-627c02308aef',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'tomates paysannes',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2aae2144-58ca-409d-a8b4-f0bc5b0a4ec1',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a03f24ab-38d3-4b69-82b9-330c4d026c17',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eaca295b-2829-4e9f-b60c-1c13d9028666',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  1,
  'Nettoyez et lavez les piments doux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '25015131-8231-493e-9891-e4f51a59200f',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  2,
  'Lavez les oignons épluchés et faites de même avec la tomate et le piment frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7bd23c6e-c5d2-492e-ad06-365dae3a36c7',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  3,
  'Lavez soigneusement les morceaux de gibier et l’adjovan (poisson faisandé)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '53e439b5-6f9c-401f-8f3e-0b7df4dc0dc5',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  4,
  'Mettez tout dans une casserole, ajoutez 1 L d’eau puis portez à ébullition pendant 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fbe4ef97-08ff-4a1c-b078-0ef3cef2b683',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  5,
  'Retirez les légumes puis écrasez-les dans un trépied ou un talié',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '16e7fc86-ebfb-48a5-8556-590b5427e5af',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  6,
  'Rajoutez la pâte à la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2894b71a-e985-4e22-b2e4-08d1c56c8323',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  7,
  'Laissez cuire pendant 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5445dddc-4092-4131-811b-30df8ae414d4',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  8,
  'Rectifiez l’assaisonnement et laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '407a14c8-7cf1-4474-bf2e-fff526df1c8c',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  9,
  'Servez avec le foutou d’igname',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd31794d9-2f57-40d2-be00-1faa5af7ef08',
  'a2d6f304-7dbe-4d15-838f-05b8136a6ebd',
  10,
  'Suggestion : vous pouvez faire cuire les piments doux séparément et les ajouter au jus de cuisson de la sauce après les avoir réduits en purée.',
  NULL
);


-- RECETTE 8: GOUAGOUASSOU (mélange gnangnan et gombos frais)
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'GOUAGOUASSOU (mélange gnangnan et gombos frais)',
  'Recette traditionnelle : GOUAGOUASSOU (mélange gnangnan et gombos frais)',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f3b31399-6dd3-479c-aac0-e77d18f6d7cb',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'biche fumée',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '455b0273-b160-480d-9d7a-5b1c4d761e4d',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'gombos frais',
  'pièces',
  20,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b1443163-4fc3-4ec6-a502-a29c41116537',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'gnangnan (petites aubergines amères)',
  'poignées',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b442d93b-595c-4da8-a62c-0a9ad91cd58d',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'tomates paysannes',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f44efa32-420f-45a2-a37e-1a1d170bc169',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'oignons africains',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '543b528f-cc82-45bc-94a8-cc461eef2d24',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'poisson faisandé (adjovan)',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '00b02623-58e3-4269-bdba-beb2f9240418',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'poudre de poisson',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f8d6ea69-ebf9-4e56-bc2d-6b0cb7f1947b',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd9349ea7-2115-43af-81b2-80af65225a8d',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6ce53422-105b-4396-a478-79d32ec8c7a8',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  1,
  'Détachez les petites aubergines des grappes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd85ae1c8-af5c-4db8-a7bb-97305d07f917',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  2,
  'Coupez les extrémités des gombos',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e6231506-8d28-470a-a99a-e08203937cd5',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  3,
  'Nettoyez et coupez les oignons en gros dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6d862802-3600-4679-b20b-9f25156f70d4',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  4,
  'Lavez les tomates',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e96a2369-916d-42e3-928e-f14f19848658',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  5,
  'A l’aide des doigts, malaxez les tomates pour obtenir une purée grossière',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e14ad573-4989-4444-9531-049926cfb64b',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  6,
  'Dans la casserole, mettez la viande, les oignons coupés en gros dés, la purée de tomates délayée dans une petite quantité d’eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '82a68f43-1170-4430-8fe8-1628b1b6d1a6',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  7,
  'Salez et laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '93df59bb-8eee-4dbb-a54f-149b05d969e3',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  8,
  'Versez 1 L d’eau dans la préparation et ajoutez les gombos frais, le gnangnan et le morceau de poisson faisandé',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '398ef383-fa94-44bf-958b-502d36cebf49',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  9,
  'Laissez cuire, 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2d6d8145-48d0-44be-a89d-ec5b7930d587',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  10,
  'Retirez les légumes de la préparation et écrasez-les séparément',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7ebdc44a-ade4-4c7f-977d-83c5c1a0ba93',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  11,
  'Rajoutez les légumes écrasés à la sauce et rectifiez l’assaisonnement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a357e19c-05dd-412e-b108-7cb9848050ca',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  12,
  'Laissez mijoter, 25 min, puis servez avec du foutou de banane',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3169425a-71a8-4995-bd67-5fdf532340be',
  '58fa56e3-5c13-43a4-9875-edefb1f56152',
  13,
  'Suggestion : vous pouvez faire cuire séparément les petites aubergines et le gnangnan et les écraser également séparément avant de les ajouter à la sauce.',
  NULL
);


-- RECETTE 9: RIZ DINOR A LA SAUCE CURRY AU POULET
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'RIZ DINOR A LA SAUCE CURRY AU POULET',
  'Recette traditionnelle : RIZ DINOR A LA SAUCE CURRY AU POULET',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8d7e1efc-0fbd-450d-af02-8b1e30cf16ff',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'riez dinor',
  'g',
  400,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ff7acde9-a37c-461a-b406-77d0b32c5393',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'filets de poulet',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '905e1961-8925-4a72-8c5e-eab72acc16c9',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a67d4163-7b68-45a8-bc82-d07a289f0306',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  '½ tasse de bouillon de volaille',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '20b4165e-e1ad-430d-a583-dbd7a8012b7c',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'crème liquide épaisse',
  'brique',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b05d2a75-47bb-4aa3-a202-2ae16790aa09',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'à 3 cuillère à soupe de curry',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '27eee2f7-5af0-414a-a79b-a06abfe0f0b5',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'd’huile',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ef2047e6-f308-481d-bdcd-9339dad898f8',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  '½ bouquet de persil',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2fba9c2a-0322-4a4d-b6ca-5e36610e8e9e',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '94bd3f09-891f-495f-99dd-3234d632b3b2',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  'poivre du moulin',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '942a3573-f31f-4761-abb7-a2bae3e52beb',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  1,
  'Faites cuire le riz comme vous avez l’habitude de le faire',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5e64d99f-7b74-48dc-8b92-430d99de4325',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  2,
  'Une fois cuit, égouttez-le et gardez-le au chaud',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b0a79c9d-13a9-4e03-814d-164f12605e7a',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  3,
  'Epluchez l’oignon et émincez-le',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '11b08a67-940e-4a01-a535-4645cd733874',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  4,
  'Coupez les filets de poulet en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1bc1ce21-ceb7-4e5b-9774-302f240f61ba',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  5,
  'Dans une poêle, faites chauffer l’huile et jetez-y les oignons émincés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '97c43e30-38e0-49e2-87ab-76cd19f7e7d2',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  6,
  'Lorsqu’ils sont bien dorés, ajoutez les morceaux de poulet',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9f054c1a-a5a2-4195-b6a2-981a1ba37c61',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  7,
  'Faites revenir le tout quelques minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1ea1b987-d7a1-4594-82ba-266910adb3a9',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  8,
  'Ajoutez ensuite le bouillon de volaille et laissez mijoter une minute',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '81e6c75a-d1c8-461f-805b-496049516abc',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  9,
  'Versez enfin la crème liquide, le curry et le persil ciselé',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fe829e1c-174a-46bf-aa80-cf5154a90722',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  10,
  'Salez et poivrez à votre convenance',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b50d5292-cd08-4453-88d1-2bee4b76fa03',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  11,
  'Mélangez bien et laissez mijoter, 2 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5e3eb597-1e95-4a87-9a70-091b1bdc711c',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  12,
  'Dressez les assiettes en déposant une belle timbale de riz Dinor au centre et en ajoutant le poulet au curry par-dessus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '59504758-863e-422d-88a5-5deed5f84a3a',
  'db0be299-e3ec-4f69-aa0c-1b7b6af0b913',
  13,
  'Servez immédiatement.',
  NULL
);


-- RECETTE 10: GNANGNAN A L’HERISSON
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'GNANGNAN A L’HERISSON',
  'Recette traditionnelle : GNANGNAN A L’HERISSON',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bb578216-9253-41aa-9c50-e95737824c40',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'hérisson fumé',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7e339fc5-ce76-4805-bbfc-0dd90bd88c2a',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'petites aubergines amères',
  'poignées',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '698d3e0f-6fab-438a-a03c-f7d2c8332827',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'petits oignons africains',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '50111442-9fb2-4fa6-8359-75ab537af855',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e147491c-5570-4630-9232-f5ec45e4efbe',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'tomates paysannes',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e6794109-ca10-428d-b24a-f3c09d07e4a5',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4653e4a3-38a7-4758-aa5d-d9537b89bc5a',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  1,
  'Equeutez le gnangnan et lavez-les',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ad4d8c7f-e7c6-4490-91fb-ff59cd8e895d',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  2,
  'Faites cuire le gnangnan dans de l’eau à couvert pendant 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '18096cbe-cfc7-4405-acf3-e7b4c07c318c',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  3,
  'Lavez les tomates et les piments frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '29ebbd58-4682-4cfa-a52b-2e4447dd3d11',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  4,
  'Epluchez les oignons, lavez-les puis coupez-les en deux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4d1a48b7-4707-4b6d-aede-04677758e305',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  5,
  'Pendant ce temps, dans une autre casserole sur le feu, ajoutez les morceaux de hérisson fumé, les piments frais, les tomates et les oignons',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ae1385ef-2328-42e7-aaa0-fd758c2d2d99',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  6,
  'Ajoutez un ½ L d’eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6e32f42e-19d2-4781-a8e8-b52316f77311',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  7,
  'Portez le tout à ébullition pendant 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7a9a1c9e-4c39-4706-a218-297dcc7b6c4c',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  8,
  'Retirez les légumes de la sauce puis réduisez-les en purée (pas trop fine) et ajoutez le tout à la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4b3e63f7-6620-4564-8941-ab74e4416dea',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  9,
  'Ecrasez le gnangnan dans un trépied ou un talié puis ajoutez-le à la sauce et assaisonnez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c76947ce-db6d-4828-a3de-5dc725bceddb',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  10,
  'Laissez la sauce cuire, rectifiez l’assaisonnement et servez avec un foutou d’igname',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '727f9a79-607f-4974-94d6-e7cf3670c7e9',
  'a9e42531-607e-4664-96aa-e72f9a8201e7',
  11,
  'NB : Une des recettes incontournables pour la fête de Pâques.',
  NULL
);


-- RECETTE 11: PEPE SOUPE A L’HERISSON
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'PEPE SOUPE A L’HERISSON',
  'Recette traditionnelle : PEPE SOUPE A L’HERISSON',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3ed5c433-6c43-433d-8b09-fa2ee2700184',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'hérisson frais',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '41c8958f-a672-4db0-8e47-cf1108baf3bb',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '532a71ff-5f00-4059-b682-b4d9a741ce78',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'd’ail',
  'gousses',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b55aff5f-6abf-4580-865b-04063a561c8f',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'tomates fraîches',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '29b99743-03bd-465b-b224-2778f6fe9be1',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'd’akpi',
  'grains',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '19f29fd3-e159-47a7-968f-cd0dbd2a2e33',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'gingembre',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '526475ae-57c2-4b65-b0be-750a64487c19',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8a932b05-1296-4a2e-94e9-5737bdd37d55',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4753f0d5-b73b-42e5-b524-fcacf40fdfbb',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c4167619-2ce3-44c6-b6c8-b79d7b7316fb',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  1,
  'Lavez les morceaux de hérisson',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a81ac856-6197-4d98-842e-d8a9144970a5',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  2,
  'Disposez-les dans une casserole, salez, poivrez et laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'beba70ee-3239-4fe6-91f9-43f56e251e2f',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  3,
  'Epluchez les oignons et l’ail',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '62a58a06-a735-42d2-b941-8f507e960c32',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  4,
  'Ajoutez-les ç la préparation ainsi que les tomates fraîches et les piments frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1c56edfc-708b-44ed-9dbe-9711f654d062',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  5,
  'Mouillez la préparation avec 1 L d’eau et portez à ébullition pendant 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4a9186e3-6f2a-4b5f-8b47-e2184c2a35a7',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  6,
  'Retirez les légumes de la sauce et écrasez-les sur un caillou africain jusqu’à l’obtention d’une purée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3478c1a3-34ed-4a41-b815-d5f21a5f53af',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  7,
  'Rajoutez la purée à la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eeb01fd8-cd30-47ee-ba33-28502e1b0614',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  8,
  'Salez et ajoutez le gingembre haché et l’akpi écrasé',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ba7caccc-b65a-48e4-93fb-df938fec4698',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  9,
  'Poursuivez la cuisson de 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '599c113d-a705-40fe-8ce9-3aef603fda23',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  10,
  'Rectifiez l’assaisonnement et laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6326f064-2aa7-4c31-a57b-f2ab4aa52d90',
  'e5410683-0241-40ea-835b-881a6cb9ba83',
  11,
  'Servez le pèpè soupe avec de l’attiéké.',
  NULL
);


-- RECETTE 12: DJOUMBGLE SAUCE GRAINE AU PANGOLIN
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'DJOUMBGLE SAUCE GRAINE AU PANGOLIN',
  'Recette traditionnelle : DJOUMBGLE SAUCE GRAINE AU PANGOLIN',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8f9268b6-c821-482a-9fee-dec937b8bcc4',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'pangolin frais en morceaux',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7d3d58a1-27d6-4143-b7bc-4513547487eb',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'graines de palme',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bfb63958-c2dc-4034-ad13-38f42bda2b93',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'oignons africains',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0d6a4387-804f-4ec8-a062-188442d02292',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'tomates paysannes',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd989e822-5dba-44fa-8055-554e4f7f652c',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '72817a6f-3879-4ae8-86ba-a703a7728d0f',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'poudre de djoumgblé',
  'cuillère à soupe',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b91c5fe3-2e6c-47f8-b3b6-41d54d3c299b',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '95342086-969f-4828-abbf-b5c6339a7cb1',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  1,
  'Lavez les graines de palme',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '889398bd-9c0e-48e9-b335-77e81eb5ffc5',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  2,
  'Faites-les cuire dans un 1 L d’eau pendant 1 h',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e9a8a174-7726-4556-ad4f-a6bbd578b8ff',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  3,
  'Pilez la graine dans un mortier et malaxez la pulpe dans un 1 L d’eau pour en retirer le jus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd37d68de-6faf-4e83-a6e8-1308bafaecbd',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  4,
  'Passez le jus au tamis',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f7b165cd-bd2f-47ab-aa9f-163cd1eb1997',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  5,
  'Lavez soigneusement le pangolin',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c2f84613-24e3-4f95-b26c-6c351da18b44',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  6,
  'Lavez les légumes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '86eb5bd3-5556-4a3e-b531-e432f68bbb35',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  7,
  'Mettez le gibier dans une casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8ecc1949-b248-4a56-bdb0-91151e6ac713',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  8,
  'Salez et laissez frémir, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c5d84581-ac5a-4a0e-8817-1e3b169eb0b3',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  9,
  'Versez le jus de graine sur les ingrédients et portez la préparation à ébullition, à petit feu, pendant 1 h 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c6c4084d-1901-4e6b-a8b0-51710bdd3905',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  10,
  'Retirez les légumes puis écrasez-les dans un talié',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ad2dfbf4-5e6e-49ab-afc6-49378a6ae5fe',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  11,
  'Rajoutez la pâte de légumes et laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd7e12dd6-da1a-42df-b403-18d93f5971fb',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  12,
  'Ajoutez la poudre de gombo sec tout en tournant afin d’éviter les grumeaux et poursuivez la cuisson de 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '30034253-b8d1-4d1c-aca2-36ebb280b24b',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  13,
  'Rectifiez l’assaisonnement et servez avec un foutou de banane ou d’igname',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7d516d2c-46d6-4342-98d5-0f8c9b65a4ae',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  14,
  'Petite astuce de grand-mère : vers la fin de la cuisson, pilez 2 à 3 piments frais que vous ajoutez à la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '39911740-5cac-405a-b9e8-b75e48dc8d5d',
  '950a1ab3-4c35-430d-89db-3905b8af0af7',
  15,
  'Cela parfume agréablement la sauce.',
  NULL
);


-- RECETTE 13: RAT BRAISE A LA VILLAGEOISE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'RAT BRAISE A LA VILLAGEOISE',
  'Recette traditionnelle : RAT BRAISE A LA VILLAGEOISE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8b7aff87-0bbe-455c-a70d-deae830384b7',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'rat fumés',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '62700c0f-0f8f-4ed3-b78c-0ffa0d8a0242',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7f4eb9e4-660a-49be-85eb-332ddac4d946',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1e560a5f-d2f2-48f9-b463-3e53f859101e',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'tomates fraîches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3923ecc1-52cf-4595-aba0-15bcf317324b',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'piments secs',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0d8ca157-1d80-4486-a6e6-e5b5a1f4b4e0',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'd’huile',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c3fb54a6-c405-4b2d-b015-c8dd8693fa4b',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1276b937-79f7-40f9-a54f-217a773e93f7',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '65efd5cb-0c66-4ced-bde6-e383a685a719',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  1,
  'Lavez soigneusement les morceaux de rat',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2d53ceb6-1260-4897-9b47-d83c4d0cbbbe',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  2,
  'Ecrasez sur un caillou africain l’oignon, les tomates fraîches et le piments sec',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '795c03ce-3d03-478b-9d3d-f74239cfba0f',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  3,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5e5679c6-b539-46aa-beca-02cb3825d75c',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  4,
  'Ajoutez l’huile et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '18b800bb-1255-45b1-9f09-88dee87610d1',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  5,
  'Farcissez les morceaux de rat avec la marinade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8c13f023-d6e5-44d6-99cb-af2dd04ab627',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  6,
  'Disposez-les sur la grille et faites-les cuire au feu de charbon de bois, pendant 15 min, de chaque côté',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd3202d15-6e56-4172-b62d-aa994caa012d',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  7,
  'Retournez-les, de temps en temps, afin d’avoir une cuisson uniforme',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '40066d0e-ff36-4c92-8429-c3039d178cda',
  '88bac6e0-4ed4-4cb4-b108-6548fa8c0d36',
  8,
  'Servez votre rat palmiste avec de l’attiéké et une sauce tomate pimentée.',
  NULL
);


-- RECETTE 14: TARTELETTES AU SURIMI ET MAYONNAISE DINOR
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'TARTELETTES AU SURIMI ET MAYONNAISE DINOR',
  'Recette traditionnelle : TARTELETTES AU SURIMI ET MAYONNAISE DINOR',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2cb07e1b-d45c-4047-81ec-e4708195e52e',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'fonds de tartelette cuits',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0d0215a9-43cd-4ba4-974a-ce91704e8d83',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'maïs en boite',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1b333590-6d30-4800-9a6c-84e708cdf79a',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'bâtonnets de surimi',
  'pièces',
  16,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '775b2a87-a9c9-4807-9518-77655a9ea274',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'mayonnaise Dinor',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '89be8caf-1716-46b5-9564-c81812554f21',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '83845d7d-b462-4e0a-995f-3f078813f0db',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5171fa70-b8e3-47e6-90fa-08964d6af7f0',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  1,
  'Egouttez le maïs',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '78cf0f46-d695-4897-86ea-f294a5288af5',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  2,
  'Coupez les bâtonnets de surimi en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '300a9dd8-0246-4a8e-aec6-9ddd7a7de3a0',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  3,
  'Versez le maïs et le surimi dans un saladier',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f9395542-bd6c-40e3-93ab-146b85800118',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  4,
  'Ajoutez la mayonnaise, le sel, le poivre et mélangez bien',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2a1b9672-c25e-4d11-91c7-e9a5c2db4a72',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  5,
  'Réservez au frais jusqu’au service',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '58d7cfde-e802-4c21-976d-0f55801ea437',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  6,
  'Au moment de servir, garnissez les tartelettes avec la préparation',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f1e2326c-5610-4161-9363-9878ba977772',
  '910d4442-d616-4259-99e6-836709e5cd5c',
  7,
  'Dégustez sans attendre.',
  NULL
);


-- RECETTE 15: ETOUFFE DE RAT PALMISTE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'ETOUFFE DE RAT PALMISTE',
  'Recette traditionnelle : ETOUFFE DE RAT PALMISTE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6e5c9979-9b0e-42f4-bbae-ac71473e8af8',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'rat',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7a510df7-43cf-4347-a852-70128b041e17',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '31705f08-503f-45ba-a4d1-b8f79e57930d',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a2fe3729-be6f-43fa-9520-36af1be2be48',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'tomates fraîches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a960b91c-9438-481f-8585-fa277f27fe32',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'grosses aubergines',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '398198cd-cd45-49aa-8569-d468b7185dd1',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'gingembre haché',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '40bf90cf-e3a6-43f4-a03b-05915bae2189',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'Des feuilles d’attiéké',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '066e384c-6256-4955-8fcb-ed7dfa21ae7c',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b58f102e-6c4d-4662-b54d-dee536eb44d6',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '259c7bd7-4dda-48a1-9183-7432974c2cac',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  1,
  'Lavez les morceaux de rat et réservez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1cda8f16-9f84-400f-aa39-f2cf75062ed2',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  2,
  'Epluchez l’oignon et lavez-le',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '072c1435-d9b1-455a-b3b2-9374ac6e668e',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  3,
  'Faites de même avec les autres légumes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c968a83f-a900-41f8-8db9-6ba85da939e2',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  4,
  'Ecrasez-les dans un talié (oignon, piment frai et tomates)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e77fb5bd-5d8b-46d0-aa09-5173bd3460ec',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  5,
  'Coupez les aubergines en petis dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '74209f6e-b81a-4c7b-b248-398a97138afe',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  6,
  'Ajoutez la pâte de légumes à la viande ainsi que les morceaux d’aubergine',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '759d4353-7f5f-4ff8-a4b2-f05249892e5f',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  7,
  'Salez et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1f223164-925c-42dd-996c-a6cf9cc6bf13',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  8,
  'Disposez le tout sur des feuilles d’attiéké et mouillez la viande avec un ½ verre d’eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd56336be-795a-4021-800a-92563f95007f',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  9,
  'Refermez correctement le paquet avec une ficelle afin de faciliter la cuisson',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2f011f7a-3d32-4b67-a62e-41840386ee26',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  10,
  'Disposez la papillote sur une grille et laissez cuire au feu de charbon de bois pendant 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b989ddd1-1e67-4b7d-8af4-b4ba264be90c',
  'd4598a1b-a258-4fd3-a508-4078004efa63',
  11,
  'Servez avec de l’igname ou de la banane vapeur.',
  NULL
);


-- RECETTE 16: AKPI TRO (sauce akpi) Porc-epic
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'fe307291-152d-49ea-b112-84f80a143da0',
  'AKPI TRO (sauce akpi) Porc-epic',
  'Recette traditionnelle : AKPI TRO (sauce akpi) Porc-epic',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '35049413-4734-4843-8a61-7a5643bef85a',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'porc épic fumé',
  'morceaux',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0c780fbf-9213-4268-9bf1-1230eca56c28',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'grosses poignés de grains d’akpi',
  'grains',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '48450612-6a8b-4b1b-b06f-dadf3f55ce62',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'oignons africains',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '821967a2-48d8-4079-ba71-58fa179a5306',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'tomates paysannes',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8332b3fb-c896-41bb-a028-6a37e07c5baf',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5e7673b6-8dee-4539-87e1-d2ae30d24574',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'poudre de poisson',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '741fd88c-842e-411e-b624-f536f46f2756',
  'fe307291-152d-49ea-b112-84f80a143da0',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '224f3c2c-5c5c-48f8-b99d-af823e310352',
  'fe307291-152d-49ea-b112-84f80a143da0',
  1,
  'Lavez les morceaux de porc-épic',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0d45bea3-2e18-47bf-a81f-de5e115c06f0',
  'fe307291-152d-49ea-b112-84f80a143da0',
  2,
  'Mettez les morceaux de gibier dans une casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'df0809b6-f81e-48b4-a4c9-9c54f20c4af6',
  'fe307291-152d-49ea-b112-84f80a143da0',
  3,
  'Versez un ½ L d’eau, salez et portez à ébullition pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a0d42fda-d625-4db1-9e93-a9cc78ee6007',
  'fe307291-152d-49ea-b112-84f80a143da0',
  4,
  'Poursuivez la cuisson en complétant l’eau (1/2 L)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c57351d4-9bc9-47e5-a5a3-bd3745d9be6d',
  'fe307291-152d-49ea-b112-84f80a143da0',
  5,
  'Ajoutez les tomates, les oignons (3) et les piments frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7fcfc1c4-5443-4a49-b15d-911c948c3146',
  'fe307291-152d-49ea-b112-84f80a143da0',
  6,
  'Laissez cuire, 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4ccfd23e-0c04-41f5-8f5a-cbf4ee7b831e',
  'fe307291-152d-49ea-b112-84f80a143da0',
  7,
  'Retirez les légumes et écrasez-les dans un talié',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '832e238b-5092-4e51-af36-117092953627',
  'fe307291-152d-49ea-b112-84f80a143da0',
  8,
  'Rajoutez la purée obtenue au jus de cuisson de la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ebb28635-0135-4896-9d53-31ed8ff99d19',
  'fe307291-152d-49ea-b112-84f80a143da0',
  9,
  'Ajoutez la poudre de poisson et continuez la cuisson de 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '13a2b4fc-934f-4c1a-96bf-90ae5b67ee04',
  'fe307291-152d-49ea-b112-84f80a143da0',
  10,
  'Ecrasez, sur un caillou africain, les grains d’akpi jusqu’à l’obtention d’une pâte lisse et sans grumeaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '08f1dd0c-b6e2-41f3-a3c9-a7ed1a125a98',
  'fe307291-152d-49ea-b112-84f80a143da0',
  11,
  'Recueillez une partie du jus de cuisson de la sauce et mélangez-y la pâte d’akpi',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3cebf3f3-edee-4462-9bf3-c00148049314',
  'fe307291-152d-49ea-b112-84f80a143da0',
  12,
  'Versez ce mélange dans le jus de cuisson de la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7d87fa1c-df0b-41d2-b6af-29659ae26a16',
  'fe307291-152d-49ea-b112-84f80a143da0',
  13,
  'Poursuivez la cuisson de 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eb0d94c2-c2f1-4c91-9c89-d69b44f0c38f',
  'fe307291-152d-49ea-b112-84f80a143da0',
  14,
  'Rectifiez l’assaisonnement et ajoutez le dernier oignon coupé en petits dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1c84e399-2910-4aa2-94e8-1454f9ffd069',
  'fe307291-152d-49ea-b112-84f80a143da0',
  15,
  'Laissez mijoter, 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c31987e9-5f35-4184-8c52-a5ea84b5d741',
  'fe307291-152d-49ea-b112-84f80a143da0',
  16,
  'Servez avec le foutou de banane.',
  NULL
);


-- RECETTE 17: TRA TRA pour 4 personnes
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  'TRA TRA pour 4 personnes',
  'Recette traditionnelle : TRA TRA pour 4 personnes',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b77bfcb7-d855-44ad-9f0a-216841ebf2cd',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  'farine',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '52f0b2f1-1256-4719-b8ff-635619aa7aed',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  'levure boulangère instantanée',
  'sachet',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '51e5f9ad-039c-4b4f-9331-8feb09c1f48d',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  '½ L d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2d081dec-7669-41b9-84bb-8ec5f4b33655',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  'd’eau chaude',
  'cl',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7aa130ee-df3e-4cc3-8234-f34b1aebce0f',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  'Une pincée de sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e8e1213e-63ed-4a84-8baa-2d4650387dad',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  1,
  'Mélangez à la farine, le sucre, la pincée de sel et la levure',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '03ad8d93-86ca-467b-bd0b-3a0faff78629',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  2,
  'Ajoutez l’eau, mélangez à la spatule et laissez reposer la pâte hermétiquement fermée pendant 5 heures',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7360bad5-3ca0-49dc-90f8-b5f6439a5585',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  3,
  'Prélevez la pâte à la main et faites-là frire dans une poêle à fond plat',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '996ae0de-ec68-486b-8674-2ab6769d13ef',
  '8336c976-d0ca-482d-860c-5653a2f34a39',
  4,
  'Laissez bien dorer 4 min sur chaque côté, retirez de l’huile, égouttez et servez.',
  NULL
);


-- RECETTE 18: L’ASSIETTE DU CHEF
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'L’ASSIETTE DU CHEF',
  'Recette traditionnelle : L’ASSIETTE DU CHEF',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'df3eab1a-f269-44b4-a6ad-f0c0e8dfe47b',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'suprême de volaille',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ebf62a31-22ff-416c-a497-15bfbc0f06d3',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'd’akpi',
  'g',
  50,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3dae95e2-7d41-40ae-8546-0e34dcfa7a75',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'd’huile',
  'cuillère à soupe',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd8dac655-4eba-494d-aa2c-4f2dd86154a3',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'd’ail',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bc23a4fe-039a-4e2a-b0a6-7916b120deca',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'gingembre',
  'g',
  20,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c8cebdec-a6d9-47db-8411-d93f38d8f60d',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'kankankan',
  'cuillère à soupe',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b5d0c85c-8e2e-4e39-88af-3f6defdfd348',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'céléri',
  'botte',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a5b26ab7-311a-4b72-a01f-66eca1b64e74',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'edd6ac1e-6810-41bc-a5d7-7e079e89bdfe',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'poivre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd1501c18-0ec9-47c6-9080-c1ba9c007cff',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'patates douces',
  'kg',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0fe77c49-a023-4de5-97b5-c6f9b43a4e6a',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'beurre',
  'g',
  50,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '286d7c23-9e02-4c1b-9513-747c987e5f5e',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  'l’huile pour la friture.',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '70fda31d-48bf-440e-97cb-71bf1a5fa0e1',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  1,
  'Lavez et égouttez les suprêmes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'bbf683bc-fe57-4ed5-a736-30281bcac8d4',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  2,
  'Mixez ensemble les ingrédients de la marinade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '91331443-4d59-4a96-a948-47dabfb56573',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  3,
  'Réservez une persillade pour les patates douces',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '02f26503-073c-4fc4-8e1f-ea99cc21baf3',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  4,
  'Assaisonnez et marinez les suprêmes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd9fe7353-ae43-4184-8802-80d7f613fdf8',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  5,
  'Réservez-les au frais pendant 1 h',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c52f7576-cf8e-4cf8-a97e-57bfd9f7df87',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  6,
  'Lavez et pelez les patates douces',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b74037da-f6a9-47fe-8fcd-3156f632d815',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  7,
  'Tranchez-les en rondelles dans le sens de la largeur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a69b5ef4-48c4-48eb-a29f-0e59bfcd2176',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  8,
  'Blanchissez-les ensuite à l’eau bouillante salée pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '73cdcce7-2211-4330-855c-222fd6e39c6a',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  9,
  'Egouttez-les et réservez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c82b154b-068b-4a4a-815b-60228ccfdd93',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  10,
  'Poêlez les suprêmes et faites-les cuire au four, 10 min, à 180°C',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'da1d5264-d0ca-44d7-bbc2-6a25817ba5e1',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  11,
  'Chauffez la friture et faites-y cuire les patates douces',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '02e70170-e545-409c-96db-7d6846de04bd',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  12,
  'Ensuite, sautez-les au beurre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f8773fd5-af8c-41fb-8130-a1c1036f3642',
  'ca84993f-bc8d-4504-a4ee-270ffe5cceb6',
  13,
  'Persillez-les puis dressez.',
  NULL
);


-- RECETTE 19: COCKTAIL POMME-CITRON
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  'COCKTAIL POMME-CITRON',
  'Recette traditionnelle : COCKTAIL POMME-CITRON',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ec317ebb-8285-4c4a-911d-4ab4d8026c52',
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  'jus de pomme PRESSEA',
  'cl',
  24,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '048c2025-7aac-40e3-b621-009eff5b0f6e',
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  'jus de citron',
  'cl',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2e30b4e0-b471-4a9c-a05d-674af680b242',
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  'sucre vanillé',
  'cuillère à soupe',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0d65715e-accc-4413-b658-280d01870d1f',
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  1,
  'Mélangez ensemble le jus de citron et le sucre vanillé jusqu’à ce que le sucre soit totalement dissous',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4c36800d-10c7-4c0b-b360-68c3e7e7f9b6',
  'a2e56000-79fc-4e33-b8fc-113a7adc2085',
  2,
  'Ajoutez le jus de pomme et servez frais dans 4 verres.',
  NULL
);


-- RECETTE 20: GATEAU AUX DATTES pour 4/5 personnes
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'GATEAU AUX DATTES pour 4/5 personnes',
  'Recette traditionnelle : GATEAU AUX DATTES pour 4/5 personnes',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0e6b47c4-62e5-417a-a082-0b65c38b2a08',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'yaourt à utiliser comme mesure',
  'pot',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9210199a-8a8b-4917-84c1-f4cad62a92ae',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'farine',
  'pots',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0dbcbae8-b09f-4133-b847-eb68f925aa26',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  '½ pot de sucre blanc en poudre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bbadffa2-b8cc-448b-8613-1c39379286cf',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'œufs',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0493c2d0-6def-4f90-95da-7a02368df240',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  '½ pot d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fc8ffbd5-5f6d-4f9c-a570-1e305d25ed44',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'levure chimique',
  'sachet',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4a7eebbf-a8be-404c-848f-ab97d92dc620',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  'Une quinzaine de dattes',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '912e811c-88a6-4c31-a27c-2f7647286b61',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  1,
  'Préchauffez le four à 170°C. Dans un saladier, mettez le yaourt, les œufs et le sucre et mélangez jusqu’à obtenir une texture mousseuse.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c7e0ac8d-bafa-45d1-8ca7-734959349963',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  2,
  'Incorporez lentement la farine et la levure. Ajoutez l’huile et enlevez les noyaux des dattes pour les ajouter à la pâte.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '42dbc630-893a-4e94-82ca-428eadda5913',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  3,
  'Versez la pâte dans le moule et enfournez 30 à 35 min.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4499f54d-f9af-4965-a7f0-2aae7ec9e299',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  4,
  'Pour démouler, passez la lame d’un couteau sur le côté, puis renversez le gâteau avant qu’il ne refroidisse.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '498f36d6-97f9-4521-9924-f7aae3da685e',
  'cff278a8-a433-4585-98f6-be0a28c1fa36',
  5,
  'Vous pouvez remplacer les dattes par des raisins secs ou autres fruits secs. Santé & bien-être',
  NULL
);


-- RECETTE 21: SALADE DE LEGUMES A L’AGOUTI
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'SALADE DE LEGUMES A L’AGOUTI',
  'Recette traditionnelle : SALADE DE LEGUMES A L’AGOUTI',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1e78cb04-f852-4b7f-82af-95247ddd6fb1',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'carottes',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e1be6837-261a-4cb6-ab3c-91e2a437e32f',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd1d38acd-6a8f-41ae-a1ee-f2325a0fd168',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'poivron rouge',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b8127e9a-272f-4b85-9a9d-e5b0335b78f8',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'persil',
  'brins',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e17aa594-6a3f-4859-ba11-70465fc12b25',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'concombre',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8a019a46-08ab-4750-a945-1665c53a689f',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'tomates cerise',
  'pièces',
  12,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2e3a79ff-9559-436f-a703-1b8a90e4a1e9',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'd’agouti',
  'g',
  300,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '28b2b469-2d06-49f8-b045-48c0dca8751c',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'd’huile d’olive',
  'cuillère à soupe',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8907fb77-d7ae-4cef-a6f3-7a5c085c6d8b',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8f0d54db-e34e-44e1-a057-cb84854b8337',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'poivre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c7222244-cd71-41a2-b7f6-7a14d10020e5',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'Le jus de 2 citrons',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fd9c93e2-5baa-4339-86b8-221d33893b8f',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'd’huile d’olive',
  'cuillère à soupe',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1216088c-5f09-48cb-9564-ee24913606ac',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9acbabc3-aca7-474f-8ebb-2e36da7fcd4b',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a8bee4c5-e45a-4336-9d8c-343ec9ff3460',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  1,
  'Lavez soigneusement le gibier',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e4519bb2-ce73-48cd-8305-54a8faa68f22',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  2,
  'Mettez-le à cuire dans l’eau bouillante salée et poivrée pendant 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '54ec8ce1-1ee1-44c2-b478-4ebfa5f12248',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  3,
  'Retirez le gibier de l’eau et émincez-le',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5b8cd2e8-76a0-4223-95d1-36c51e89b8dc',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  4,
  'Chauffez l’huile dans une poêle et faites-y sauter les morceaux de gibier jusqu’à ce qu’ils soient dorés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0d016c73-dcfd-43f6-a4dc-3e588cea563f',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  5,
  'Coupez les carottes en julienne et émincez les oignons',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2f30b7e0-68f0-475c-b125-15da5ddf4fa4',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  6,
  'Coupez le poivron en petits dés et le concombre en rondelle fines',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0ef5d88e-2497-4e9f-912a-a6d0b03bb00c',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  7,
  'Répartissez les légumes dans une assiette',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'db912be2-26be-45fd-9b85-ecd96c886a44',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  8,
  'Disposez par-dessus le gibier et la tomate cerise',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '07d112e0-2185-442a-a4b1-c9847c61f171',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  9,
  'Versez la vinaigrette sur la salade, mélangez et c’est prêt',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2888ef51-2147-4371-8283-de2623bfdd03',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  10,
  'Ps : Faisant partie de la catégorie des viandes maigres, le gibier est très conseillé pour les personnes désireuses de maintenir leur ligne',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd59fe6f9-2a00-41fe-80d7-1ffac9f2f103',
  'f053206f-9ccf-4fb8-93c9-e1a25ab41a5d',
  11,
  'Nous en voulons pour preuve cette recette de salade de légumes à l’agouti.',
  NULL
);


-- RECETTE 22: SALADE DE FRUITS AU TAMARIN
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'SALADE DE FRUITS AU TAMARIN',
  'Recette traditionnelle : SALADE DE FRUITS AU TAMARIN',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '566ff19e-8b97-40e7-9562-de0dfce2d573',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'ananas',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8024c35b-56e4-4498-85b5-998a0a140e67',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  '½ pastèque',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1c6c0ece-c843-4133-a434-1771e4de1b8c',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'pêches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a6518309-dede-453d-941b-6eefba44e8c1',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'melon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'eedc81bf-5b07-4b52-98cf-4af00ce0e9da',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'kiwis',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8ee8a6cd-17af-4530-9027-d7a4dcf823e6',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'banane',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2d93d446-8991-42db-ae30-1e75e7ce6bb2',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'oranges',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e3e79892-9095-4388-9c12-4f62dfc1ff32',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'pommes',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '73520ad4-f8c9-4c16-990e-07b4fd86259a',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'sucre vanillé',
  'sachets',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5075552e-bc0a-43c7-a2df-921bfcbfa8cd',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'sucre en poudre',
  'g',
  100,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a643db14-1033-4e57-bde8-5347ae473275',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'Le jus d’un citron',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b49f8f48-5aad-4c29-898e-2c2fb67d07a6',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'Le jus de 2 oranges',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4056d559-cde6-47e3-b069-c7a986cdd6a3',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  'jus de tamarin',
  'cl',
  50,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a421d8e7-ed95-4649-bd56-68aa9c7b9966',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  1,
  'Pelez l’ananas, retirez le cœur et découpez la chair en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2b62aeaf-b217-4c59-8f04-5cfa9f4cc20c',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  2,
  'Coupez le melon, épépinez-le puis coupez-le en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c2474499-94bf-4bc3-98bf-113873a4e0c2',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  3,
  'Pelez les pêches, les pommes et coupez-les en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3904b511-ebb5-407a-afbc-aaadb13449e3',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  4,
  'Lavez les fraises, équeutez-les',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '193ac5eb-55b2-43f1-b0f6-fbec85ec12dd',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  5,
  'Pelez les kiwis, coupez-les en rondelles puis en quartiers',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ce3fe040-f99b-41a2-a6c5-6c1d6a72f198',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  6,
  'Coupez la banane en rondelle et arrosez-la de jus de citron afin d’éviter qu’elle noircisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '002ea244-326e-4392-9dff-eae3cd838d50',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  7,
  'Evidez la moitié de la pastèque',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0844e615-6821-4031-9a58-1adb491e54dc',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  8,
  'Faites des petites boules à l’aide d’une cuillère',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e6bae040-cad3-4ce5-af91-0b3f149b841a',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  9,
  'Pour la quantité, cela varie selon votre goût',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e94b36ed-f2f4-496f-b0cc-b5e2d8c35703',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  10,
  'Réunissez tous ces ingrédients dans la coupe de la pastèque, elle vous servira de saladier',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5f25376f-32a6-428d-9c5e-a863b5602783',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  11,
  'Pour finir ; versez le sucre vanillé, le jus de tamarin et le jus d’orange sur les morceaux de fruits',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '88555bfa-ba41-4c26-8ac1-65d8c1304e8f',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  12,
  'Mélangez doucement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c11d6960-00e8-463c-9a45-47d39e946f4b',
  'c86b8d0f-ed8a-448a-95a4-03f54b77dacb',
  13,
  'Réservez au frais et servez.',
  NULL
);


-- RECETTE 23: TISANE AU GINGEMBRE ET CITRON
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  'TISANE AU GINGEMBRE ET CITRON',
  'Recette traditionnelle : TISANE AU GINGEMBRE ET CITRON',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'acf619b3-559f-47fa-996a-95c12ff42caa',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  'à 4 fines tranches de gingembre frais',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3f6e095f-586f-408a-9e95-32b04502e141',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  'd’eau',
  'ml',
  250,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3dd43597-e702-426f-a45d-9f2dad78f661',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  'citrons (ou le jus de 2 citrons)',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5dec47fa-223d-4ceb-9a0a-d5fb40ab74b8',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  'miel',
  'cuillère à soupe',
  4,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c5704051-4837-44d4-b3f1-40a6ef555b31',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  1,
  'Portez l’eau à ébullition puis ajoutez les tranches de gingembre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'be1bea1b-b257-47f4-b37f-0b4d6e5328ca',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  2,
  'Laissez infuser 5 à 10 minutes (afin d’obtenir une dose efficace en substances actives)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '73501057-20eb-4a47-beed-ae563fc65141',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  3,
  'Pressez les citrons et rajouter le jus à la tisane de gingembre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'bdb2711f-8229-46f4-a176-3fa8bd429457',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  4,
  'Rajoutez le miel et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '889884e4-f388-43c4-b475-51f023bcb4be',
  '864890fa-f209-4a48-ac3c-9fc53df1913f',
  5,
  'Filtrez éventuellement avant de servir.',
  NULL
);


-- RECETTE 24: SAUCE ARACHIDE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'SAUCE ARACHIDE',
  'Recette traditionnelle : SAUCE ARACHIDE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7920dc62-f7e2-4501-82e4-01268e5f7897',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'viande de bœuf',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9b45afd5-95bf-4388-b289-075b3119240e',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'poissons fumés (capitaine)',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '51eb426f-d355-4a78-89da-661b5569143f',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'pâte d’arachide',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '220e688c-7ae9-4835-bea4-54440a9e1a7a',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1bf3c10e-afce-47bc-8ff8-b43dbe7f15c1',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'tomates fraîches',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ff962e52-31a6-47cb-88af-81b86a3d0394',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'tomate concentrée',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '03cc22a0-fa72-43dc-a938-0423ac90c684',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'poudre de poisson fumé',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '41ca9cc4-e047-46ef-bbf3-04deba554c0d',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fe437266-5fb2-416f-a35b-4e476c67a2ff',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'gombos frais',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2ce4f966-16a7-4c9e-b714-eeeb8edbea82',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7e1aa5c6-d6d4-48bb-9c4a-4d461d1b9b9d',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  1,
  'Coupez la viande en morceaux et lavez-les',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9c4fda1f-e956-47a7-9437-47157e54b987',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  2,
  'Mettez la viande dans une casserole et faites-la revenir pendant 5 min à couvert',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '38a42c8e-e15e-41a1-bc63-b79ed368e7c6',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  3,
  'Ajoutez les oignons épluchés et entiers, les tomates fraîches, les piments frais et la tomate concentrée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '807fa809-f648-4f03-a2c2-ac265ed227c1',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  4,
  'Mouillez la préparation avec 1 L d’eau et portez-la à ébullition pendant 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '365d2750-1f8d-4d96-891e-717be46c6aad',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  5,
  'Rajoutez la pâte d’arachide à la sauce et continuez la cuisson de 10 min, le temps que la pâte se dissolve complètement dans la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dccd32d1-3e7a-4e16-a3c2-f747309ae224',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  6,
  'Retirez tous les légumes et écrasez-les jusqu’à l’obtention d’une purée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5a0df415-0b0c-49f7-ac5e-0396596f8229',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  7,
  'Rajoutez la purée obtenue ainsi que le poisson fumé à la sauce et laissez cuire, 1 h à petit feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f08ae735-e61a-4e21-8a1d-b0967bec2ff6',
  '46de51b4-2320-4dd7-86c8-559599ab65c2',
  8,
  'Rajoutez les gombos frais, rectifiez l’assaisonnement et laissez mijoter 15 min avant de la servir avec l’accompagnement de votre choix : riz ou foutou.',
  NULL
);


-- RECETTE 25: SOUMARA LAFRI
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'SOUMARA LAFRI',
  'Recette traditionnelle : SOUMARA LAFRI',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '72d1c640-ffed-473b-9be1-471797e3768a',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'bœuf',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '06993a4f-242c-4de2-8d55-0ac828292f3b',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'riz',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f7f6a63b-98aa-44a2-a6da-4ff0b266a431',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'crabes',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '45e99b20-5e11-46e9-9ccf-19c4be8d1b37',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'tomates',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '87a326bd-8d46-4c9d-b8f0-eb03be50ed2d',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'aubergines',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fea8d37a-fe2a-4e23-98ad-0eda4298e49c',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'gombos frais',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9c1dee1a-d697-47a5-b77e-868f31b3b83d',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'oignons',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c9fbfb65-1497-4c28-9f84-b9e1c6c1bbbe',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'd’ail',
  'gousse',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e1290b42-ca25-4289-9a38-279a0b98f2c2',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'tomate concentrée',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f52ea104-c9ad-4047-bfdf-9ed68c036448',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'piments',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '38652ef1-18d7-49ce-94c0-283a1fe23ef5',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'soumara',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'adeada20-440f-4b6c-a8b0-3b3a8e4503ce',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'persil',
  'brins',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '490fc159-de59-42fa-bc21-eec49eee1f5f',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'd’oignon',
  'feuille',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '82756ece-137c-4ab9-9e96-8a03016a2767',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'cubes d’assaisonnement',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e28118f5-ae43-4ca7-af71-911a677086d5',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  'papier aluminium.',
  'pièce',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9362e72e-7a44-47fe-ad5b-3e138bde5dae',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  1,
  'Portez une casserole contenant 1 L d’eau au feu, ajoutez les gombos et les aubergines équeutés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '998432d1-be17-45cf-8c87-6fbe465412e2',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  2,
  'Après 10 min d’ébullition, ajoutez le riz préalablement lavé et égoutté',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '414fa35c-9738-433b-b3e9-64bf81576b55',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  3,
  'Faites un mélange avec le soumara moulu, la poudre de crevettes, la poudre de poisson sec et le sel',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6ec88791-bd14-490d-a31b-f6aacc9da7aa',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  4,
  'Quand l’eau s’est complètement évaporée, faites des creux de part et d’autre dans le riz et mettez-y le mélange',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dc3e1b85-5492-4961-b783-2c1c1c66603e',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  5,
  'Couvrez le riz avec un papier aluminium et laissez cuire à la vapeur à petit feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3d648015-5a87-4d12-bddd-86f964f6914d',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  6,
  'La sauce tomate : Réduisez en purée les oignons et l’ail',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8dfffcc0-b1dd-437d-8624-90c40d58175b',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  7,
  'Ecrasez les tomates et réservez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fe2176a3-255f-4226-bcb1-1d0c32ed7267',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  8,
  'Ciselez la feuille d’oignon et le persil',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5ade1c5d-f85d-46b3-9b9d-4cd1dcf4e9ea',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  9,
  'Précuisez la viande pendant 1 h',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b5182066-66b4-457a-9484-354551a9fe02',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  10,
  'faites dorer la viande et les crabes pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd01315a9-df91-4eef-bc14-3664bcbfd2ed',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  11,
  'Ajoutez la tomate concentrée, le poivre et le persil',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6ca562b1-e28d-45b4-95a2-ac42231c8104',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  12,
  'Après 2 min, ajoutez la purée d’oignon et d’ail, faites cuire 5 min et ajoutez la purée de tomate et la poudre de crevette',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '19cd8663-ef76-4d45-b5af-41d825af8598',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  13,
  'Mouillez la préparation avec un ½ L d’eau, laissez réduire à la sauce jusqu’à ce que l’eau finisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6a927134-6117-42aa-bc26-2574d80b1f24',
  'c5c36bf7-1e2b-44a0-bafb-166d2025c98c',
  14,
  'Servez avec le riz.',
  NULL
);


-- RECETTE 26: BOUILLIE DE MIL AUX 4 SAVEURS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'BOUILLIE DE MIL AUX 4 SAVEURS',
  'Recette traditionnelle : BOUILLIE DE MIL AUX 4 SAVEURS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '55b75756-51f7-4d47-81ae-18422a165a33',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  '½ kg de farine de mil',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '43c27490-4f57-409d-9201-81ab05873887',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'citron',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9526091a-a413-4031-8c15-37b1706d0fd6',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'sucre',
  'g',
  250,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd085158c-8b84-44e1-b437-22c6df3a6e54',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'sucre vanillé',
  'sachet',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8e8740c4-d9f4-4087-93a5-175837945858',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'gingembre en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '95e3d7cb-672f-4876-bc25-3685bc7d2c43',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'cannelle en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '60cb01f4-1be1-42d9-88e7-321efdc176cd',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  'muscade râpée',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fc1f259c-35e0-4f4a-98e9-4b3adba835d2',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  '½ cuillère à café d’anis.',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c8ffbe5a-199b-489d-81a4-95c727c69c39',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  1,
  'Passez la poudre de mil au tamis',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c991c38a-3ea7-4c38-8ea5-8330f19ceca8',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  2,
  'Mouillez la poudre de mil sans qu’elle ne devienne une pâte',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b5b1b5d7-51e6-46d3-bb9d-cc4528315a6c',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  3,
  'Déposez cette farine mouillée sur un tamis à grains (tamis carré en fer) et faites des grains en remuant',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0c474173-6c90-4da9-b262-d72bbd767353',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  4,
  'Vous pouvez faire des grains à la main également',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a5d8f08c-ce32-41eb-ae65-f6cc6568edf7',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  5,
  'Veillez à un bon équilibre entre l’eau et la farine : les grains ne doivent pas être colés ni s’émietter au toucher',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9b0c3469-b58a-491c-8c49-ac2cad02d59e',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  6,
  'Séchez ces grains de mil à l’air libre pendant une demi-journée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a8789575-cf83-4f1d-88c1-1e12921f081c',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  7,
  'Portez un démi-litre d’eau à ébullition',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '84ff9b98-327e-4aa9-a55a-f0bd1f49e829',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  8,
  'Versez-y les grains de mil en remuant pour éviter que les grains ne se collent',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd28bb667-c797-4600-a8e0-7c45e0478296',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  9,
  'Laissez cuire pendant 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2dddb480-90a0-463b-ad70-669399c6b531',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  10,
  'Après les 15 min, ajoutez à la préparation le gingembre préalablement râpé et un démi-verre d’eau auquel vous aurez mélangé le jus du citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5b462166-3f1e-47f2-b5c4-3c443b6a8f42',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  11,
  'Poursuivez la cuison de 15 min puis sucrez et laisser mijoter 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6a2a7b91-51e5-4db5-bc11-92d04150f1d7',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  12,
  'Avant de servir, mélangez les épices et ajoutez-les à la bouillie',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a8a10bfb-b66e-441e-aba3-1e6e677e4dff',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  13,
  'Mélangez bien et servez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b428d03c-ff7a-4e5f-a3a9-28858b9f4c62',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  14,
  'Suggestion : Vous pouvez également utiliser selon le même procédé des grains de mil déshydratés (prêts à l’emploi) que vous trouverez en supermarché',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f0fff103-01d7-4f9c-9ee5-3c458e6ff539',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  15,
  'Nb : Si la bouillie est trop liquide, avant d’y ajouter le sucre, délayez un peu de poudre de mil que vous avez réservé dans de l’eau que vous ajouterez à la préparation pour l’alourdir',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e2c23991-a2b8-40e3-afa2-35981d9df2a7',
  '54fc1970-8bfd-45e0-a4b5-f0c7c2772c08',
  16,
  'Les crustacés à l’honneur',
  NULL
);


-- RECETTE 27: BIEKOSSEU DE CRABES Crabes
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'BIEKOSSEU DE CRABES Crabes',
  'Recette traditionnelle : BIEKOSSEU DE CRABES Crabes',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5671645a-a646-4e61-a2f2-64e1b36efe1c',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'crabes de mer',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '62f4fa37-81d7-4cf5-a1d2-1cd24b32b3bb',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'tomates fraîches',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f8bcef9c-c0f8-42fc-b0c5-a65c9829765c',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'oignons',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '11482ca0-9dbc-4fbe-b6a4-5e834177f943',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'piments frais',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '49480831-37ef-4521-b0db-156d1cf71b67',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'd’aubergine (klogbo)',
  'poignées',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7217e673-b28a-4bf6-9a4a-d8175c6f504b',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'd’ail',
  'gousses',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1ac561df-dceb-40f5-96ac-a4c3a63f422c',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'Des feuilles d’attiéké',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'cda58bde-3d6f-44cd-b7b0-6fc77ab79f83',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  '¼ L d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b48c4530-cbac-451b-8661-9637271711fe',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5178eb27-d834-425d-9e7a-ac383d265d52',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4600c0a2-54a4-4bbc-a2be-258d7895eb97',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  1,
  'Nettoyez soigneusement les crabes et coupez-les deux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9c4ae208-8d58-414c-90d9-4a7daa9aa360',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  2,
  'Nettoyez les feuilles d’attiéké et tapissez-les au fond de la casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9f75f114-fc84-4f94-ac69-b44c945b262b',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  3,
  'Disposez les crabes sur les feuilles Ecrasez ou mixez 2 oignons, 4 tomates fraîches, 3 gousses d’ail et 3 piments frais jusqu’à obtenir une purée fine',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '72316e8a-c70a-45c6-9d12-defc0f73e673',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  4,
  'Assaisonnez et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '26317416-0415-4739-b898-1371f4468dc9',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  5,
  'Ajoutez un verre d’eau et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3c037c3b-7b04-4caa-944a-233beb1f3ebb',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  6,
  'Versez le mélange sur les crabes avec un peu d’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '347b8cf7-00e9-439f-b33e-46b63bf5b0e3',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  7,
  'Couvrez et laissez cuire, pendant 30 min, à feu doux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1363cd05-7633-460e-b622-4093cda45863',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  8,
  'La sauce aubergine : Faites cuire, dans un ½ L d’eau salée, les aubergines avec les légumes restants (1 oignon, 2 tomates fraîches, 3 piments et l’ail) pendant 25 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '261d84bf-2e99-445c-88d4-2e318289de3d',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  9,
  'Une fois cuits, retirez-les puis mixez le mélange jusqu’à obtenir une purée lisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b00fdab2-8fc7-4d06-b6f1-b931c3bd7153',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  10,
  'Mettez la purée dans le fond d’eau qui a servi à cuire les légumes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7e56b310-9ed7-480d-85ec-b9f2bde33ef1',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  11,
  'Assaisonnez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'cca8c500-a677-47a9-94d5-63d478047ae1',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  12,
  'Laissez cuire, 10 à 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5c867da2-d135-4424-8e64-e3b9873566bf',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  13,
  'Rectifiez l’assaisonnement à votre goût',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '73c8270f-9b19-472a-985a-33ebaaa809b9',
  '12c7a59e-4d09-421e-a073-bbfa1c87dec3',
  14,
  'Servez avec du foutou de banane.',
  NULL
);


-- RECETTE 28: CRABES BRAISES 225
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'CRABES BRAISES 225',
  'Recette traditionnelle : CRABES BRAISES 225',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f2313229-0941-4aa4-aab2-3c6a354d40c2',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'crabes',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '82c5ea4b-7db5-4163-b6bc-f89443c46950',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bdd70128-0de8-44f3-b681-7b07d2d081ec',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'tomates fraîches',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9c59bc97-e5fe-4250-80bd-d517398653e9',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'kablè',
  'feuille',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a65e7673-1bea-4ae9-9b25-cae70f3ba86b',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'piments secs',
  'pièces',
  10,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ac3f5f5d-8e4f-4849-b893-7dd6bc29ecb3',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'persil',
  'brins',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bbd17b86-245e-4e36-83c9-8adb558a5a47',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'd’huile',
  'cuillère à soupe',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dd673924-e3a3-47b0-8973-585ff7ea0fd3',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7681a9b7-7a10-4876-a9e0-32c724f7bb18',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '65fab975-4e1c-4054-aa3f-2e3f841999bf',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  1,
  'Nettoyez les légumes, le piment sec et le persil',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7fb1d527-772d-4c80-9d74-717204fc1d80',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  2,
  'Mettez-les dans un mixeur et ajoutez-y la feuille de kablè',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5392fa8b-fc61-41fe-9c7b-b6ce7116bc0b',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  3,
  'Ajoutez l’huile et mixez le tout jusqu’à obtenir une purée lisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '210bd47b-40d3-45c1-939d-19c3e5856930',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  4,
  'Assaisonnez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4e173996-7272-42da-b06e-9e4a1bbffad9',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  5,
  'Farcissez les crabes préalablement nettoyés avec la marinade et laissez reposer, 20 min, au frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '07e841dc-4cf2-421f-98d6-2ede8fe37a51',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  6,
  'Disposez les crabes sur un barbecue traditionnel ou électrique et laissez-les griller, 15 à 20 min, à feu doux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'abbb829c-3568-405d-ae66-84831e0853b0',
  '744ca136-bc7c-4480-bd71-e50562a337fb',
  7,
  'Garnitures : alloco avec une sauce pimentée à la moutarde.',
  NULL
);


-- RECETTE 29: GRATIN DE CREVETTES A LA BECHAMEL
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'GRATIN DE CREVETTES A LA BECHAMEL',
  'Recette traditionnelle : GRATIN DE CREVETTES A LA BECHAMEL',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b0e0f78d-75da-4a4a-8018-9083befbd4ed',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'crevettes fraîches',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1b3a0b80-8d07-41b7-89e3-7f062bf67be7',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'Pour la marinade des crevettes',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '303a48a3-ee27-4a2d-ab90-07a4bcac7be2',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'persil chinois',
  'brins',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '177fc198-5675-4716-a5f9-b9a02c8a5416',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'd’oignon',
  'feuilles',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd50327c5-fe19-4d01-8add-5400f30c56f2',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'd’ail',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f374f34a-9c4e-4446-966e-333930122d00',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'piments frais',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b8c06fc8-ba0b-4d88-b755-b8b15f2f36b3',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'gruyère râpé',
  'g',
  300,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dd58d3e4-a82c-4244-954d-843733db0087',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'œufs',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3d40449a-a12c-4b5d-bc67-bc30b65ea862',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'farine',
  'g',
  30,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '716c408a-26ac-46ef-867d-c0c4d698517a',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'beurre',
  'g',
  30,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '95f76189-279a-4121-b5a4-ce8112a88ae1',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  '½ L de lait',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5fe4219c-3ef5-4d15-ad73-e96b4e44ec23',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'noix de muscade',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '542cbe56-968f-405f-b48d-2298761e2ac7',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'beurre pour le moule',
  'g',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4e72b27c-d299-4ff9-bf71-5e39d147022f',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'œufs battus en omelette',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3bb13092-339c-48ea-943e-64402ab2a604',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '12d955f9-8d2e-4c1b-a545-7910421df164',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3a0ed8cd-6669-4822-b1e1-7795cefc1d4d',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  1,
  'Lavez les crevettes et décortiquez-les',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd758c2c2-467a-422b-b302-8e813af9465b',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  2,
  'Mixez le persil, les feuilles d’oignon, l’ail et le piment',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ab23aa1f-531c-4ca5-b512-1ab4ef82b45a',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  3,
  'Assaisonnez et mélangez bien le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7d3ea6fb-33f1-47eb-9d28-e40678d554b2',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  4,
  'Trempez les crevettes dans cette marinade et laissez reposer, 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5c2d305b-ab6e-4fd3-8d53-fea896de4b44',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  5,
  'Pour la sauce béchamel : Dans une petite casserole sur feu doux, mélangez le beurre et la farine',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c7c361a0-5267-4123-90af-14220eb54365',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  6,
  'Ajoutez le lait froid en une seule fois',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '91dee63c-2267-4961-8df3-6e6cc95a5f4f',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  7,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2baa13eb-1ec5-4299-80b8-b1861926d871',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  8,
  'Ajoutez une pincée de muscade râpée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'faad1e0d-40f3-4578-861d-33441369c557',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  9,
  'Portez à ébullition sans cesser de remuer avec le fouet',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a09e9bd3-fb81-4b8c-bd16-64c8904a4f96',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  10,
  'Laissez cuire une dizaine de minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '052336b0-efc6-4659-a81d-9a53e298b3a7',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  11,
  'Remuez de temps en temps',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '09fcc331-8537-44ef-8912-ed1c3ef6845f',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  12,
  'Ajoutez-y les crevettes et laissez cuire, 10 minutes encore',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '605ba4a2-ce62-4940-a70d-4b980d1887d0',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  13,
  'Dans un plat à gratin beurré, répartissez la béchamel',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5ae7e24e-ddac-4253-92a2-ec05e49d0388',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  14,
  'Ajoutez les œufs battus en omelette et finissez avec le gruyère râpé',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0c9277bd-c9f0-4874-8b0f-e4efbfc12d88',
  '2dcda3c9-2a38-4d99-92aa-3ed925c71b81',
  15,
  'Faites gratiner la préparation, à four chaud, pendant 20 minutes à 160°.',
  NULL
);


-- RECETTE 30: BEIGNETS AUX CREVETTES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'BEIGNETS AUX CREVETTES',
  'Recette traditionnelle : BEIGNETS AUX CREVETTES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1a91c354-16be-473a-911c-e0a6c8fd87af',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'grosses crevettes crues',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '51ff801b-ae30-47a9-8094-0c92057047f7',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'œufs',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e59375ce-f6b0-46f8-9ff3-19a9ffcf4e39',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'Une pincée de sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9792543c-c23c-49da-aaf9-55d824e130c8',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'farine',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '564b8cab-fdc5-4da7-a5a5-22510af8dc62',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'levure chimique',
  'sachet',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a1ac0e69-cdf7-4e52-8cd5-b4127aa8af89',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'd’eau',
  'cl',
  15,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7ca299ab-9f62-4db5-8555-8622c790e70d',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  '½ L d’huile pour la friture',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dd8cfef1-9e8d-4712-9615-6fdef86b4693',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7a86865d-cfb6-40b4-8da8-5008e929a678',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'poivre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4fa7b9fc-922f-4669-a9ea-8823b8e69793',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'sauce de soja',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dda1b528-64d8-4dd7-8bdd-5339e90c1732',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'gingembre en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a3e3815a-48ee-4ca2-b019-79222c9eb885',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'persil',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a9d2bcbd-962b-41d2-b9f3-e3d847510ecf',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  'd’huile',
  'cuillère à soupe',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'be293ec5-a62c-49e4-8e54-7c8418853834',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  1,
  'Pour la pâte à beignets : Battez les œufs en omelette avec le sel et le poivre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '790c0c67-9092-4af0-9c3e-cf42181fdeea',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  2,
  'Ajoutez la farine, la levure et l’eau ou le lait jusqu’à l’obtention d’une pâte homogène et fluide',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ab860365-2ff0-4f1c-a023-dbdbb262f48b',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  3,
  'Cependant, cette pâte doit être encore assez épaisse puis laissez reposer, 30 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4fcc8c25-ee7a-46c1-8b12-4655bfa98c1e',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  4,
  'Pour la marinade : Dans un plat, mélangez la sauce soja, le gingembre, le persil et l’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b6f4820d-9bf3-4dd1-b806-297af6971afc',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  5,
  'Décortiquez les crevettes en laissant les queues',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a285bc9d-0758-491a-9c80-122089a589ef',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  6,
  'A l’aide d’un petit couteau pointu, pratiquez une incision le long du dos et ôtez l’intestin en forme de veine noire',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a990674d-27a8-42b0-83c9-02d4dd3b17d3',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  7,
  'Rincez les crevettes, séchez-les avec du papier absorbant et mettez-les dans la marinade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eaae693a-4b8c-4f51-9720-bcf52e8d5c89',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  8,
  'Mélangez, filmez le plat et placez-le, 30 min, au frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0747ffdd-3412-4316-9073-33cc43a03518',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  9,
  'Passé ce temps, égouttez les crevettes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd9511c5d-6c94-4e8c-873a-1128c87747e7',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  10,
  'Mélangez de nouveau la pâte à beignets au fouet',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e28219f9-7461-4acc-840b-eaa566fc4fc2',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  11,
  'Faites chauffer l’huile de friture',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1441a792-347a-4bec-9566-733727869e3c',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  12,
  'Lorsqu’elle est à bonne température, enrobez les crevettes dans la pâte à beignets en les tenant par la queue et trempez-les dans la friture par petites quantités',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ec3b997a-dd08-4b9a-8c04-a1b196ec9909',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  13,
  'Lorsque les beignets sont bien gonflés et dorés, retirez-les avec une écumoire ou une araignée et posez-les sur du papier absorbant pour les égoutter',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f736136b-a3c6-470f-bd61-f58760bf251e',
  '6049dc7e-1de3-4db4-8dea-f0786e7e5c31',
  14,
  'Servez-les chauds avec de la sauce aigre-douce, pimentée à l’ail toute prête et disponible dans les supermarchés.',
  NULL
);


-- RECETTE 31: CREVETTES CREOLES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'CREVETTES CREOLES',
  'Recette traditionnelle : CREVETTES CREOLES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '63f71587-cfb3-4517-84b0-02822b3e2460',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'crevettes roses',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b39549cd-8459-420d-93ca-ba064422e6c5',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'citron vert',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '66d8f254-b0fa-4f05-a7a4-2200f5de912c',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2212185f-dfe7-4703-8399-bda5cade5b12',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'tomates fraîches',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '100152ac-c565-4bc3-9345-f22086499746',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'd’ail',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ede117c8-7a9c-4ba0-8662-3529ccd45bd7',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'crème fraîche',
  'cuillère à soupe',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f4a67187-0a40-45a9-b88e-3ac9b7681826',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'laurier',
  'feuille',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd4c486a6-e6a4-41ab-84d4-3bdbe3172046',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'persil',
  'brins',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '879e3ccb-0db3-4345-bc5f-2be6c21e8615',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  '¼ d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6960e065-eb8a-4daa-a61b-621974346b25',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b34e91af-5de2-4344-9aec-31a44d1bde3b',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '23a1c077-2242-4b6d-a38c-9e50b129798a',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  1,
  'Enlevez la peau du citron à l’aide d’un économe et émincez finement l’écorce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '43aceba3-ddb5-4bbb-aa14-44e096c2fd42',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  2,
  'Pressez le citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd9b37227-ee78-4107-af3e-75a4e0113a6e',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  3,
  'Emincez les oignons et faites-les blondir dans l’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a26e2cea-2653-4790-913d-e35d93565611',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  4,
  'Ajoutez les tomates coupées en dés, l’ail coupé en petits morceaux, le persil cisélé et les zestes de citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9e921688-4413-4256-9adb-fe89337fb7b1',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  5,
  'Salez, pouivrez et laissez mijoter, 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dc1d7202-4932-46f4-b88b-bb1bbda5da48',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  6,
  'Ajoutez la crème puis les crevettes et le jus de citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3ba1854a-cabd-44d5-9b0f-ec0c76f77848',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  7,
  'Rectifiez l’assaisonnement et laissez chauffer, 5 min, à feu doux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '90a63ba7-9d0f-4ccb-aecb-99ae3be3186b',
  '5df0bdf5-999d-4c37-95d4-e6117bf973bd',
  8,
  'Servez avec des pommes sautées.',
  NULL
);


-- RECETTE 32: BOUCHEES DE CREVETTES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'BOUCHEES DE CREVETTES',
  'Recette traditionnelle : BOUCHEES DE CREVETTES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1c5bed67-976e-48c8-9731-92096dddbb14',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'pâte feuilletée de 200 g',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '497ad77f-8bf9-43b2-81ca-de2c4bcbcfa8',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'échalotes',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6520420c-4e76-415f-a4bb-b7af75d60639',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'd’ail',
  'gousses',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ef8083dd-4fa5-4028-9880-835ff726f45e',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'germes de soja (facultatif)',
  'g',
  20,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '152404e1-8157-4771-a117-9eeb9d5df0cd',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'sauce de soja',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1791dcd2-9156-44e1-b7d5-7d6f72c3bf84',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'coriandre',
  'brins',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7693b71e-0cc1-46f6-92b4-6a3c25d61fdc',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'gingembre',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd676d2a1-8d68-4af9-a571-698caa35f1cd',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'carottes',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f4c309fc-d72e-48ba-a96f-8a3614e9c240',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'sucre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6af20b9a-b1d6-4d4d-a32d-d59dafd3bc0c',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'crème liquide',
  'ml',
  50,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '76a0dae7-ab67-4de4-9702-648d9c7e1dd1',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6265fe52-0163-44cc-a050-2842f7a38a82',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4f3a248f-0203-4a4c-9585-ed11577005be',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  1,
  'Pelez les échalotes et l’ail',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f3f51c75-981e-4856-b0de-654c91abc025',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  2,
  'Pelez et râpez le gingembre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7e6cecc0-9b78-4057-b2bd-f4c6c422a7e7',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  3,
  'Décortiquez les crevettes, hachée l’ail, l’échalote, la coriandre et la carotte, coupez les crevettes en dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '08c1dec8-d2c1-46f7-b65f-4ecba58732de',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  4,
  'Ajoutez à la préparation le gingembre râpé et la sauce soja',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1d9f2d84-dfea-406f-b14f-6a19d91e954b',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  5,
  'Mélangez bien le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8e0c53f4-6d7d-4dcb-a961-34cb9b5a9b14',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  6,
  'Coupez des petites formes rondes dans la pâte feuilletée puis les cuire à 180°C pendant 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ee7989d9-13aa-4e2c-8fae-7cb1aed02d18',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  7,
  'Faites revenir tous les ingrédients puis ajoutez la crème et laissez cuire pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1bb53f83-9b28-4e50-8e90-885d08afd069',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  8,
  'Assaisonnez et réservez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'deee60d5-49a8-474c-a401-7ac0376ce3e0',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  9,
  'Coupez une partie du feuilletage puis déposez une grosse cuillère à soupe de préparation (la farce de crevettes) sur la pâte et refermez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a32cbac0-c4c4-4b2d-bcad-de59220b6ce0',
  '20a963c3-4cb6-46ae-8722-eeba83f15e9a',
  10,
  'Sur les assiettes, déposez un peu de crudités, ajoutez les bouchées, une feuille de coriandre, servez aussitôt.',
  NULL
);


-- RECETTE 33: CREPES SALEES AUX CREVETTES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'CREPES SALEES AUX CREVETTES',
  'Recette traditionnelle : CREPES SALEES AUX CREVETTES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '09b1850a-607f-4fe6-a821-f0c5e2b1b8f4',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'farine',
  'g',
  175,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '90af606d-ba3f-47cb-8be9-624a1a94f5b9',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'œufs',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2639d9f8-ca2a-43b3-9d62-da069725f04b',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'sel',
  'g',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '13db2709-7455-4e0c-b076-a29f403403e2',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'd’eau',
  'ml',
  65,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e3b114bb-ae03-4382-a811-5fdd1c01ae64',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'lait',
  'ml',
  315,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a610d6e6-b342-445c-bb5d-5410e8bdf88a',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'beurre',
  'g',
  60,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2400b041-501e-473e-ba27-ea210e8fc96a',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'farine',
  'g',
  30,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '065d0d02-2d09-40c7-95b4-9a4d3f3c9de1',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'lait',
  'ml',
  375,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3aec5cbf-71d6-489c-bb54-de76807020ba',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'crevettes fraîches',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'dc7d55b9-8ee9-4adc-b303-b71c821fb861',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  '¼ L d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '04dfa5dd-95ab-40e9-874e-68a6e88d6ad7',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4d31aa91-6936-4c6a-9c04-19b5bede9544',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'gruyère râpé',
  'g',
  150,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '46dbd072-dc5c-429f-b80b-3623e52286ee',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'beurre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a6e59275-0416-4f2b-8aec-242606d4de42',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a403d10c-c584-4e06-ad48-6452ef220576',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ed7ff5f4-33ec-4d39-8779-b6b52143c731',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  1,
  'Pour les crêpes : Mélangez la farine, le sel et l’eau pour faire une pâte fluide et terminez avec le lait',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f43b9e7e-1455-4777-ac3e-835c3e661761',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  2,
  'Mélangez bien le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ab4af0d0-1e8b-4d35-84ff-136faeeece30',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  3,
  'Laissez reposer, au froid, environ 1 heure',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a1d1467c-182a-4d31-87a9-0819f21c7c00',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  4,
  'Faites cuire chaque crêpe, des 2 côtés, dans un peu d’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f4df0e0d-507b-4efb-8c3a-3b93f5a79413',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  5,
  'Pour la sauce : Faites fondre le beurre dans une casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'bfc67ee9-d871-4220-8de6-1fd00abb4751',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  6,
  'Ajoutez la farine délayée dans un ½ verre d’eau et laissez cuire 2 à 3 minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '274e3a2e-0867-47be-8131-229df8ae24b8',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  7,
  'Versez-y le lait chaud en remuant progressivement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5e4cf634-d471-4bbb-b0f3-7a8b6e304dbc',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  8,
  'Laissez cuire pendant 15 min et assaisonnez au goût',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '49e110e9-6108-41a8-a33c-b55e8d88118b',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  9,
  'Faites sauter dans une poêle de beurre les oignons émincés et les crevettes pendant 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5139684d-eb0d-40c9-8d73-fee4c864f12d',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  10,
  'Assaisonnez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c9c6333f-9b55-466e-8921-a6316a16a02e',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  11,
  'Ajoutez cette dernière préparation à la précédente et mélangez bien le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '51b779d4-0b53-4c34-a908-c473a5cb439d',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  12,
  'Garnissez chaque crêpe de 1 à 2 cuillère(s) de crevettes en sauce et roulez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9fa6b627-c39f-4f10-80c6-d9b6a85e6cb8',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  13,
  'Disposez-les dans un plat à four, saupoudrez-les de fromage râpé et faites-les gratiner 5 à 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ac4df5d4-31ca-4e3d-99a2-9f0c7ee4c520',
  'b2d3c298-0721-44e5-b7ee-ddf98cc6b1cd',
  14,
  'C’est prêt !',
  NULL
);


-- RECETTE 34: CHOUKOUYA DE GAMBAS Les Gambas
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'CHOUKOUYA DE GAMBAS Les Gambas',
  'Recette traditionnelle : CHOUKOUYA DE GAMBAS Les Gambas',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1aab5556-5f89-49f7-8112-07f5668daf87',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'gambas',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1b075346-92a0-43cb-b603-ad8919003f7b',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'tomates fraîches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6b5c72bb-f879-467a-bdb2-19c5d1717286',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8103e1d8-0c5b-4820-bbf1-2b2548426beb',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'piments frais',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '11d5e0a0-4ad5-4005-9817-776183c5f3d9',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'd’huile',
  'cuillère à soupe',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '88f08c93-bf8e-4d7b-a3cf-5d6cd7b2f28c',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'piment en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '161bd8b8-128a-496c-a712-f2791da3781e',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'poudre d’oignon',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a3c966bc-f2ac-46ad-9231-3aefaf42b51f',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'kankankan',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e7f059bd-44b3-4906-bbda-6d4a5c96224e',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4ea960a2-3c66-45d8-abab-5e0bf5bf9e7f',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  1,
  'Nettoyez les gambas',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b7c57b29-3feb-4050-af7d-2933616abce8',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  2,
  'Mettez le piment en poudre, la poudre d’oignon, une partie du kankankan, 3 cuillères à soupe d’huile et le sel dans un bol',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ca5003c5-fac2-41ee-a3d2-3ef02240003e',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  3,
  'Mélangez bien le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c3d2ef1a-f6b2-4006-8c45-bc5a2f6b4043',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  4,
  'Trempez les gambas, dans la marinade, pendant 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2a75dc36-b1e7-4181-b032-fd6b13fb18f3',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  5,
  'Coupez les légumes en gros dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9e51095e-3581-4ca9-a9f4-5f21ec97b4f5',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  6,
  'Badigeonnez la grille d’huile et disposez-y les gambas',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ff3ee443-1834-4909-a174-9729e7780443',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  7,
  'Laissez cuire 5 min en retournant puis ajoutez les légumes en gros dés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd5d22165-b81a-4950-97f2-d2616d80d500',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  8,
  'Ajoutez le kankankan et l’huile restante',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '99e25b0e-6b14-412d-90d1-7907e13550c6',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  9,
  'Laissez cuire, 15 min, en mélangeant de temps en temps',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1a50f206-8d56-4556-b176-3d9e54b77cac',
  '11f05e00-579c-4ce9-b454-25354d2ff72e',
  10,
  'servez avec de l’attiéké.',
  NULL
);


-- RECETTE 35: GAMBAS A LA CREME
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'GAMBAS A LA CREME',
  'Recette traditionnelle : GAMBAS A LA CREME',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd6663318-b13b-4bb2-beb0-77579ced0515',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'gambas',
  'g',
  600,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f5f32a6f-9db9-4879-8304-4c4163986016',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'crème fraîche',
  'ml',
  250,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '70c314f1-7f86-4251-a5c1-eb6a0db1675c',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7d2f9ec0-f501-4be8-9c4a-786810aa2c4d',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'd’ail',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '72e2a60d-d270-43d3-a420-6f96617bbf09',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'curry',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1c12aea4-2806-41c0-9cdc-0e5c5c8de82b',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'piments frais',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b935560a-aa63-4314-9313-ab5ecedbc7d4',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  '¼ L d’huile',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8abac291-2e5f-4d86-9e72-6c793e1f79d4',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8acde562-f990-4775-aaa8-10e1ee788058',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c7b15413-1cc7-4927-8e0b-6199f021b886',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  1,
  'Commencez par décortiquer les gambas',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f9021805-301e-4826-9fcb-2530c8be5038',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  2,
  'Faites revenir les gamas dans une sauteuse avec le curry, l’oignon émincé et le piment frais, dans 4 cuillères à soupe d’huile, pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '57740bef-f7ad-4127-84fb-460f4b2a0f68',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  3,
  'Une fois dorés, rajoutez la moitié de la crème fraîche et laissez cuire, à feu doux, pendant 10 min.salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8fd23cf0-5b15-4be3-8ece-e42696a965cb',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  4,
  'Mettez les tagliatelles dans l’eau salée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b553675a-9835-4f19-bf0f-42d086ea1204',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  5,
  'Une fois cuites, égouttez-les et rajoutez-les aux gambas',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '284670eb-f360-4ea5-a40d-d9dafcf044de',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  6,
  'Rajoutez la crème fraîche restante',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fd60bae9-f601-4d01-b4c5-77b2ea2d8d1f',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  7,
  'Goûtez et rectifiez l’assaisonnement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c0b709dc-fc20-43c2-aa23-2f12bc17ab1e',
  '58f768fb-29a5-42db-a7a8-8806106fe258',
  8,
  'Laissez mijoter, 5 min, avant de servir.',
  NULL
);


-- RECETTE 36: CROUSTILLANTS DE GAMBAS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'CROUSTILLANTS DE GAMBAS',
  'Recette traditionnelle : CROUSTILLANTS DE GAMBAS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2e3aca32-caa9-4f23-af74-691d543956dd',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'grosses gambas',
  'pièces',
  16,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ad44ac78-92e8-4447-bd00-4f3dd02c698f',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'rectangles de pâte feuilletée',
  'pièces',
  16,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3e99ab0e-7561-4375-b710-bda12b99c3fe',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'persil ciselé',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8075b6c5-0874-4c6d-b43f-12e31cb09e11',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'gingembre en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '528a6c37-528f-4117-b13d-838fdf6d79d5',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  '½ L d’huile pour la friture',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd9beeb60-82fb-4962-9879-ce55367976a5',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'citron vert',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b2c4a70b-6393-40d8-97af-fc94dead3f46',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'cf4cae29-8ec3-43d9-a768-d76d9e04f5de',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'poivre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6d8a4800-62e6-4db2-8104-053e5b41307d',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'Egouttez-les sur du papier absorbant.',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '67ec9398-5e78-4032-93f7-86754d183781',
  '7f6c6e32-836f-4505-9dca-24dfc3a44764',
  'Dressez les gambas sur une jolie assiette et saupoudrez-les de persil haché.',
  'unité',
  1,
  NULL
);


-- RECETTE 37: RIZ AUX GAMBAS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'RIZ AUX GAMBAS',
  'Recette traditionnelle : RIZ AUX GAMBAS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f2d3e517-d02e-474d-bd70-17202343d7c1',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'riz Dinor',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5957d7fa-1d09-4914-b1f6-5142ca4fa017',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'gambas',
  'g',
  500,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '97aca7f6-0810-43f4-896c-58db4cce3466',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'poivron rouge',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b7213973-ba0e-42fd-80c9-c2725b37a5c9',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'petite carotte',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8e0b9187-da42-4be8-bfb7-4a87f16ada03',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '80121d3c-cf97-445c-9e0c-572e90c28a14',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'd’huile Dinor',
  'ml',
  40,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '18bde6b2-3bb9-4dc9-b67d-19d147b62f5e',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'petits pois',
  'cuillère à soupe',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2e5f5c8c-7ff9-4e65-9f0a-3512796a9f7d',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'persil ciselé',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f7c87bc0-86c6-43a1-aa41-54ce5f18c459',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'd’ail haché',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f7287a8c-55c8-47c0-97e8-4696e11a545d',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'sauce soja',
  'ml',
  45,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'df781f00-98cc-4df0-95ba-e62eea3348e5',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '76e5b904-8d17-47ec-8b4a-98562c42e5f5',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '87cf79b9-f0ea-41c0-bb2c-c8f0482aef57',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  1,
  'Faites cuire le riz comme vous avez l’habitude de le faire',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '128b757c-0304-4878-a4a7-5588a6227061',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  2,
  'Coupez le poivron et les oignons en cubes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '42f5119c-4a52-480e-9c8c-bd430e1bbba9',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  3,
  'Pelez et coupez en cubes la carotte',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0f964537-0be6-4a91-b32e-e0c8126d4704',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  4,
  'Dans une poêle, chauffez l’huile à feu vif',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a93a2f0d-be56-403c-b893-1f7b3411cacb',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  5,
  'Saisissez le poivron, l’oignon et la carotte deux minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9f2b34ff-588d-426c-ba8b-0b74a4a07fcf',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  6,
  'Ajoutez les gambas, l’ail, le riz et la sauce soja',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dc09dd8d-619c-4167-b372-92a359a972f9',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  7,
  'Chauffez de 3 à 4 minutes, à feu vif, en remuant',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1027e04a-04e3-4ad6-922c-f9efc182b511',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  8,
  'Rectifiez l’assaisonnement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '521b0a6f-8754-4919-984d-5a6472291c23',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  9,
  'Au moment de servir, ajoutez les petits pois et remuez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c31700bc-b8d1-429c-a590-2aea2c3d1bcf',
  'c67fb18c-8f4e-4a92-b518-f51fd002920f',
  10,
  'Saupoudrez de persil ciselé.',
  NULL
);


-- RECETTE 38: PRINTEMPS AUX GAMBAS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'PRINTEMPS AUX GAMBAS',
  'Recette traditionnelle : PRINTEMPS AUX GAMBAS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'daa0f128-dc21-46c2-9772-b55e82e69729',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'paquet de feuille de riz',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b4dea4b1-493b-4ed9-a33e-c348e485f0c5',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'paquet de vermicelles de riz',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bb843f34-6f1f-4241-b38e-24c63b910303',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'queues de gambas cuites',
  'g',
  300,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e9dc16aa-67eb-40e7-9c43-617bf8f4ec08',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'Des feuilles de salade',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd1299295-cc03-4743-b530-55b977e9dd87',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'persil ciselé',
  'brins',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7ea1be2a-4881-4778-a014-3e0da3d44efa',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'menthe ciselée',
  'feuilles',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1e410194-aad4-4058-9893-c0ce3cae595c',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'carottes râpées',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'deb6c5f8-58b6-41f9-a5c2-d3cb777c18f2',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c50a1d82-e0ed-4481-a8a1-d141a9885376',
  '7a431160-a765-46bd-a76b-2c39e9f03c69',
  'poivre',
  'unité',
  1,
  NULL
);


-- RECETTE 39: TARTARE D’ECREVISSES, les écrevisses
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'TARTARE D’ECREVISSES, les écrevisses',
  'Recette traditionnelle : TARTARE D’ECREVISSES, les écrevisses',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '37e60d59-13a5-4d58-8f1c-a11ab2620c0f',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'chair d’écrevisses cuites et hachées',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0947f5b9-2677-4513-9d69-3c356692b36c',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e341297a-3c3b-493f-88af-d7149d2f10ea',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'tomates fraîches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '16103c04-7c3e-475d-b1f7-3ee9a94137de',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  '½ cuillère à café de piments en poudre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b2704c47-0db9-4dc1-95b6-87d31696218c',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'ciboulette',
  'botte',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'daf6ca35-cc19-46eb-8a38-a4dab5d3efef',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'jus de citron vert',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '52bb0267-a462-48ed-8d2e-1292bf71aeb6',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'persil',
  'brins',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'cf35244a-2024-41a9-8fb4-e9c2cc490ed0',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'moutarde',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f44e845b-b6d2-402a-82ce-e9eb1ee88686',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'jaunes d’œufs',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '805970a9-aa8c-43a6-856d-ca70a0e8d1e6',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'd’huile',
  'ml',
  250,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '94de12b3-654a-450e-8830-9330a2237ca2',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6c6f0f27-15b7-4cfe-be75-c0b3c965bb4e',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5f967d9d-da17-4467-bec1-19739698a760',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  1,
  'Réalisez une mayonnaise en mélangeant la moutarde, le jus de citron vert, rajoutez 2 jaunes d’œufs et fouettez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ecad1e8c-27e9-45de-b39e-adc6f3379704',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  2,
  'Ajoutez ensuite l’huile en mince filet continu puis, dès que la mayonnaise prend, augmentez le filet d’huile',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f4eb75f4-a250-409b-ba58-d69b25f9ae06',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  3,
  'Ajoutez à la mayonnaise, le persil et le piment en poudre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5eddddc3-1f7f-4814-afcb-df77e78509b3',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  4,
  'Assaisonnez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f8258bc9-483f-4de3-99bb-d2d4658657fb',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  5,
  'Emincez l’oignon, la ciboulette et les tomates fraîches',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ea44f945-8e78-4e3f-a5d2-eadd09a4f279',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  6,
  'Mélangez-les à la chair d’écrevisses',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e61c2533-ca7e-4f56-9ab4-1c5001ee0cb3',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  7,
  'Ajoutez la mayonnaise aux écrevisses et servez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '448e836a-8409-48c6-b062-b85b9d617749',
  '1fba80bc-d5fc-4d0e-a6e2-9f6afcf7d1e4',
  8,
  'Conservez votre tartare au frais avant de le déguster.',
  NULL
);


-- RECETTE 40: GUACAMOLE D’ECREVISSES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'GUACAMOLE D’ECREVISSES',
  'Recette traditionnelle : GUACAMOLE D’ECREVISSES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6fe20cb9-683b-492a-a601-4e417a612eef',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'queues d’écrevisse (sous vide, telles que les crevettes décortiquées)',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '74bc4f06-780d-46f1-bf4d-c3db5568f2f5',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'avocats bien mûrs',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '71d1feb3-ac76-49a2-828a-d8ca627af5eb',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'gouttes de citron',
  'pièces',
  5,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '905c0076-22ef-46a0-b3e7-91efc6a4924f',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'crème fraîches',
  'cl',
  25,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '62ec1d6c-ac6e-4816-8707-ff849d1ae568',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f2ab3923-25fc-4e48-9d3b-18b9c28a0536',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  1,
  'Ecrasez la chair des avocats',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ed9fb35e-3bd4-4d69-8846-31c51ece302f',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  2,
  'Ajoutez quelques gouttes de jus de citron pour éviter que le mélange noircisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '89497d4b-359b-4039-9f9c-f4987c43dd02',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  3,
  'Assaisonnez et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5cd33288-77bf-4c91-9164-06110a022fe3',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  4,
  'Répartissez le mélange obtenu dans le fond des verrines',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5517bb5b-d718-40f6-8232-7717e004010e',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  5,
  'Recouvrez-les d’une couche généreuse de queues d’écrevisses',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0eb409ba-6211-42d4-8fca-01e42ce98f71',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  6,
  'Battez la crème fraîche pour obtenir une chantilly',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ac7b13ea-49de-420e-9d33-90cdf4791ca9',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  7,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e92a1e6e-d4e3-46d3-930c-fd3a43204ffc',
  '9e90bf37-10a8-4222-9b51-4856edb77cf5',
  8,
  'Recouvrez au frais jusqu’au moment de servir.',
  NULL
);


-- RECETTE 41: CASSOLETTE DE MOULES, les moules
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'CASSOLETTE DE MOULES, les moules',
  'Recette traditionnelle : CASSOLETTE DE MOULES, les moules',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5fb7ac1e-977e-4b0b-9e45-efe04dac3a96',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'moules',
  'g',
  150,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fba16ed3-1a75-49a0-b56f-74a2ccf1931a',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'vin blanc',
  'cl',
  25,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4fed5710-b15f-47ff-b080-f325df43c461',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '86bcdecb-7e40-4c02-8945-8f7f426e74ba',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'beurre',
  'g',
  20,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0396769f-8ec8-4f2f-a082-00a63b24800f',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'persil ciselé',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4ff55d1f-5d22-4507-b11b-c00d7c222e7e',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'poireau',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6c22164b-5a74-483a-8fe5-d6c2edc5994d',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'la sauce au citron',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd7451a2b-4b96-4798-8480-902aa4bb0dbb',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5e46e8d2-1437-4f87-bfbd-820eb77cfaa3',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fd8ffe12-ef62-4989-9083-1edf042a8b83',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  1,
  'Coupez le poireau en julienne et faites-le revenir dans 10 g de beurre pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '70357043-bf07-41cb-835f-aef9391f74c5',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  2,
  'Ajoutez un ½ verre d’eau, salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ee1499cf-2911-481a-9245-32be356ff38b',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  3,
  'Laissez cuire, 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3bf8f9f7-18a7-45cb-8394-c4d2d6d4aa8a',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  4,
  'Pour les moules : ouvrez les moules et conservez leur eau dans un récipient',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '80972190-f92c-4144-8c7e-8b1c7059f044',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  5,
  'Décortiquez la chair',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8c0fe5c9-8f9a-4571-af65-78ae05d54cb3',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  6,
  'Dans une casserole, faites chauffer l’eau des moules et pochez-y celles-ci',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '74631573-4154-4fb8-af29-89883269d64c',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  7,
  'Faites fondre le beurre restant et 1 oignon émincé dans une poêle',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5508982c-065f-4388-b80a-9fff0bca5e6f',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  8,
  'Ajoutez les moules et laissez cuire, sur feu moyen, pendant 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6685e0cc-e63c-4b36-bed8-5284bb40da6c',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  9,
  'Ajoutez le vin blanc et le persil pendant la cuisson',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '41470329-ba82-47f2-8140-19c7f85e9b89',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  10,
  'Une fois les moules bien ouvertes, décortiquez-les et réservez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '53646573-4cbd-4bbf-9b9c-67331d5a4275',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  11,
  'Dans les casseroles, mettez un lit de fondue de poireaux puis quelques moules et versez par-dessus un peu de sauce au citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e7fe2b87-cbd9-4a11-b94b-3024459ad6ff',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  12,
  'Passez la préparation au four, pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b08db2c9-767a-49f0-b3fe-bfdd41fea470',
  '6591f398-faab-44ca-b466-cbe72c990a52',
  13,
  'Bon appétit !',
  NULL
);


-- RECETTE 42: SPAGHETTI AUX MOULES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'SPAGHETTI AUX MOULES',
  'Recette traditionnelle : SPAGHETTI AUX MOULES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3c87ab36-6d09-467f-bb56-7a77411b0f87',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'moules',
  'g',
  40,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6743c747-642b-4a6f-b264-5269f66ecb3f',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'd’huile d’olive',
  'ml',
  15,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5c7185cb-aba7-4c6c-a091-e8c2a49182f2',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'd’ail',
  'gousse',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2c3ba004-f2f0-4372-84bd-445cee79da5d',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'piments hachés',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9a1b0592-6edb-4c29-9d32-402c5cb3a202',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'tomates fraîches',
  'pièces',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7b95aca5-d89e-47f7-bb11-a794e897409b',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'persil ciselé',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '10651838-e010-48ec-ab73-cf8575c4a9ea',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'spaghetti',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '77fdebc5-9b3b-4662-813d-d0349bd17d5b',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'sauce tomate fine',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1d863535-ab38-41dd-a5bb-50615c6f087b',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0b193679-b602-41a8-99fa-c2c689b774de',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3b605a40-52c2-4236-82b3-111d54ea9605',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  1,
  'Rincez avec soin les moules, en utilisant une brosse pour enlever tout reste de sable',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3bcec7f4-f98d-49b6-8f2d-8de0485f3d98',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  2,
  'Jetez celles qui restent ouvertes même après avoir été « tapotées » délicatement et qui ne sont plus comestibles',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8bfa9b62-62c9-40a4-80d4-489e2e311068',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  3,
  'Mettez les moules dans une casserole avec un ½ L d’eau et laissez cuire à couvert, environ 7 min, de sorte à ce que toutes les moules soient ouvertes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2d241a83-a59e-4fc1-bb2d-ff78e6b71785',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  4,
  'Chauffez l’huile dans une sauteuse à feu moyen',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2b2e1a3d-9a31-46b4-b5dc-af915b995a15',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  5,
  'Ajoutez l’ail et le piment rouge',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '953806f0-b5ab-4fe6-a3f0-5fa6afafb243',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  6,
  'Laissez cuire, 1 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '39fd1e4d-4020-48e1-892d-9f24b7b4d195',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  7,
  'Ajoutez les tomates en dés, l’ail haché et le persil',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '939ce692-3b83-4e08-865e-e6375e8e4874',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  8,
  'Salez, poivrez et continuer à cuire, à feu doux, pendant 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '26b3fcd0-bc19-4d5d-bcf7-f0902b9bf60f',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  9,
  'Faites cuire les pâtes comme vous en avez l’habitude',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e16a1b67-ac77-49f6-a2f1-7df70b9c8ae8',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  10,
  'Sortez les moules de la casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5f3c04a3-d57c-4300-980a-9f7c0b94ade9',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  11,
  'Filtrez le liquide à travers une passoire pour éliminer tout reste de sable et de coquille brisée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c11e926b-8de9-41e9-a9c5-41357d8b1163',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  12,
  'Retirez les moules de leurs coquilles, en gardant quelques-unes pour décorer',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fe6f3adc-a90c-4be3-b55e-b2d6620bf463',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  13,
  'Mettez toutes les moules dans la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c585eaf1-a443-489a-a2bf-8fd60b734916',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  14,
  'Ajoutez le liquide de cuisson des moules par portion préparée et chauffez le tout doucement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '17888ce8-c171-422f-8f35-203b1ec627f4',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  15,
  'Versez les pâtes égouttées dans la sauteuse, ajoutez la sauce tomate fine et mélangez le tout',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '02f1d22c-d85a-4538-833b-0b03a616500f',
  'fa6490eb-b347-494b-8ee4-c7585e8b9210',
  16,
  'Servez dans les assiettes chaudes.',
  NULL
);


-- RECETTE 43: LANGOUSTE BRAISEE, les langoustes
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'LANGOUSTE BRAISEE, les langoustes',
  'Recette traditionnelle : LANGOUSTE BRAISEE, les langoustes',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9ee0c537-1172-45fc-8a17-38efb44af4ea',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'langoustes',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '11574f1c-0a9f-4a97-9d7f-dbe8f4e60dd9',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'citrons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e9ae2fb7-6cbd-4c97-b3c8-f9e919d8f558',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'd’oignon',
  'feuilles',
  3,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8a05746c-72a1-472c-b8ac-0ee364043876',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7a21e76c-beb8-4750-a1fb-734023a716ec',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'piment frais',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '43bf72e5-e8af-4add-9a00-9e09095403ec',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'd’huile',
  'cl',
  15,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '173c3415-2ea4-46d7-b8a8-337e1c1b50b7',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'd’ail',
  'gousses',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '23ed5de1-50e0-4c10-a93e-50ff06e48212',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'vinaigre',
  'cuillère à soupe',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4facc3ac-2f3d-45d0-8e61-adfc36f2c6cd',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'petit bouquet de persil',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'cca962e9-dddc-4e84-be8d-4020d1907d65',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'piment en poudre',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0531f347-7762-43d5-aa5e-2a32ab8b1198',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '26478d48-6364-4378-a110-42892fe891aa',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  1,
  'Pelez et hachez très finement l’ail, les oignons et les feuilles d’oignon',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '13a5ddc7-3c74-4026-a9e8-e5348c597af1',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  2,
  'Rincez le persil et hachez-le',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4d180d6e-1be0-4c18-ab1e-c0004c587cb9',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  3,
  'Pelez et épépinez le piment, puis hachez-le',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '64e5b623-db7b-441e-a60d-82b9d146d730',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  4,
  'Pressez les citrons et versez le jus dans un petit saladier',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8bfd8478-a17a-4328-aadf-1e04460ffdc4',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  5,
  'Ajoutez tous les ingrédients de la marinade et 5 cl d’eau bouillante',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '41422329-8ec4-4e99-b80d-99f109e944d3',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  6,
  'Salez, poivrez puis mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '37734ba6-62bd-4141-972e-b16d745a4f3d',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  7,
  'A l’aide d’un grand couteau tranchant, coupez les langoustes en deux dans le sens de la longueur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '33c2db5a-8253-45cc-9a7b-fa5cef65019a',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  8,
  'Badigeonnez la chair de marinade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'db895423-ffb8-44c0-80cd-8fa6821e3fce',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  9,
  'Posez les langoustes côté carapace sur la grille de barbecue au-dessus des braises et faites-les griller pendant 10 minutes environ',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '93f9bb71-244c-404d-9ce5-273b98f2a51c',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  10,
  'Retournez-les, puis faites-les cuire, 5 à 8 minutes côté chair, en les arrosant de temps en temps de marinade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '18988e17-fed9-4321-87cf-aa05509cbd7a',
  '5fea72fb-4d6d-47c8-9c89-b70ebc99eb8a',
  11,
  'Servez aussitôt avec de l’alloco.',
  NULL
);


-- RECETTE 44: LANGOUSTE AUX AGRUMES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'LANGOUSTE AUX AGRUMES',
  'Recette traditionnelle : LANGOUSTE AUX AGRUMES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '08b7df25-7510-4406-81eb-8d7fbe3e48e2',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'orange',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '63cd369e-dca0-4cc0-8445-2df3ce4c167a',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'petites queues de langouste',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '78ad6ca9-a866-4a03-bb17-d08b52600bf5',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'd’huile d’olive',
  'cuillère à soupe',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ae561dec-6aa8-436c-aed4-392a4f187029',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'vinaigre aux fruits de la passion',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '104a35b9-0c8a-466d-9b35-3ee50145f95d',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'laitue',
  'poignées',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a4eef756-aa6c-461b-b302-1a77d0559d6f',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'ç soupe de persil ciselé',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '022ae965-a373-43ab-b9bd-b3fa5374218c',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  'Sel',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '512d628c-9288-4d78-b03b-45b5579d08f3',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  1,
  'Lavez les langoustes sous l’eau froide',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5769aca1-3935-456c-b2bd-5ee0f7d52afe',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  2,
  'Blanchissez-les, 15 min, dans de l’eau salée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5196f235-af32-46f5-b481-24757234eede',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  3,
  'Coupez les queues de langouste à l’aide de ciseaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8e33e5c3-a5e1-4890-8f5e-0340e5d249e2',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  4,
  'Découpez les queues en tranches',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f3eb608e-4bb3-48b6-85e4-9fd9cff7c0bb',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  5,
  'Mélangez l’huile d’olive et le vinaigre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '311c69c4-6d46-4efd-b767-0b1ec281a59d',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  6,
  'Mettez une partie de la vinaigrette sur la salade',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4e06cd49-b4f7-4a7f-b8f8-3eda06bb8962',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  7,
  'Pelez à vif les oranges et coupez-les en deux, puis en tranches',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6b428b7f-67c5-4a5f-802a-fa814fd1f3bd',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  8,
  'Déposez les quartiers sur la salade ainsi que les queues de langouste découpées en tranches',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a7f8f3aa-cb1a-4660-91e6-b53baf1093e5',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  9,
  'Versez le reste de vinaigrette sur les morceaux de langouste',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '30a6535e-5bd5-445f-9e82-a0b51ad974c1',
  '4c74ed64-7ed6-42ee-9de2-caf490d31022',
  10,
  'Décorez avec du persil et servez immédiatement.',
  NULL
);


-- RECETTE 45: SOUPES DE CRUSTACES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'SOUPES DE CRUSTACES',
  'Recette traditionnelle : SOUPES DE CRUSTACES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0e150cb1-9b99-4906-96a5-f38d7c34abb3',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'crabes',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '412541af-a7c8-4bfc-92d2-f400d1a863e4',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'grosses crevettes',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '22c5e42c-d44d-4486-918c-b044f26acf54',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'langoustes',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '98832846-ab87-4e6c-a36e-965726e9f61e',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'gambas',
  'pièces',
  8,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '243d3a43-3271-446b-b08b-e8488b93a03b',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'moules',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0e8ce976-f3e1-4471-93ab-46c305815513',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'huitres (facultatif)',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c072391b-5ddc-4837-aec8-fd255a25756b',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  '¼ L d’huile rouge',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '516be26e-3f96-4c50-bde0-d47909e814d8',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'oignons',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9b62bb01-7e18-4b65-94f5-2b6e1e229903',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'd’ail',
  'gousses',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fa572db7-5e84-4862-aa09-a6bd7ea222d8',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'tomates fraîches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3b010faf-90de-4db3-afcf-46b9e757a697',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'piments frais',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '99a68c2c-f44a-427d-a622-418b195e1c11',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'aubergines',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fd6948aa-1a45-44fe-b331-44ecc8b5675f',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd56a9e2a-2c90-400c-9faf-ffdff838fb31',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f2dbee41-4fb1-4c18-b8e0-50a1d2a97ee4',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  1,
  'Nettoyez tous les fruits de mer et mettez-les dans une casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '61078bd5-e7f9-4ecb-8f17-b2ac7bab1213',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  2,
  'Hachez finement l’ail et 1 oignon',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b1ca51cd-be7e-4433-820d-0266e00ab35b',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  3,
  'Ajoutez la purée obtenue, le sel et le poivre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c4d222cc-8ce0-452b-8c3c-e06c841de493',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  4,
  'Laissez mijoter, 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '308068ae-65f9-4d9a-9503-f903c08cb5d7',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  5,
  'Mouillez la préparation avec 1 L d’eau et portez à ébullition, 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b6b0ff64-0377-46bc-a6a8-b75af862da4f',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  6,
  'Ajoutez l’huile rouge et le reste des légumes nettoyés',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f3844ea9-b7aa-4dbd-ac9b-fd7eb456b313',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  7,
  'Salez et laissez cuire, 20 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c9a375d3-e5c3-4732-81b6-5bd8f2b20da9',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  8,
  'Rajoutez la purée de légumes à la sauce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '150cc002-c7fd-4c1c-a1b4-67c07018803d',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  9,
  'Laissez mijoter, 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b076f4ea-3b11-4d55-938c-ccc889b01817',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  10,
  'Goûtez et rectifiez l’assaisonnement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'aa9bcbfd-2834-4571-9d36-809c711b5912',
  'a4be0de3-47cf-4020-ab3a-9195b17bc604',
  11,
  'Laissez mijoter 5 min et servez avec de l’attiéké.',
  NULL
);


-- RECETTE 46: CREME BRULEE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'CREME BRULEE',
  'Recette traditionnelle : CREME BRULEE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6757e823-8da3-48b0-923f-e9e81c1d3e70',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'jaunes d’œuf',
  'pièces',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'eb8ca0f2-b05f-4732-bd39-caaf2fe6898f',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'crème liquide',
  'cl',
  40,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c6001eb4-34fa-49e7-ad2c-18e6424d8638',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'lait',
  'cl',
  25,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd73249b4-8a49-48ce-913f-b154f563f71c',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'sucre en poudre',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6682b9ee-4b1e-4dbf-b7cf-9862a5dcce8f',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  'sucre roux',
  'cuillère à soupe',
  4,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a1ecd74e-8594-4829-a671-935faf1e04ef',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  1,
  'Portez le lait à ébullition pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '64bbea98-0a18-4756-a4f6-1c80474a414c',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  2,
  'Ajoutez la crème et le sucre hors du feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f955a2e3-35f5-4f8c-8dd8-40ea4eeaa06d',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  3,
  'Ajoutez les jaunes d’œufs, mettez à chauffer tout doucement (surtout ne pas bouillir), puis versez dans 4 petits plats individuels',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '47f80a14-d259-42f7-a6e5-5fcb499b4f4a',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  4,
  'Enfournez et laissez cuire tout doucement, à 180°, environ 50 minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '43426aa3-4a7c-46ab-adad-0e36e43b4d81',
  'a895342b-2062-4804-92fb-ff610e1861c3',
  5,
  'Laissez refroidir puis saupoudrez la crème avec du sucre roux et brûlez-le avec un petit chalumeau de cuisine',
  NULL
);


-- RECETTE 47: LA MARQUISE,
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'LA MARQUISE,',
  'Recette traditionnelle : LA MARQUISE,',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ddb44f08-50e7-4463-9c21-a69edb88f3ca',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'vin mousseux',
  'l',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bbeea3d4-804b-48fc-ae51-4773148b6a0c',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'limonade',
  'l',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3f21c9b7-e475-4fee-9a9f-c8e7b2de415b',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'sucre',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd5fa86c4-ebb3-45de-985c-da9695bed068',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'rhum blanc',
  'cl',
  35,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '832408aa-dc4c-418b-baf2-5b8d4319b097',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'oranges coupées en quartiers',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'cb0a7d41-69c4-4ddc-b733-e55ea606b21d',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  'citrons coupés en quartiers',
  'pièces',
  2,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2655dc50-e81c-4e68-9f7a-1e28b095d709',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  1,
  'Dans un grand saladier, versez le sucre et le rhum puis ajoutez les fruits',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1b754c5b-6605-47e1-9ca4-d81e7acc9ddc',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  2,
  'Recouvrez le récipient d’un ^papier cellophane et laissez mariner, au frais, pendant deux jours',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '73f75f88-ddfe-42a2-8711-79827e9483f3',
  '433a8d10-4ee7-4d67-8262-813afe74524c',
  3,
  'Ajoutez la limonade et le vin mousseux juste avant de servir et dégustez votre cocktail marquise bien frais, décoré d’une rondelle d’agrume.',
  NULL
);


-- RECETTE 48: PAMPLEMOUSSES AUX CREVETTES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'PAMPLEMOUSSES AUX CREVETTES',
  'Recette traditionnelle : PAMPLEMOUSSES AUX CREVETTES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '39e6319e-b43c-4e2f-9165-50d9a2e7731c',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'pamplemousses',
  'pièces',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7dc734a5-5dfb-4a5f-94f4-cb73f136fefa',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'crevettes décortiquées précuites',
  'g',
  100,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f9b9c747-eef2-433e-8f3d-f189e96be285',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'tomates',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd5c8cbb7-1ee1-4c2c-bc19-e94abe5c0a60',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'citron',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9b85e97b-7359-4580-bd63-81c8af5c1bd4',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'crème fraîche à 0% de matières grasses',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'fa0ebf37-bf60-41e7-b990-08a6dade2a6b',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'ketchup',
  'cuillère à soupe',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '647004a2-9e98-4026-ba82-110f2c33e0b2',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'persil',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f495414a-488b-4614-b0b5-4163561169ca',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b11663ec-083e-4f80-970a-507f8ce859c7',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  'poivre',
  'unité',
  1,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b0791314-6637-47ba-b611-bdb598f7fc9e',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  1,
  'Coupez chaque pamplemousse au tiers de sa hauteur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c2b33eaa-5be9-4c2d-90d8-16678088270f',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  2,
  'Evidez-les et retirez-en la chair que vous couperez en petits morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1985f24c-997b-4b18-9833-e1110f7e9a89',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  3,
  'Incorporez-y les tomates coupées en dés ainsi que les recettes décortiquées',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f49876d2-467e-4678-9f05-a03d56b9bab8',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  4,
  'Versez la crème dans un saladier et mélangez-y le jus de citron, le ketchup et le persil haché',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5a6607a6-76ff-44cf-88d2-b722bbdff162',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  5,
  'Salez et poivrez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5380cb14-14b0-4945-91ec-a5c4e5cdecbc',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  6,
  'Mélangez bien cette sauce, puis ajoutez les morceaux de tomates, pamplemousses et crevettes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '256a1861-180b-4807-8b86-953da88018b2',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  7,
  'Remplissez-en les pamplemousses évidés ou servez dans une assiette',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2ce3a7bd-c330-4216-aaa7-7cf2b35e49b5',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  8,
  'Servez bien frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3f2621f6-7981-47c7-9050-59690e9f0d7e',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  9,
  'Bienfaits : il préviendrait des maladies cardio-vasculaires en abaissant le taux de cholestérol',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8ae6be99-85bd-4eea-ae0d-102c33874d2a',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  10,
  'Blanc ou rose, le pamplemousse se consomme avec plusieurs recettes surtout pour les plats de cuisine minceur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c7241b5d-b9a5-4b5c-ace3-8ea334f92fe3',
  'a8e2c4e9-ce57-4fe3-bf5d-de6cab658a52',
  11,
  'Le goût frais, tonique et légèrement amer se marie à merveille avec les crevettes.',
  NULL
);


-- RECETTE 49: TCHEP SENEGALAIS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'TCHEP SENEGALAIS',
  'Recette traditionnelle : TCHEP SENEGALAIS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '293ef8b8-819d-4b44-9a51-c085e9ed6ba3',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'poissons frais (Barracuda, dorade, tilapia, etc)',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ca08e952-696f-4c76-b20c-7494636f17a8',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'riz parfumé cassé (le riz siam)',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6094622d-29ca-400d-89e0-a5b9612b5248',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'd’ail',
  'gousses',
  6,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e5a09982-d950-417c-8fbe-cac38aecaae5',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'petit bouquet de persil',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6fbfd324-f2e6-4dcb-a81f-8c1d2f7ea372',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Piments',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b3a767ec-afa6-46ef-81bf-6b1efe2bbc88',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'selon votre goût',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8f34e4be-7f30-4055-93ae-eb3beade1e50',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'poivron',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a608e8b2-0aa6-446d-a037-8648b3cee6bb',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Légumes aux choix (Citrouille',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5e25e51d-ea45-4979-8865-81bb34649008',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Aubergine',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '325a0af0-c5ce-4878-b2fe-f617bd946536',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Choux',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '44107709-f1aa-42e4-ad1e-0ae7ffd24f1e',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Carotte',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '83f9cd86-6ad7-41ea-9505-8b094dbc2286',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Manioc',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2c799079-8293-47f2-a65a-df6e9f068509',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'aubergine blanc)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f6a188a4-2b9a-41be-b913-b4ee7196378b',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'tomates fraiches',
  'pièces',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a7c0c3ac-9ebc-4af6-90e5-04393a33e12e',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'tomate concentrée',
  'g',
  150,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3ee20df7-5378-4994-8497-c51fa37158da',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '18df4597-f996-4088-b3a2-45c12b8e7231',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '94dc43ea-cb2b-4a39-8ad7-93f36e9357a8',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'selon votre goût',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ecf5a4d7-6078-4a9c-9391-61091d23e0c2',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Une Feuille de laurier',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9a6680bb-8885-4f0e-a6bf-e3ef53105615',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Quelques gombos et des feuilles d’oseille',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3e715917-51ef-45ee-a8ec-8ea9fc348345',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'Cube de bouillon (Bio',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bee9f303-af05-4dd8-9bd5-9e94e8f15414',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'fait-maison',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5428ec26-5955-4e47-8441-0fa02281099b',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  'd’huile pour le riz',
  'ml',
  200,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1579941f-2494-4cda-894d-8727e5d7dd6b',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  1,
  'Piler ensemble les gousses d’ail, les piments, le poivron et le persil',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '93a8e33b-0cd2-442f-8535-d5e7e6a988ef',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  2,
  'Bien piler le mélange et diviser le en 2, sur une partie mettre un peu de sel, du poivre noir, le cube fait maison',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'fc4b8833-b57d-40c6-be25-dc033dc6394b',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  3,
  'Faire des petits trous sur les poissons et introduire ce mélange dans les petits trous comme farce',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '738e98a3-fbef-4030-a557-7f4729b548c2',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  4,
  'Chauffer l’huile et faire frire les morceaux de poisson, retirer et réserver',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8d3d5ddd-f43f-471b-894f-cc0fa3c46bac',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  5,
  'Couper l’oignon et ajouter dans l’huile chaude, faire sauter jusqu’à ce qu’il devienne tendre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f3bc986d-d55e-476e-a93a-66e308b6d1a1',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  6,
  'Ajouter la tomate concentrée, les tomates fraîches écrasées et laisser cuire une quinzaine de minutes en remuant occasionnellement',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a2e3f3ad-2d06-4e85-b6aa-2aff005ac8a3',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  7,
  'Ajouter la feuille de laurier, le reste du mélange de persil, un peu de poivre noir, un peu de cube fait maison et faire sauter quelques minutes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '127965a9-cfff-44c4-92cb-538ea0b597a6',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  8,
  'Ensuite mettre les légumes de votre choix (citrouille, carotte, choux, aubergines, manioc, gombo, le piment et l’aubergine), les morceaux de poisson frit et couvrir de 2 litre d’eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3099e487-8d73-40f7-ab0b-b825f88ef3ab',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  9,
  'Laisser les légumes cuire complètement; Après cuisson retirer tous les légumes et les poissons',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5c4afca9-43be-4bce-998b-07a16844c442',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  10,
  'Laver le riz plusieurs fois et le faire cuire à la vapeur une quinzaine de minutes sur une marmite à la vapeur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0ea8cc85-7293-44a8-b4aa-dfc2c5092dd0',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  11,
  'Retirer et mettre de côté',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd5143154-7916-470a-aec7-80cba957a34c',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  12,
  'Retirer une louche de la soupe et garder pour la sauce d’oseille',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c4fc3557-782e-469c-b3f7-929adc2c9103',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  13,
  'Puis mettre le riz dans la soupe, ajouter du sel et du cube à votre goût',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4f7ab179-c3f2-4f5c-b7b0-6ef0da983f40',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  14,
  'Réduire le feu et laisser le riz cuire complètement à feu doux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd186f104-d446-440a-8c7c-98eab43aab87',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  15,
  'Dans une petite marmite, faire cuire les gombos et les feuilles d’oseille avec un peu d’eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4dc1ada9-a2ea-4ba0-99ac-d4bd5702419e',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  16,
  'Pilez le tout ensemble (gombo et oseille) puis mettez la soupe que vous avez réservée avec un peu de sel; retirer et mettre de côté',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '229e6bfb-a322-438c-8c00-27baee393a60',
  '9b1ba803-582a-49b5-9d98-570558d823df',
  17,
  'Servir le riz avec les légumes, le poisson et la sauce d’oseille.',
  NULL
);


-- RECETTE 50: BROCHETTES DE POULET
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'BROCHETTES DE POULET',
  'Recette traditionnelle : BROCHETTES DE POULET',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f6c5a1ef-7ec4-4fd3-bed2-b820c1c68eeb',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'blanc de poulet',
  'kg',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c5faa347-3d35-42cb-99aa-cb38e7982d57',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'Pour la marinade:',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '66a1967c-6a1c-48db-8c51-67e25d3b1b9c',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  '½ oignon rapee',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '29894863-fd1d-438f-803b-1987407737e8',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'd’ail râpée',
  'gousses',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd89987ac-4fff-4648-8942-57c91d25739d',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'Epices au choix:',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6e9b0561-ca14-4301-8dc3-73dfbcd2e54a',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'cc de gingembre en poudre',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '72e27b41-5a71-4d58-85b3-24420755b2b3',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'cc de poivre noire',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a66aae78-2569-43f1-9e54-7feffb950d86',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'cc de paprika',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '08a6f696-57bf-4ed6-9a87-57d4b4a7886f',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  '½ cc de curry en poudre',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6ba0e570-246f-4d92-9800-54c8197f0fae',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'Une pincée de curcuma',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f32f46f3-60b4-401d-9599-856a70436c2e',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'facultatif',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b1109c0f-138c-4816-aa75-1fe1bff59514',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'moutarde',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8dc5b1c8-c4be-4953-afd2-9ff96859b989',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'jus de citron',
  'cuillère à soupe',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5670d9ee-d13a-4f86-b0dc-38279b35c184',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'Sel',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '872caa7d-0512-4f2d-99ea-23ac76677ffe',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'cc de cube de bouillon bio',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '582df0fc-c852-4c09-8923-d24e1c87c351',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  'd’huile',
  'cuillère à soupe',
  2,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'beebf580-5ac6-4c83-b2b1-bf1b53138112',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  1,
  'Dans un saladier, faire la marinade en mélangeant tous les ingrédients de la marinade ensemble',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '91154edd-b946-4891-81af-f3ec2c737e59',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  2,
  'Mettre les cubes de poulet dans le saladier et bien mélanger',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd4f740c5-cf22-48e8-9373-05f47c078609',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  3,
  'Laisser mariner une heure',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '46441da5-a32d-45c2-9d0c-78c00d25c68e',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  4,
  'Mettre le poulet sur les brochettes, vous pouvez alterner avec les légumes de votre choix',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dec80ebc-f199-4dd1-bd80-00b67c1e975a',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  5,
  'Faire chauffer une poêle antiadhésive, déposer les brochettes dessus et cuire chaque côté jusqu’à coloration dorée (5 min environ par côté)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e19b8552-0269-4b64-b9d4-ddbd8b2748aa',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  6,
  'Mettre le reste de la marinade au fur à mesure sur les brochettes (voir vidéo)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9986f0c4-cee8-4163-b2d3-ea19b215a7d7',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  7,
  'Servir avec ce que vous voulez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0e7cff4c-2688-4e7d-8e58-f7ba1ae8637d',
  '89a171b4-659d-4f82-a31a-1ca31e910de6',
  8,
  '^ AUTRES PLATS IVOIRIENS',
  NULL
);


-- RECETTE 62: LA SAUCE FEUILLE DE MANIOC (option pâte d'arachide)
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '086042e3-f59c-4113-992d-9860e8a3ce77',
  'LA SAUCE FEUILLE DE MANIOC (option pâte d''arachide)',
  'Recette traditionnelle : LA SAUCE FEUILLE DE MANIOC (option pâte d''arachide)',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3582195d-01df-4044-9e3a-8f5919bb40d3',
  '086042e3-f59c-4113-992d-9860e8a3ce77',
  1,
  'Les recettes à suivre pour les plats de bawin, gnonmi, couscous marocain et tajine',
  NULL
);


-- RECETTE 63: SMOOTHIE PROTEINE à la vanille et aux pois
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'df808709-6c35-48e6-bd63-b41e274a3458',
  'SMOOTHIE PROTEINE à la vanille et aux pois',
  'Recette traditionnelle : SMOOTHIE PROTEINE à la vanille et aux pois',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '89029d8a-d660-428b-a784-2d00afe0d465',
  'df808709-6c35-48e6-bd63-b41e274a3458',
  1,
  'Placez taus les ingrédients sauf la glace dans un mixeur et mélangez',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f1433634-59df-434f-8af8-78325b840174',
  'df808709-6c35-48e6-bd63-b41e274a3458',
  2,
  'Ajoutez de la glace et mélangez à nouveau jusqu''à obtenir une consistance lisse.',
  NULL
);


-- RECETTE 64: HOUMOUS AU CITRON
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '0b27317d-e053-4070-86b8-b62e3e5572e7',
  'HOUMOUS AU CITRON',
  'Recette traditionnelle : HOUMOUS AU CITRON',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dc1f1b12-1329-4e2c-bac8-17c36ab72f34',
  '0b27317d-e053-4070-86b8-b62e3e5572e7',
  1,
  'Mettez les oignons nouveaux, les pois chiches, le tahini, l''eau le jus et le zeste de citron, l''ail dans un mixeur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '802ee0bd-4dcc-4dfd-9b88-aaaf9a12a722',
  '0b27317d-e053-4070-86b8-b62e3e5572e7',
  2,
  'Ajoutez le sel et du poivre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '88c91aa5-d5f0-4412-a391-e08b3923ad06',
  '0b27317d-e053-4070-86b8-b62e3e5572e7',
  3,
  'Mixez 15 - 20 seconde jusqu’à ce que le mélange soit bien lisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8590c742-460b-4428-9f02-1a5488496637',
  '0b27317d-e053-4070-86b8-b62e3e5572e7',
  4,
  'Servez le Houmous dans un bol avec quelques feuilles de menthe fraîche.',
  NULL
);


-- RECETTE 65: PUDDING DE CHIA (2 personnes)
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  'PUDDING DE CHIA (2 personnes)',
  'Recette traditionnelle : PUDDING DE CHIA (2 personnes)',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '89810c6f-e11d-4a44-8ffd-c7013bc149d9',
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  1,
  'Prenez 2 pots en verre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c9e284e7-dba3-4ccf-8c1b-7c0654e29d17',
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  2,
  'Placez 20 g de graines de chia, 120 ml de lait d''avoine et un peu d iextrait de vanille dans chaque bocal',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1d4814d8-86f5-4441-b42c-7ecba0066b0d',
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  3,
  'Secouez le bocal pour mélanger les graines de chia',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '23bff05f-636b-4587-a27e-70e702443313',
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  4,
  'Réfrigérez au moins 2 heures ou toute la nuit',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '42fa2cc8-e0b9-49df-8664-87deedd113b9',
  'bde1cfcb-a7fb-4b3f-ab32-ff6a9fce2189',
  5,
  'Agitez doucement et/ou remuez avant d''ajouter le reste des ingrédients.',
  NULL
);


-- RECETTE 66: LAIT D'ARACHIDE VANILLÉ (1 litre)
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  'LAIT D''ARACHIDE VANILLÉ (1 litre)',
  'Recette traditionnelle : LAIT D''ARACHIDE VANILLÉ (1 litre)',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd6dcb006-0a16-43d9-af19-80fd8246669b',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  1,
  'Étape 1 : Fendre les gousses de vanille en 2 et récupérer les graines à l''aide de la pointe d''un couteau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b3012e87-05c7-49fd-b55a-0db4dad7547e',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  2,
  'Étape 2 : Tremper les arachides dans l''eau avec les gousses et les graines durant toute une nuit',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eba59cfd-6353-4760-876c-83d4d62024ab',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  3,
  'Le lendemain retirer les gousses et verser les arachides ainsi que leur eau de trempage dans un mixeur ou un blender',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c787c529-3f27-4c84-9e81-7e34d1d18a44',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  4,
  'Mixer jusqu''à l''obtention d''un liquide homogène',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7e8f8e03-4385-48b9-89fa-2a41e2c4a94e',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  5,
  'Étape 3 : Passer la préparation au tamis en pressant bien pour faire ressortir un maximum de lait',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '21739962-526e-44f0-b5c3-f1694d27dcbb',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  6,
  'Verser dans des bouteilles en verre et conserver 3 jours maximum au frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6c5980bb-d222-4db4-8185-ea5d85193953',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  7,
  'Secouer avant de servir',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'eae9d159-95f9-4d2e-bac3-58f1af3801b2',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  8,
  'Bon à savoir : Le résidu issu du pressage est appelé okara',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8323c2f3-3b82-48e1-8b18-eb2f877dc0b8',
  '83754aac-65f8-4b6a-abcc-b1a1d424785a',
  9,
  'Il est très riche et peut entrer dans l''élaboration de plusieurs recettes.',
  NULL
);


-- RECETTE 67: CHOCOLAT CHAUD AU PIMENT
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  'CHOCOLAT CHAUD AU PIMENT',
  'Recette traditionnelle : CHOCOLAT CHAUD AU PIMENT',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c85d7986-cb8a-429e-afa5-b4b0c4b43bdc',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  1,
  'Chocolat chaud au piment Étape I : Porter la crème et le lait à ébullition avec le piment',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3d920065-d9c4-492b-bf86-dff3245806b9',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  2,
  'Fors du feu, couvrir et laisser infuser pendant 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b1935b95-f0fb-469b-990f-1f4163180762',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  3,
  'Etape II : Hacher grossièrement le chocolat et l''ajouter dans le lait chaud',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4cc8b622-37ae-489d-ad13-e0fd267d0ea8',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  4,
  'Remettre sur le feu et laisser épaissir à feu doux tout en mélangeant durant 5 à 10 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b6a9d2ea-bb48-4f05-9975-028bdd38e57c',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  5,
  'Retirer du feu selon la consistance souhaitée (plus ou moins liquide) et servir aussitôt, dorée sur tous les côtés (ne pas dépasser 5 min au total)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '22036076-0e74-4395-8032-943d3106f6ef',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  6,
  'Réserver sur une assiette et parsemer de fleur de sel',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f5d06ab7-3345-4646-8876-2e040ba6d585',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  7,
  'Recouvrir d''aluminium et laisser reposer 5 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a621c2fa-b18c-44ca-aaa1-5d50e1389bbe',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  8,
  'Chocolat viennois aux épices africaines Étape III : Reprendre la version du chocolat chaud au piment et remplacer le piment par 2 c',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0e4210f4-e4bf-46f4-b4e5-65cda5e46a28',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  9,
  'à café le mélange d''épices',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f553ab25-c2ca-4db7-a552-38dc85e59d8d',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  10,
  'Astuce : placer la crème et le saladier au freezer 15 min avant de commencer afin qu''ils soient bien froids',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9c25c43e-5015-42ce-8786-1fc5c7c838dd',
  'bc8b8ed3-1ea9-46cd-84cb-52c3a8ed022e',
  11,
  'La chantilly est prête lorsque l''on retourne le saladier et qu''elle reste figée aux parois.',
  NULL
);


-- RECETTE 68: INFUSION GLACÉE BISSAP BLANC. ROSE. COROSSOL
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  'INFUSION GLACÉE BISSAP BLANC. ROSE. COROSSOL',
  'Recette traditionnelle : INFUSION GLACÉE BISSAP BLANC. ROSE. COROSSOL',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6021d804-c076-439f-bd63-2432cd54cbc4',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  1,
  'Étape I : Rincer les fleurs d''hibiscus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '499b409c-d646-4627-b52d-3481a9090380',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  2,
  'Porter l''eau à ébullition et retirer du feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8b0ea1b6-3f70-4a93-b0b2-a3d775239845',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  3,
  'Y faire infuser les fleurs, couvrir et compter 15 min',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f57219d4-5ff0-4b96-b97c-27aca7fa24fa',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  4,
  'Etape II : Passer le liquide au chinois et répéter l''opération 2 fois pour bien enlever les éventuels résidus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '64dea4e2-a805-47b4-b4d2-373aa2eec286',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  5,
  'Ajouter le sirop de sucre de canne, l''eau de rose et verser dans une carafe',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b026ff5e-4485-44be-9f06-1d61965490b5',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  6,
  'Étape III : Couper le corossol en morceaux plus ou moins gros',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7ecd54e3-2d3f-4107-b029-e9c445228010',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  7,
  'Ajouter ces morceaux à l''infusion et placer au réfrigérateur durant 1 nuit',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '37aefc46-0a9f-4867-b44b-9be7a52d92fd',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  8,
  'Étape IV : Passer l''infusion au chinois et bien presser le corossol contre les parois afin de récupérer tout le jus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5ac1962e-37ea-4fef-bd87-852eeb72797a',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  9,
  'Mélanger et déguster bien frais',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1218c019-7ef7-4df5-8b87-01018431be14',
  '2e58893f-1482-4edc-8503-a08c17a67fed',
  10,
  'Astuce : un corossol mûr est mou au toucher avec des épines bien écartées',
  NULL
);


-- RECETTE 69: JUS DE BISSAP À LA FLEUR D'ORANGER
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  'JUS DE BISSAP À LA FLEUR D''ORANGER',
  'Recette traditionnelle : JUS DE BISSAP À LA FLEUR D''ORANGER',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7a656829-a773-4219-83de-31832276c9b1',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  1,
  'Étape I : Rincer les fleurs d''hibiscus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e55278a1-da7d-4db3-8bae-45c962ce6f24',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  2,
  'Porter l''eau à ébullition et retirer du feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'da99606b-947b-4924-bcd0-954d447e13a6',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  3,
  'Y faire infuser les fleurs avec la menthe préalablement rincée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8f616114-0907-4db8-90da-02d43975f9f3',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  4,
  'Couvrir et laisser complètement refroidir',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '26656bde-1c15-434a-8de8-245bf04137e2',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  5,
  'Etape II : Retirer la menthe et passer le liquide au chinois',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '1ea0f278-b022-4b38-b3c2-e365e608fcd1',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  6,
  'Répéter l''opération 2 fois pour bien enlever les éventuels résidus',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '600f01cd-8fce-498e-afeb-3d7597d9a767',
  '6bae039b-5669-47b6-bd7a-b1f46dfcb6a6',
  7,
  'Incorporer le sucre et mélanger jusqu''à ce qu''il soit complètement dissous Étape III : Aromatiser le jus de bissap avec la fleur d''oranger, mélanger et réserver au frais.',
  NULL
);


-- RECETTE 70: JUS DE GINGEMBRE PASSION
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  'JUS DE GINGEMBRE PASSION',
  'Recette traditionnelle : JUS DE GINGEMBRE PASSION',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9fb09b1d-3706-4874-9dbb-5aa6918609fd',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  1,
  'Etape I : Rincer, éplucher et découper le gingembre en morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '47bed39d-4aa4-46b2-870c-ca0ebe7a4c49',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  2,
  'Rincer les fruits de la passion',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5faa6d10-fdd7-4c55-bbcd-02bc867d9c7d',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  3,
  'En prendre 5, les couper en 2 et récupérer la pulpe à l''aide d''une cuillère',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '92dca357-e7f7-4921-ae91-2149935511cb',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  4,
  'Étape II : Mixer le gingembre avec la pulpe des fruits de la passion',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '16cd9882-9bf3-4324-8a3f-6a02d5ae81e9',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  5,
  'Placer dans un saladier et recouvrir avec l''eau',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '091f6b70-f4a4-4052-b71b-af5736594a17',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  6,
  'Bien mélanger et laisser macérer au moins 1h',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e3875781-5c8f-4ea2-9317-c09afcd2bb7a',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  7,
  'Étape III : Passer la préparation au chinois afin de la filtrer',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b40f15ab-8c6f-4639-acf0-cbb2c8df9e1b',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  8,
  'Ajouter ensuite la pulpe du fruit de la passion restant, le sucre et le sucre vanillé',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '095dbd29-b9c2-4990-98d9-6f3d9e231345',
  '150dd8aa-a3d5-4c94-b527-46ba953eed95',
  9,
  'Remuer pour dissoudre complètement les sucres puis réserver au frais.',
  NULL
);


-- RECETTE 71: JUS DE PAPAYE. FRAMBOISE. PAMPLEMOUSSE ROSE.
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '2efc517d-d277-475b-87fd-626ce1e428ae',
  'JUS DE PAPAYE. FRAMBOISE. PAMPLEMOUSSE ROSE.',
  'Recette traditionnelle : JUS DE PAPAYE. FRAMBOISE. PAMPLEMOUSSE ROSE.',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '2c8f082e-31dc-4e7a-88d4-c4bdf2c2d6ba',
  '2efc517d-d277-475b-87fd-626ce1e428ae',
  1,
  'Étape l : Prélever la pulpe de la papaye à l''aide d''une cuillère',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5e6e22cc-66a4-4a94-91cf-0852517059b9',
  '2efc517d-d277-475b-87fd-626ce1e428ae',
  2,
  'Étape II : Extraire le jus de la papaye et des framboises à l''aide d''une centrifugeuse ou d''un extracteur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e426c027-dc65-475a-ae32-8e75eade271b',
  '2efc517d-d277-475b-87fd-626ce1e428ae',
  3,
  'Ajouter le jus de pamplemousse et le jus de citron vert',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '89ef0974-71a1-4a88-8b3e-972612962435',
  '2efc517d-d277-475b-87fd-626ce1e428ae',
  4,
  'Étape III : Bien mélanger, verser dans des verres et servir avec des glaçons.',
  NULL
);


-- RECETTE 72: JUS DE FOLONG. POIRE. DATTE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'b3d09ab3-3544-4288-a820-3192a2eb4f60',
  'JUS DE FOLONG. POIRE. DATTE',
  'Recette traditionnelle : JUS DE FOLONG. POIRE. DATTE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '610429ee-d9d1-4f8e-bf4a-87ab935a1a1d',
  'b3d09ab3-3544-4288-a820-3192a2eb4f60',
  1,
  'Étape I : Dénoyauter les dattes',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '98553201-99e7-4bae-b959-2e7ee43c4989',
  'b3d09ab3-3544-4288-a820-3192a2eb4f60',
  2,
  'Étape II : Extraire le jus des aliments à la centrifugeuse ou à l''extracteur',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'aa4bb556-558f-42f7-a75b-01fc24513f5d',
  'b3d09ab3-3544-4288-a820-3192a2eb4f60',
  3,
  'Étape III : Bien mélanger, verser dans des verres et servir avec des glaçons.',
  NULL
);


-- RECETTE 73: SMOOTHIE BANANE BEURRE DE CAJOU
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'dfb24931-741a-43e4-83ed-95dfd0085923',
  'SMOOTHIE BANANE BEURRE DE CAJOU',
  'Recette traditionnelle : SMOOTHIE BANANE BEURRE DE CAJOU',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '120a77e1-9dc9-4a2d-a9f1-cce0d5bbc2e0',
  'dfb24931-741a-43e4-83ed-95dfd0085923',
  1,
  'Étape I : Peler la banane et la découper en gros morceaux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6bee3dc7-531a-4b2d-9769-8bc586be2fae',
  'dfb24931-741a-43e4-83ed-95dfd0085923',
  2,
  'Étape II : Mettre la banane, le lait et le beurre de cajou dans un mixeur ou un blender',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4dc9aca8-b7a0-4b7f-99c6-5fa4ad9575c5',
  'dfb24931-741a-43e4-83ed-95dfd0085923',
  3,
  'Étape III : Mixer jusqu''à l''obtention d''un mélange lisse, verser dans des verres et servir aussitôt.',
  NULL
);


-- RECETTE 74: SMOOTHE MANGUE NZUNZIBALI
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  'SMOOTHE MANGUE NZUNZIBALI',
  'Recette traditionnelle : SMOOTHE MANGUE NZUNZIBALI',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0b1e1ee8-4986-4fd2-b03e-eff25ac81377',
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  1,
  'Étape I : Rincer la mangue et les nzunzibalis',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6310f95a-02a8-42cc-a2df-1e8b064f9821',
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  2,
  'Éplucher la mangue et récupérer la chair',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a177a77d-2938-4ee2-8a22-98ffd32d6131',
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  3,
  'Étape II : Mettre la mangue, les nzunzibalis et le lait dans un mixeur ou un blender',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '573cf412-8a8d-4bca-a072-4b614a3442c0',
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  4,
  'Mixer jusqu''à l''obtention d''un mélange lisse puis passer au chinois',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '6d776383-e36b-44c1-a8ca-689e5cecb2aa',
  '79166f79-0936-4e7d-ad5e-59c5a395d730',
  5,
  'Étape III : Verser dans des verres et servir bien frais.',
  NULL
);


-- RECETTE 75: MILKSHAKE DE BOUYE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'b15a40b8-39d4-4127-837f-bd0a7d533cf8',
  'MILKSHAKE DE BOUYE',
  'Recette traditionnelle : MILKSHAKE DE BOUYE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0d35c82b-28d1-4bbe-992c-3f5f919fc616',
  'b15a40b8-39d4-4127-837f-bd0a7d533cf8',
  1,
  'Étape I : Mettre l''ensemble des ingrédients dans un mixeur ou un blender',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7bce2c34-9c71-467e-a37b-1c0672b067b3',
  'b15a40b8-39d4-4127-837f-bd0a7d533cf8',
  2,
  'Étape II : Mixer jusqu''à l''obtention d''une consistance mousseuse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3baf4254-1e84-4e6a-8427-cb1528740f16',
  'b15a40b8-39d4-4127-837f-bd0a7d533cf8',
  3,
  'Étape III : Verser dans des verres et servir aussitôt avec une paille.',
  NULL
);


-- RECETTE 76: BEURRE D'ARACHIDES AUX ÉCLATS D'ARACHIDES
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'f1a98f13-78c9-4f06-8b95-ef4e2022f407',
  'BEURRE D''ARACHIDES AUX ÉCLATS D''ARACHIDES',
  'Recette traditionnelle : BEURRE D''ARACHIDES AUX ÉCLATS D''ARACHIDES',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e6bf2f28-5b51-4524-b318-ad1e84050a5b',
  'f1a98f13-78c9-4f06-8b95-ef4e2022f407',
  1,
  'Etape I : Mixer au robot 300g d''arachides avec l''huile jusqu''à l''obtention d''une pâte homogène et lisse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '453c2e7a-7fc8-4c0a-90c0-4d858bea6a34',
  'f1a98f13-78c9-4f06-8b95-ef4e2022f407',
  2,
  'Etape II : Concasser les 20g d''arachides restant et les incorporer à la pâte',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e1e4ea92-cc23-4a8b-8891-9faaa75be507',
  'f1a98f13-78c9-4f06-8b95-ef4e2022f407',
  3,
  'Étape III : Conserver le beurre d''arachide dans un pot stérilisé.',
  NULL
);


-- RECETTE 77: CONFITURE FRAISE.
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  'CONFITURE FRAISE.',
  'Recette traditionnelle : CONFITURE FRAISE.',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '637f3715-0125-4dd8-8dc9-eb77042717da',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  1,
  'Étape I : Laver, équeuter et découper les fraises en deux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3bb49745-1c51-46ef-8e3f-ac31515d8d52',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  2,
  'Les recouvrir de sucre et de jus de citron',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f5712740-9213-4096-8dbd-6e92fa46d479',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  3,
  'Mélanger puis laisser macérer durant 1h à température ambiante sous un torchon',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'caeb99f1-ba96-46c3-84e9-10fdb5f231ae',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  4,
  'Étape II : Porter les fraises à ébullition sur feu vif puis ajouter le vinaigre balsamique et le poivre',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'ca6ecb3f-4e0d-40bf-867b-c10faf99d600',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  5,
  'Lorsque toute la surface bout, baisser le feu et laisser cuire à feu doux pendant 15 min en mélangeant sans cesse',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5eaf1682-6ced-4da4-9835-eb9bf5263587',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  6,
  'Étape III : Retirer la confiture du feu et enlever la mousse éventuelle sur le dessus avec une écumoire',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e22781af-07cc-452e-8a79-a308fa005612',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  7,
  'Étape IV : Mettre la confiture dans des pots stérilisés et retourner jusqu''à refroidissement complet (cela est nécessaire pour une bonne conservation)',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b0b04d0b-33af-4533-befb-8df44a9fdd81',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  8,
  'Astuce : vérifier la consistance de la confiture en mettant une cuillère de confiture chaude sur une assiette froide',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8ba56270-9c91-4819-945c-4c93630bb5ac',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  9,
  'Laisser refroidir puis incliner l''assiette',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'dabfc687-d1e5-4a64-a930-6bc3142d54e0',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  10,
  'Si la confiture accroche c''est qu''elle est prête',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '28b189d9-0e8d-4e86-b1d4-e29c2f14fc59',
  '53849961-1c6d-46c0-acd3-23c354cb06a5',
  11,
  'Dans le cas contraire, la remettre à cuire pendant quelques minutes.',
  NULL
);


-- RECETTE 78: PÂTE DE TOFFEE
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  'PÂTE DE TOFFEE',
  'Recette traditionnelle : PÂTE DE TOFFEE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a65ce627-5741-4521-90f1-c1dac2ba1fc6',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  1,
  'Étape I : Placer la boîte de lait concentré sucré dans une casserole',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4aaff7b3-7720-4a75-bcc2-3f472d42bb30',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  2,
  'Remplir d''eau jusqu''à ce que l''eau dépasse la boîte d''environ 1 cm',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '52f20e69-a3d9-4bee-a3c3-486a0e058f76',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  3,
  'Étape II : Faire fremir pendant 3h45 en rajoutant de l''eau environ toutes les 30 min afin que la boîte soit toujours immergée',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd8590c07-4798-4fa6-9097-9b1a38b3a91b',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  4,
  'Vider l''eau et laisser complètement refroidir avant d''ouvrir',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '24e7cb47-a5df-4ca9-be9d-fa986064fdd3',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  5,
  'Étape III : Fouetter pour obtenir un mélange homogène',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd9a8eb1c-1f3b-4431-bae3-2ce9941882be',
  'a26753fa-66f1-49a4-ae9b-c12fe309be7d',
  6,
  'Conserver dans un pot stérilisé.',
  NULL
);


-- RECETTE 79: PÂTE À TARTINER D'ATANGAS
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  'PÂTE À TARTINER D''ATANGAS',
  'Recette traditionnelle : PÂTE À TARTINER D''ATANGAS',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'f789faeb-13d6-43ec-9ec7-0b3a9398d7ea',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  1,
  'Étape I : Porter à ébullition une casserole d''eau puis la retirer du feu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b645cd67-04bf-43e8-a300-44a218bcfa89',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  2,
  'Étape II : Rincer les atangas et les plonger dans l''eau chaude',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '0b217a8f-690c-4bb3-b63d-2bf3b2a9dbce',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  3,
  'Laisser reposer 10 min à couvert',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '95a652c5-8e69-4c54-8309-cb5b0033b2d1',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  4,
  'Égoutter, peler et récupérer la chair',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '56042928-031c-4c4a-bced-a511f70a7b64',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  5,
  'Etape III : Mixer la chair des atangas avec le miel et la crème jusqu''à l''obtention d''un mélange homogène',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9806410b-1226-4368-9140-a34febb77fe0',
  '197869fc-ce4b-4045-97e3-07667bd979b2',
  6,
  'Étape IV : Conserver au frais dans un pot stérilisé.',
  NULL
);


-- RECETTE 80: LEMON CURD AU POIVRE DU KIVU
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  'LEMON CURD AU POIVRE DU KIVU',
  'Recette traditionnelle : LEMON CURD AU POIVRE DU KIVU',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3500,
  '45 min',
  '450 kcal',
  'Traditionnel',
  ARRAY['Traditionnel']::text[]
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'acadd2a8-9a2c-4224-8e79-c7655a0ae4fd',
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  1,
  'Étape I : Mélanger au fouet les œufs, les jaunes et le sucre jusqu''à ce que le mélange devienne crémeux',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7cf2851d-149e-4c8c-ae8e-79e33ccad8b2',
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  2,
  'Ajouter le zeste, le jus de citron ainsi que le poivre du Kivu',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '859df826-c1fa-491f-81c5-15b4cd281eff',
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  3,
  'Étape II : Faire cuire au bain-marie pendant 5 min jusqu''à ce que la crème épaississe',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '50fe129c-bc78-4b63-8baa-c59b16aad063',
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  4,
  'Laisser refroidir complètement puis ajouter le beurre en petits morceaux et mixer',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4a61b442-ddbf-4f7d-b0d4-c2901bd8f6ca',
  'ecf08fe5-babc-4241-ac2a-cb742004d789',
  5,
  'Étape III : Conserver au frais dans un pot stérilisé.',
  NULL
);


-- RECETTE 81: SAUCE DAH SIMPLE AVEC SOUMARA
INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'SAUCE DAH SIMPLE AVEC SOUMARA',
  'Recette traditionnelle : SAUCE DAH SIMPLE AVEC SOUMARA',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  5000,
  '45 min',
  '450 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

-- Ingrédients
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3f3d0cf8-4b5b-4c4f-b02f-7fb6fba55870',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Feuilles de dah (grosse botte)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b0a3ac31-9f11-4e0b-986f-b1e16cf2bcbc',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Oignons',
  'pièce',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6fbb1f07-2b1f-4e52-b49a-27b7f2c42ff2',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Soumara (en poudre ou en grains, de préférence écrasé)',
  'c.à.s',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'df46a0b3-39a3-4d34-9c70-1bba2f2d7fe0',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Piment frais',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b06b5f32-44e4-4d2c-a75a-dfa14bd97f43',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Épices',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b5a7f2c8-85e9-4c20-9160-b1b4fb0c7b2c',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Tomates (tomate pâte ou tomate fraîche)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4f34a5e1-1c95-43fc-a9d7-4b0ab9953d6c',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  'Gousses d\'ail (optionnel)',
  'gousse',
  2,
  NULL
);

-- Étapes de préparation
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c9b9ee9e-1e9a-4c78-8f07-7cbb2f0c3f27',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  1,
  'Laver soigneusement les feuilles de dah puis les égoutter.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '3bfa0f74-6bb9-4dd9-bc16-d29cf0cccd0f',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  2,
  'Émincer les oignons, écraser le soumara et préparer le piment et l\'ail.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c3b9d682-1f16-4b57-9c0a-6d8b814bce56',
  'b2f17c8f-9e4d-4f2a-9c62-1f4e2d2bc2a1',
  3,
  'Faire revenir oignons et tomates, ajouter soumara et épices, puis incorporer le dah et laisser mijoter jusqu\'à cuisson.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'LA SAUCE DAH AVEC PÂTE D\'ARACHIDE',
  'Recette traditionnelle : LA SAUCE DAH AVEC PÂTE D\'ARACHIDE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  5000,
  '60 min',
  '450 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e0c2b62e-4e19-45cf-a371-690cce3a5b45',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Feuilles de dah',
  'g',
  90,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd1bb8df4-34a9-4f41-8c59-08af4e1cfe36',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b1f2c9f2-a0b7-4e86-9c8e-e52a84d9e7d7',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Tomate',
  'g',
  300,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0d1f668e-0e90-4c58-9d32-8af3d1f1fbe8',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Ail (optionnel)',
  'g',
  22,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b7d4f0f2-4a74-4a5a-a7f9-72b8822d1b2c',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Piment frais',
  'g',
  41,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a7d0d80d-0f3c-4ae8-8b9a-0c3c7b2f0f45',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Épices',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd7f2f8b0-3888-4d6f-a7f9-0b8a1b44d5bd',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Viande ou poisson',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1f2f9a76-6a5d-4d5d-8c57-37b22f0f0f1f',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Pâte d\'arachide',
  'g',
  200,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '54a2be0f-55c8-4d59-a6cb-0b9a3bb7f09e',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Pâte de tomates (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c8d4d06c-8b7c-4d7c-9a67-2f2d4f00e7d2',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Poudre de poisson sec (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ea4ffb6a-7a8b-4f7e-8e52-1a8c7a1bb0b2',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  'Poisson fumé (optionnel)',
  'unité',
  1,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '48b03b11-8f9a-4d43-9e6f-e2f75d19a1e1',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  1,
  'Faire précuire les feuilles de dah avec un peu d\'eau pendant environ 5 minutes, puis rincer pour enlever l\'acidité.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'bbf0f2f4-52d0-4a3d-9b3c-5b7d7b2c1a9c',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  2,
  'Râper ou mixer l\'oignon, l\'ail (optionnel) et la tomate.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '4e1a9b3f-2c6e-4b52-9a8a-5f3dd2b5c0a0',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  3,
  'Mettre au feu l\'eau mélangée à la pâte d\'arachide, puis ajouter le mélange mixé (oignon/ail/tomate).',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '5b2b6b2d-2ac7-4e74-9ef6-7e1b0b3a4a2f',
  '6f9b82d2-85a4-4caa-90ea-6c9e6d1f8b0e',
  4,
  'Ajouter piment, épices, viande/poisson, et éventuellement poisson fumé, pâte de tomates et poudre de poisson sec. Laisser bouillir environ 45 minutes puis saler.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'LA SAUCE GOMBO',
  'Recette traditionnelle : LA SAUCE GOMBO',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  5000,
  '45 min',
  '450 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4e9df0b2-0c7a-4b2e-8a23-36e8c9b3a0e8',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Gombo frais',
  'g',
  628,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '75d2b6a8-6315-4d02-8b5a-8a0c9d1f2d3a',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f9a2c1d0-2c2b-4d15-9a4e-1d2e3f4a5b6c',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Tomate',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8a3b4c5d-6e7f-4a1b-9c2d-3e4f5a6b7c8d',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Huile rouge (optionnel)',
  'c.à.s',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bb8a1c2d-3e4f-4a5b-8c6d-7e8f9a0b1c2d',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Feuilles de kablè (pour parfumer)',
  'tige',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c1d2e3f4-a5b6-4c7d-8e9f-0a1b2c3d4e5f',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Poisson fumé',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd2e3f4a5-b6c7-4d8e-9f0a-1b2c3d4e5f6a',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Kplo (peau de bœuf) ou viande (optionnel)',
  'morceau',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e3f4a5b6-c7d8-4e9f-8a0b-1c2d3e4f5a6b',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Épices',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f4a5b6c7-d8e9-4f8a-9b0c-1d2e3f4a5b6c',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Piment frais',
  'g',
  41,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a5b6c7d8-e9f0-4a9b-8c1d-2e3f4a5b6c7d',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Poisson sec',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b6c7d8e9-f0a1-4b8c-9d2e-3f4a5b6c7d8e',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  'Ail (optionnel)',
  'g',
  22,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c7d8e9f0-a1b2-4c9d-8e3f-4a5b6c7d8e9f',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  1,
  'Préparer l\'eau de potasse/bicarbonate, la filtrer, puis cuire le gombo lavé et découpé en le malaxant avec un peu d\'eau.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'd8e9f0a1-b2c3-4d8e-9f0a-5b6c7d8e9f0a',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  2,
  'Cuire le kplo/viande à part avec sel jusqu\'à tendreté. Mixer oignon, ail, piment, tomates et ajouter au gombo avec les feuilles de kablè.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'e9f0a1b2-c3d4-4e9f-8a0b-6c7d8e9f0a1b',
  '4f7e4a24-2d9b-4631-bd8a-7c5f3c7d2b11',
  3,
  'Ajouter l\'huile rouge, le poisson fumé et le poisson sec, puis assaisonner (épices, sel, poivre) et laisser mijoter quelques minutes avant de servir.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'LA SAUCE DAH AVEC ARACHIDE PILÉE',
  'Recette traditionnelle : LA SAUCE DAH AVEC ARACHIDE PILÉE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  5000,
  '45 min',
  '450 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2b8c9f2d-6c70-4f49-8a5c-6f7f5e4d3c2b',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Feuilles de dah',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3c9d0a3e-7d81-4a5a-9b6d-7a8b9c0d1e2f',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Arachide pilée',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4d0a1b4f-8e92-4b6b-8c7e-8b9c0d1e2f3a',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Oignon',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5e1b2c5a-9f03-4c7c-9d8f-9c0d1e2f3a4b',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Tomate',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6f2c3d6b-a014-4d8d-8e9a-0d1e2f3a4b5c',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Ail (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '702d4e7c-b125-4e9e-9f0b-1e2f3a4b5c6d',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Épices',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '813e5f8d-c236-4f0a-8a1c-2f3a4b5c6d7e',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  'Viande ou poisson',
  'unité',
  1,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '92f6079e-d347-4a1b-9b2d-3a4b5c6d7e8f',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  1,
  'Faire précuire et rincer le dah, puis préparer un mélange oignon/tomate/ail/épices.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a3a718af-e458-4b2c-8c3e-4b5c6d7e8f90',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  2,
  'Mettre au feu l\'arachide pilée diluée dans l\'eau, ajouter le mélange et laisser cuire.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b4b829c0-f569-4c3d-9d4f-5c6d7e8f901a',
  'b59c9c23-5a75-4e7b-b8b2-0b79c31ab3ae',
  3,
  'Ajouter le dah et la viande/poisson, assaisonner, puis laisser mijoter jusqu\'à consistance.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'LA SAUCE GRAINE',
  'Recette traditionnelle : LA SAUCE GRAINE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  5000,
  '45 min',
  '450 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '6b2c5e4f-8d72-4b6d-9c0b-11f2e3d4c5b6',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Graine de palme',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '7c3d6f50-9e83-4c7e-8d1c-22a3b4c5d6e7',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Oignon',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8d4e7051-af94-4d8f-9e2d-33b4c5d6e7f8',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Tomate',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '9e5f8162-b0a5-4e90-8f3e-44c5d6e7f809',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Ail (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'af708273-c1b6-4f01-9a4f-55d6e7f8091a',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Poisson mangni',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b0819384-d2c7-4a12-8b50-66e7f8091a2b',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Kplo (peau de bœuf) ou viande',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c192a495-e3d8-4b23-9c61-77f8091a2b3c',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Crabes (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd2a3b5a6-f4e9-4c34-8d72-88a91b2c3d4e',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Escargot (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'e3b4c6b7-05fa-4d45-9e83-99b02c3d4e5f',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Feuilles de kablè (optionnel)',
  'unité',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'f4c5d7c8-16ab-4e56-8f94-aac13d4e5f60',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  'Épices',
  'unité',
  1,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '05d6e8d9-27bc-4f67-9a05-bbd24e5f6071',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  1,
  'Cuire la graine de palme, puis extraire la sauce (filtrer si nécessaire).',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '16e7f9ea-38cd-4a78-8b16-ccd35f607182',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  2,
  'Ajouter oignon, tomate, ail (optionnel), poissons/viandes (kplo, mangni) et laisser cuire.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '27f809fb-49de-4b89-9c27-dde46f607293',
  '20d7b8f8-0b86-4e5c-9b14-4d2b9c6a0d7f',
  3,
  'Ajouter épices et éventuels crabes/escargots/feuilles de kablè, puis mijoter jusqu\'à obtention d\'une sauce onctueuse.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'RAT BRAISÉ À LA VILLAGEOISE',
  'Recette traditionnelle : RAT BRAISÉ À LA VILLAGEOISE',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3000,
  '20 min',
  '500 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c4b3a2d1-9f88-4b3c-8d77-6e55d4c3b2a1',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Morceaux de rat fumés',
  'morceau',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'b3a2d1c0-8e77-4a2b-9c66-5d44c3b2a190',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Piments frais',
  'pièce',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'a2d1c0bf-7d66-4b1a-8b55-4c33b2a1908e',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Oignon',
  'pièce',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'd1c0bfae-6c55-4c0b-9a44-3b22a1908e7d',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Tomates fraîches',
  'pièce',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'c0bfad9c-5b44-4d9c-8a33-2a1908e7d6c5',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Piments secs',
  'pièce',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'bfad9c8b-4a33-4e8b-9f22-1908e7d6c5b4',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Huile',
  'c.à.s',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  'ad9c8b7a-3922-4f7a-8e11-08e7d6c5b4a3',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  'Sel, poivre',
  'unité',
  1,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '9c8b7a69-2811-4a69-9d00-18e7d6c5b4a3',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  1,
  'Laver soigneusement les morceaux de rat.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '8b7a6958-1700-4b58-8c99-27d6c5b4a392',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  2,
  'Écraser oignon, tomates et piments secs, assaisonner (sel/poivre) et ajouter l\'huile pour faire la marinade.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  '7a695847-0699-4c47-9b88-36c5b4a39281',
  '0d3f4e28-b2a9-4f73-8d8e-6a9e2b6c4d12',
  3,
  'Farcir/masser les morceaux de rat avec la marinade puis griller au charbon environ 15 minutes de chaque côté en retournant régulièrement.',
  NULL
);

INSERT INTO recipes (id, title, description, image, price, time, calories, category, tags) VALUES (
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'ZRIN',
  'Recette traditionnelle : ZRIN',
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=800',
  3000,
  '85 min',
  '600 kcal',
  'Africaines',
  ARRAY['Africaines']::text[]
);

INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '0a1b2c3d-4e5f-4a60-8b70-9c80d1e2f3a4',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Morceaux d\'agouti fumés',
  'morceau',
  4,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '1b2c3d4e-5f60-4b71-9c81-0d1e2f3a4b5c',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Poissons magne fumés',
  'morceau',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '2c3d4e5f-6071-4c82-8d92-1e2f3a4b5c6d',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Piment en poudre',
  'c.à.s',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '3d4e5f60-7182-4d93-9ea3-2f3a4b5c6d7e',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Gombos frais',
  'pièce',
  10,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '4e5f6071-8293-4e04-8f14-3a4b5c6d7e8f',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Gnangnan',
  'poignée',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '5f607182-93a4-4f15-9a25-4b5c6d7e8f90',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Potasse',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '60718293-a4b5-4a26-8b36-5c6d7e8f901a',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Feuilles de zrin (kwala)',
  'botte',
  2,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '718293a4-b5c6-4b37-9c47-6d7e8f901a2b',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Huile rouge',
  'tasse',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '8293a4b5-c6d7-4c48-8d58-7e8f901a2b3c',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Poisson faisandé',
  'morceau',
  1,
  NULL
);
INSERT INTO ingredients (id, recipe_id, name, unit, quantity, price_per_unit) VALUES (
  '93a4b5c6-d7e8-4d59-9e69-8f901a2b3c4d',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  'Sel',
  'unité',
  1,
  NULL
);

INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'a4b5c6d7-e8f9-4e6a-8b7a-901a2b3c4d5e',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  1,
  'Mettre les morceaux de gibier dans une casserole avec 2 L d\'eau, l\'huile rouge, le sel, le piment en poudre, les feuilles de zrin, le gombo, le gnangnan et l\'adjovan/poisson faisandé.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'b5c6d7e8-f90a-4f7b-9c8b-0a1b2c3d4e5f',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  2,
  'Ajouter la potasse et porter à ébullition environ 40 minutes.',
  NULL
);
INSERT INTO preparation_steps (id, recipe_id, step_number, description, duration) VALUES (
  'c6d7e8f9-0a1b-4a8c-8d9c-1b2c3d4e5f60',
  '9f2d3c4b-5a6d-4e7f-8a9b-0c1d2e3f4a5b',
  3,
  'Sortir feuilles/gombo/gnangnan, les écraser puis remettre la pâte dans la sauce et cuire encore environ 30 minutes. Rectifier l\'assaisonnement et mijoter 15 minutes.',
  NULL
);
