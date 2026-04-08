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

const downloadToBuffer = async (url) => {
  const res = await fetch(url, {
    redirect: 'follow',
    headers: {
      'User-Agent': 'cuisinefacile-render-image-downloader',
      Accept: 'image/*,*/*;q=0.8',
    },
  });
  if (!res.ok) {
    throw new Error(`HTTP ${res.status} for ${url}`);
  }
  const arrayBuffer = await res.arrayBuffer();
  return Buffer.from(arrayBuffer);
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

const main = async () => {
  await fs.mkdir(OUT_DIR, { recursive: true });

  // Pull only id + image. Use pagination to be safe.
  const pageSize = 1000;
  let offset = 0;
  const recipes = [];

  while (true) {
    const batch = await supabaseRest(`/rest/v1/recipes?select=id,image&order=created_at.desc&limit=${pageSize}&offset=${offset}`);
    if (!Array.isArray(batch) || batch.length === 0) break;
    recipes.push(...batch);
    if (batch.length < pageSize) break;
    offset += pageSize;
  }

  const rows = recipes
    .map((r) => ({ id: String(r.id), image: typeof r.image === 'string' ? r.image : '' }))
    .filter((r) => r.id && r.image && /^https?:\/\//.test(r.image));

  if (rows.length === 0) {
    throw new Error('No recipes with image URLs found from Supabase Render');
  }

  const uniqueUrlCount = new Set(rows.map((r) => r.image)).size;
  console.log(`Recipes: ${rows.length} | Unique image URLs: ${uniqueUrlCount}`);

  const cache = new Map(); // url -> Buffer
  let ok = 0;
  let failed = 0;

  await runWithConcurrency(rows, 5, async (row, index) => {
    const outPath = path.join(OUT_DIR, `${row.id}.jpg`);

    try {
      let buf = cache.get(row.image);
      if (!buf) {
        buf = await downloadToBuffer(row.image);
        cache.set(row.image, buf);
      }

      await fs.writeFile(outPath, buf);
      ok++;
    } catch (e) {
      failed++;
      console.error(`[${index + 1}/${rows.length}] FAILED ${row.id} -> ${row.image}`);
      console.error(e);
    }

    if ((index + 1) % 25 === 0 || index === rows.length - 1) {
      console.log(`[${index + 1}/${rows.length}] progress | ok=${ok} failed=${failed}`);
    }
  });

  console.log(`Finished. Images written to: ${OUT_DIR}`);
  console.log(`ok=${ok} failed=${failed}`);
};

main().catch((e) => {
  console.error('Download failed:', e);
  process.exit(1);
});
