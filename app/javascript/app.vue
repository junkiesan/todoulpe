<template>
  <div id="app">
    <p>{{ message }}</p>
    <p><strong><i>Hello World</i></strong></p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-family: 'Amiri', serif;
  font-size: 2em;
  text-align: center;
}
</style>
