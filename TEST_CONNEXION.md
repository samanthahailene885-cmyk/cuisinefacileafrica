# 🧪 Test de la Connexion Supabase

## ✅ Vérifications à faire

### 1. Vérifier que les données sont dans Supabase

Allez dans votre projet Supabase → **Table Editor** et vérifiez :

- [ ] Table `recipes` : Vous devriez voir 3 recettes (Agouti Braisé, Sauce Nanmoukou, Zrin)
- [ ] Table `ingredients` : Vous devriez voir tous les ingrédients
- [ ] Table `preparation_steps` : Vous devriez voir les étapes de préparation

### 2. Vérifier les variables d'environnement

Créez ou vérifiez le fichier `.env.local` à la racine du projet :

```env
VITE_SUPABASE_URL=https://votre-projet.supabase.co
VITE_SUPABASE_ANON_KEY=votre-clé-anon-publique
```

⚠️ **Important** :
- Les variables doivent commencer par `VITE_`
- Le fichier doit être à la racine du projet (même niveau que `package.json`)
- Redémarrez le serveur après avoir créé/modifié `.env.local`

### 3. Tester l'application

1. **Redémarrez le serveur de développement** :
   ```bash
   npm run dev
   ```

2. **Ouvrez l'application** dans votre navigateur

3. **Allez sur la page "Recettes"** :
   - Les 3 recettes devraient s'afficher
   - Si vous voyez un loader puis les recettes → ✅ Ça marche !
   - Si vous voyez une erreur → Voir la section "Dépannage" ci-dessous

### 4. Vérifier la console du navigateur

Ouvrez les DevTools (F12) → Onglet **Console** :
- ✅ Pas d'erreurs rouges = Tout va bien
- ❌ Erreurs en rouge = Voir la section "Dépannage"

## 🐛 Dépannage

### Erreur : "Missing Supabase environment variables"

**Solution :**
1. Vérifiez que `.env.local` existe à la racine
2. Vérifiez que les variables commencent par `VITE_`
3. Redémarrez le serveur : `npm run dev`

### Erreur : "Failed to fetch" ou erreur réseau

**Solutions :**
1. Vérifiez que votre URL Supabase est correcte (sans slash à la fin)
2. Vérifiez que votre clé API est correcte
3. Vérifiez votre connexion internet
4. Vérifiez les logs Supabase (Settings → Logs → API)

### Les recettes ne s'affichent pas

**Vérifications :**
1. Ouvrez la console du navigateur (F12)
2. Regardez les erreurs
3. Vérifiez dans Supabase → Table Editor que les recettes existent
4. Vérifiez que les politiques RLS permettent la lecture (elles devraient)

### Erreur : "relation does not exist"

**Solution :**
- Les tables n'ont pas été créées
- Ré-exécutez le script `schema.sql` dans Supabase

## ✅ Checklist finale

- [ ] Scripts SQL exécutés dans Supabase
- [ ] Données visibles dans Table Editor
- [ ] Fichier `.env.local` créé avec les bonnes variables
- [ ] Serveur redémarré (`npm run dev`)
- [ ] Page Recettes affiche les 3 recettes
- [ ] Pas d'erreurs dans la console du navigateur

## 🎯 Prochaines étapes

Une fois que tout fonctionne :

1. **Ajuster les prix** dans Supabase selon vos tarifs
2. **Ajouter des images** pour chaque recette (URLs d'images)
3. **Tester la création d'une commande** :
   - Ajouter une recette au panier
   - Aller au checkout
   - Remplir le formulaire
   - Créer la commande
   - Vérifier dans Supabase → Table `orders` que la commande a été créée

---

**Besoin d'aide ?** Dites-moi quelle erreur vous voyez et je vous aiderai à la résoudre !

