<template>
  <img alt="Vue logo" src="../images/Logo_2.png" height="40" />

  <h1>Vue {{ msg }}</h1>

  <p>
    <a href="https://vitejs.dev/guide" target="_blank">
      Vite Documentation
    </a>
    |
    <a href="https://vuejs.org/guide" target="_blank">Vue 3 Documentation</a>
  </p>

  <button type="button" @click="state.count++">
    count is: {{ state.count }}
  </button>
  <p>
    Edit
    <code>components/HelloWorld.vue</code> to test hot module replacement.
  </p>
</template>

<script setup>
import { reactive } from 'vue'

defineProps({
  msg: String
})

const state = reactive({ count: 0 })
</script>

<style scoped>
a {
  color: #42b983;
}
</style>