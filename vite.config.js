import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import liveReload from 'vite-plugin-live-reload'
import path from 'node:path'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
    root: './src',
    plugins: [
        vue(),
        tailwindcss(),
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
