<template>
  <div class="container">
    <h1><strong><i>{{ appName }}</i></strong></h1>
    <p>La todo des PM qui gèrent leurs features comme des poulpes !</p>
    <p>Projet: {{ projectName }}</p>
    <form class="form-inline" @submit.prevent="formSubmitted">
      <input type="text" id="projectName" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Type name here..." v-model="newNameText" @keyup.space="keyPressed">
    </form>
  </div>
  <!-- <cc-task-progress></cc-task-progress> -->
</template>

<script>
// import TaskProgress from './task/TaskProgress.vue'

export default {
  data: function (){
    return {
      appName: 'Todoulpe',
      projectName: ''
    }
  },
  methods: {
    formSubmitted: function() {
      const input = document.getElementById('projectName')
      if(this.newNameText.length > 0) {
        this.projectName = this.newNameText
        this.newNameText = ''
        input.display.destroy
      }
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
</style>