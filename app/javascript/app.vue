<template>
  <div id="app">
    <navheader></navheader>
    <p>Hello</p>
  </div>
</template>

<script>
import Header from './packs/components/Header.vue'

export default {
  components: {
    navheader: Header
  }
  }
</script>

<style scoped>
body {
  font-family: 'Space Mono', monospace;
}
h1 {
  font-family: 'Amiri', serif;
}
p {
  font-size: 2em;
  text-align: center;
}

</style>
