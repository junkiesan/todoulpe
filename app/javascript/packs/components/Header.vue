<template>
  <div>
    <h1>{{ appName }}</h1>
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

</style>