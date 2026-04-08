import fs from 'node:fs/promises';
import path from 'node:path';

const projectRoot = process.cwd();

// Supabase Render (extracted from Render bundle)
const SUPABASE_URL = 'https://eyypfwvxarpjiuevmula.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5eXBmd3Z4YXJwaml1ZXZtdWxhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjczMjM3ODksImV4cCI6MjA4Mjg5OTc4OX0.95KvcsJSFDDkPYlAqmgK0qkr8_6h7p8h_aNfVHYqrhk';

const OUT_DIR = path.join(projectRoot, 'src', 'public', 'recipes');

const supabaseRest = async (pathnameWithQuery) => {
  const url = `${SUPABASE_URL}${pathnameWithQuery}`;
  const res = await fetch(url, {
    headers: {
      apikey: SUPABASE_ANON_KEY,
      Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
      Accept: 'application/json',
    },
  });

  if (!res.ok) {
    const text = await res.text().catch(() => '');
    throw new Error(`Supabase REST error ${res.status} for ${url}\n${text}`);
  }

  return res.json();
};

const normalizeQuery = (s) => {
  // Remove accents, keep letters/numbers/spaces, collapse spaces.
  return String(s)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-zA-Z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .toLowerCase();
};

const buildQuery = ({ title, category }) => {
  const stop = new Set([
    'de', 'du', 'des', 'la', 'le', 'les', 'au', 'aux', 'a', 'à', 'et', 'en', 'pour', 'avec', 'sans',
    'sauce', 'recette', 'traditionnelle', 'personnes', 'personne'
  ]);

  const base = normalizeQuery(`${title} ${category}`)
    .split(' ')
    .filter((w) => w && !stop.has(w));

  // Take first N meaningful words for better matching
  const keywords = base.slice(0, 7);

  // Add context to bias toward food photography
  const query = [...keywords, 'food', 'dish'].join(',');
  return query || 'food,dish';
};

const buildTags = ({ title, category }) => {
  const q = buildQuery({ title, category });
  return q
    .split(',')
    .map((x) => x.trim())
    .filter(Boolean)
    .slice(0, 6);
};

const downloadToBuffer = async (url) => {
  const res = await fetch(url, {
    redirect: 'follow',
    headers: {
      'User-Agent': 'cuisinefacile-unique-image-generator',
      Accept: 'image/*,*/*;q=0.8',
    },
  });
  if (!res.ok) {
    throw new Error(`HTTP ${res.status} for ${url}`);
  }
  const arrayBuffer = await res.arrayBuffer();
  return Buffer.from(arrayBuffer);
};

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

const downloadWithRetry = async (url, { attempts = 6, baseDelayMs = 800 } = {}) => {
  let lastErr;
  for (let i = 1; i <= attempts; i++) {
    try {
      const buf = await downloadToBuffer(url);
      return buf;
    } catch (e) {
      lastErr = e;
      const delay = baseDelayMs * Math.pow(2, i - 1);
      await sleep(delay);
    }
  }
  throw lastErr;
};

const runWithConcurrency = async (items, concurrency, worker) => {
  const results = new Array(items.length);
  let idx = 0;

  const runners = new Array(Math.min(concurrency, items.length)).fill(0).map(async () => {
    while (true) {
      const current = idx;
      idx++;
      if (current >= items.length) return;
      results[current] = await worker(items[current], current);
    }
  });

  await Promise.all(runners);
  return results;
};

const getRecipes = async () => {
  const pageSize = 1000;
  let offset = 0;
  const recipes = [];

  while (true) {
    const batch = await supabaseRest(`/rest/v1/recipes?select=id,title,category&order=created_at.desc&limit=${pageSize}&offset=${offset}`);
    if (!Array.isArray(batch) || batch.length === 0) break;
    recipes.push(...batch);
    if (batch.length < pageSize) break;
    offset += pageSize;
  }

  return recipes
    .map((r) => ({ id: String(r.id), title: String(r.title ?? ''), category: String(r.category ?? '') }))
    .filter((r) => r.id && r.title);
};

const main = async () => {
  await fs.mkdir(OUT_DIR, { recursive: true });

  const recipes = await getRecipes();
  if (recipes.length === 0) throw new Error('No recipes found from Supabase Render');

  let ok = 0;
  let failed = 0;

  // Keep a cache per URL to avoid redownloading if redirect results identical,
  // but we vary sig so should be unique.
  const cache = new Map();

  await runWithConcurrency(recipes, 1, async (recipe, index) => {
    const outPath = path.join(OUT_DIR, `${recipe.id}.jpg`);

    try {
      const tags = buildTags(recipe);

      // Prefer food-tagged images from loremflickr (no API key).
      // Use "lock" to keep a deterministic image per recipe id.
      const loremUrl = `https://loremflickr.com/800/600/${encodeURIComponent(tags.join(','))}?lock=${encodeURIComponent(recipe.id)}`;

      // Fallback: always available random placeholder, still unique.
      const picsumUrl = `https://picsum.photos/seed/${encodeURIComponent(recipe.id)}/800/600`;

      const candidates = [loremUrl, picsumUrl];

      let buf;
      for (const url of candidates) {
        try {
          const cached = cache.get(url);
          if (cached) {
            buf = cached;
            break;
          }
          const downloaded = await downloadWithRetry(url, { attempts: 5, baseDelayMs: 700 });
          cache.set(url, downloaded);
          buf = downloaded;
          await sleep(300);
          break;
        } catch {
          // try next candidate
        }
      }

      if (!buf) {
        throw new Error('All image providers failed');
      }

      // Guard: if unsplash returns tiny/invalid image, fail
      if (buf.length < 10_000) {
        throw new Error(`Downloaded image too small (${buf.length} bytes)`);
      }

      await fs.writeFile(outPath, buf);
      ok++;
    } catch (e) {
      failed++;
      console.error(`[${index + 1}/${recipes.length}] FAILED ${recipe.id} (${recipe.title})`);
      console.error(e);
    }

    if ((index + 1) % 10 === 0 || index === recipes.length - 1) {
      console.log(`[${index + 1}/${recipes.length}] progress | ok=${ok} failed=${failed}`);
    }
  });

  console.log(`Finished. Images written to: ${OUT_DIR}`);
  console.log(`ok=${ok} failed=${failed}`);
};

main().catch((e) => {
  console.error('Generation failed:', e);
  process.exit(1);
});
