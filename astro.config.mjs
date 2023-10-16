import { defineConfig } from 'astro/config';
import nodejs from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
  output: 'hybrid',
  adapter: nodejs({
    mode: 'middleware'
  }),
});
