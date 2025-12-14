import { defineConfig } from 'vite'

export default defineConfig({
  base: '/starekino/sprite-editor/',
  server: {
    port: 3000,
    open: true
  },
  build: {
    outDir: 'dist'
  }
})
