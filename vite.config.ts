import path from 'path';
import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, '.', '');
    return {
      server: {
        port: 3000,
        host: '0.0.0.0',
        proxy: {
          '/api': {
            target: 'http://localhost/cuisinefacile/php-api/api',
            changeOrigin: true,
            secure: false,
            rewrite: (p) => p.replace(/^\/api/, ''),
          },
        },
      },
      preview: {
        host: true,
        port: 3000,
        strictPort: true,
        allowedHosts: ['cuisinefacile-africa.onrender.com', 'localhost']
      },
      publicDir: 'src/public',
      plugins: [react()],
      define: {
        'process.env.API_KEY': JSON.stringify(env.GEMINI_API_KEY),
        'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
      },
      resolve: {
        alias: {
          '@': path.resolve(__dirname, './src'),
        }
      }
    };
});
