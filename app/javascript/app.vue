<template>
  <div id="app">
    <li v-for="task in original_tasks" v-bind:key="task.id">
      <h1>{{ task.title }}</h1>
    </li>
    <p>Hello</p>
  </div>
</template>

<script>
export default {
  props: ["original_tasks"],
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
