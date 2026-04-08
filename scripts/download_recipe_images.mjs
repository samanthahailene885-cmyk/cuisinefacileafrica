import fs from 'node:fs/promises';
import path from 'node:path';

const projectRoot = process.cwd();

const SQL_PATH = path.join(projectRoot, 'supabase', 'insert_all_recipes.sql');
const OUT_DIR = path.join(projectRoot, 'src', 'public', 'recipes');

const parseSqlString = (raw) => raw.replace(/''/g, "'");

const extractRecipeImages = (sql) => {
  // Capture 4 first SQL strings in each VALUES tuple:
  // ( 'id', 'title', 'description', 'image', ... )
  // SQL string allows doubled quotes '' inside.
  const re = /\(\s*'((?:''|[^'])*)'\s*,\s*'((?:''|[^'])*)'\s*,\s*'((?:''|[^'])*)'\s*,\s*'((?:''|[^'])*)'\s*,/g;

  const rows = [];
  let m;
  while ((m = re.exec(sql)) !== null) {
    const id = parseSqlString(m[1]).trim();
    const image = parseSqlString(m[4]).trim();

    // Heuristic: recipe UUID + image URL
    if (/^[0-9a-fA-F-]{36}$/.test(id) && /^https?:\/\//.test(image)) {
      rows.push({ id, image });
    }
  }

  // Dedupe by id (keep first)
  const byId = new Map();
  for (const r of rows) {
    if (!byId.has(r.id)) byId.set(r.id, r);
  }
  return Array.from(byId.values());
};

const downloadToBuffer = async (url) => {
  const res = await fetch(url, {
    redirect: 'follow',
    headers: {
      'User-Agent': 'cuisinefacile-image-downloader',
      Accept: 'image/*,*/*;q=0.8',
    },
  });
  if (!res.ok) {
    throw new Error(`HTTP ${res.status} for ${url}`);
  }
  const arrayBuffer = await res.arrayBuffer();
  return Buffer.from(arrayBuffer);
};

const main = async () => {
  const sql = await fs.readFile(SQL_PATH, 'utf8');
  const recipes = extractRecipeImages(sql);

  if (recipes.length === 0) {
    throw new Error('No recipe images found in insert_all_recipes.sql');
  }

  await fs.mkdir(OUT_DIR, { recursive: true });

  const cache = new Map(); // url -> Buffer

  let ok = 0;
  let failed = 0;

  for (let i = 0; i < recipes.length; i++) {
    const { id, image } = recipes[i];
    const outPath = path.join(OUT_DIR, `${id}.jpg`);

    try {
      let buf = cache.get(image);
      if (!buf) {
        buf = await downloadToBuffer(image);
        cache.set(image, buf);
      }

      await fs.writeFile(outPath, buf);
      ok++;
    } catch (e) {
      failed++;
      console.error(`[${i + 1}/${recipes.length}] FAILED ${id} -> ${image}`);
      console.error(e);
    }

    if ((i + 1) % 10 === 0 || i === recipes.length - 1) {
      console.log(`[${i + 1}/${recipes.length}] done | ok=${ok} failed=${failed}`);
    }
  }

  console.log(`Finished. Images written to: ${OUT_DIR}`);
  console.log(`ok=${ok} failed=${failed}`);
};

main().catch((e) => {
  console.error('Download failed:', e);
  process.exit(1);
});
