<template>
  <div id="app">
    <h1><strong><i>{{ message }}</i></strong></h1>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Todoulpe"
    }
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
