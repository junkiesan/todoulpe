<template>
  <div id="app">
    <navheader></navheader>
    <tabProject></tabProject>
  </div>
</template>

<script>
import Header from './packs/components/Header.vue'
import Project from './packs/components/task/Project.vue'

export default {
  components: {
    navheader: Header,
    tabProject: Project
  }
  }
</script>

<style scoped>
  body {
    font-family: 'Space Mono', monospace;
    background: #e8f7f0
  }
  h1 {
    font-family: 'Amiri', serif;
  }
  p {
    font-family: 'Space Mono', monospace;
    font-size: 2em;
    text-align: center;
  }
</style>
