<template>
  <div id="app">
    <li v-for="task in original_tasks" v-bind:key="task.id">
      <h1>{{ task.title }}</h1>
    </li>
  </div>
</template>

<script>
import Rails from '@rails/ujs';

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
