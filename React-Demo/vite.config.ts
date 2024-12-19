import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/sqlbe': {
        target: 'http://13.233.232.244:8080', // your backend server URL
        changeOrigin: true,  // To avoid issues with origin
        rewrite: (path) => path.replace(/^\/sqlbe/, ''), // Remove `/sqlbe` prefix
      },
    },
  },
})
