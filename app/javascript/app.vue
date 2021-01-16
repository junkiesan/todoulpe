<template>
  <div id="app">
    <navheader></navheader>
    <tabProject></tabProject>
    <div>
      <ul class="container">
        <li v-if="task.status === false" v-for="task in tasks" :key="task.id">
          <input type="checkbox"  v-on:change="doneTask(task.id)" v-model="task.status" />
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.title }}</label>
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.priority }}</label>
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.deadline }}</label>
        </li>
      </ul>
      <ul class="container">
        <li v-if="task.status === true" v-for="task in tasks" :key="task.id">
          <input type="checkbox" />
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.title }}</label>
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.priority }}</label>
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.deadline }}</label>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import Rails from '@rails/ujs';
import Header from './packs/components/Header.vue'
import Project from './packs/components/task/Project.vue'

export default {
  components: {
    navheader: Header,
    tabProject: Project
  },
  props: ['original_tasks'],
  data: function () {
    return {
      tasks: this.original_tasks,
      status: false,
    }
  },
  methods: {
    doneTask: function () {
      this.status = true
      var data = new FormData
      data.append("task[status]", this.status)
      Rails.ajax({
        url: `tasks/${task.id}`,
        type: "PATCH",
        data: data,
        dataType: "json",
        success: (data) => {
          const index = window.store.tasks.findIndex(item => item.id == this.task.id)
          window.store.tasks[index].tasks.push(data)
          this.message = ""
          this.$nextTick(() => { this.$refs.newStatus.focus() })
        }
      })
    },
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
