<template>
  <div class="container">
    <h1><strong><i>{{ appName }}</i></strong></h1>
    <p>La todo des PM qui gèrent leurs features comme des poulpes !</p>
    <p>Projet:</p>
    <input type="text" id="projectName" placeholder="Type name here...">
  </div>
  <!-- <cc-task-progress></cc-task-progress> -->
</template>

<script>
// import TaskProgress from './task/TaskProgress.vue'

export default {
  data: function (){
    return {
      appName: 'Todoulpe'
    }
  },
  components: {
    // ccTaskProgress: TaskProgress
  }
}
</script>

<style>
  p {
    font-family: 'Space Mono', monospace;
  }
  .container {
    max-width: 1100px;
    margin: auto;
    overflow: auto;
    padding: 0 2rem;
  }
</style>