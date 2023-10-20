import { defineConfig } from 'astro/config';
import node from '@astrojs/node';
import purgecss from 'astro-purgecss';

// https://astro.build/config
export default defineConfig({
  integrations: [purgecss()],
  output: 'server',
  adapter: node({
    mode: 'standalone',
  }),
});
