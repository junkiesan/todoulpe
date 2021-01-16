<template>
  <div class="container">
    <h1><strong><i>{{ appName }}</i></strong></h1>
    <h2>La todo des PM qui gèrent leurs features comme des poulpes !</h2>
    <div class="projectGroup">
      <p>Projet: {{ projectName }}</p>
      <form class="form-inline" @submit.prevent="formSubmitted" v-if="projectName.length < 1">
        <input type="text" id="projectName" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Type name here..." v-model="newNameText" @keyup.space="keyPressed">
      </form>
    </div>
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
      }
    }
  },
  components: {
    // ccTaskProgress: TaskProgress
  }
}
</script>

<style>
  h1 {
    display: flex;
    justify-content: center;
  }
  h2 {
    font-family: 'Space Mono', monospace;
    font-size: 32px;
  }
  p {
    font-family: 'Space Mono', monospace;
    font-size: 18px;
  }
  .projectGroup {
    margin-left: 10em;
  }
</style>