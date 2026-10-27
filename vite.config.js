import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import liveReload from 'vite-plugin-live-reload'
import path from 'node:path'
import tailwindcss from '@tailwindcss/vite'
import fs from 'node:fs'

// Tailwind reads its classes from templates/**/*.tpl, which are not part of the
// module graph: let `vite build --watch` rebuild when a template changes.
const watchTemplates = {
    name: 'watch-templates',
    buildStart() {
        if (!this.meta.watchMode) return;
        for (const file of fs.globSync('templates/**/*.tpl', { cwd: __dirname })) {
            this.addWatchFile(path.resolve(__dirname, file));
        }
    },
};

export default defineConfig({
    root: './src',
    plugins: [
        vue(),
        tailwindcss(),
        watchTemplates,
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'src'),
            vue: 'vue/dist/vue.esm-bundler.js'
        },
    },
    build: {
        outDir: '../dist',
        emptyOutDir: true,
        manifest: true,
        // our entry
        rollupOptions: {
            input: path.resolve(__dirname, 'src/main.js'),
        }
    },
});
