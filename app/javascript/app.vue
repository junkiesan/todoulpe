<template>
  <div id="app">
    <navheader></navheader>
       <!-- NEW TASK FORM -->
    <div class="container border">
      <div class="row new">
        <form class="form-inline" @submit.prevent="addTask">
          <button v-on:click="addTask">
            <i class="material-icons">add</i>
          </button>
          <label class="sr-only" for="inline-email">Titre</label>
          <input type="text" class="form-control mb-2 mr-sm-2" id="inline-email new-task-form" placeholder="Votre tâche" v-model="newTask" required>

          <label class="sr-only" for="inline-password">Priorité</label>
          <select class="form-control" id="exampleFormControlSelect1" v-model="newTaskPriority" >
            <option>chill</option>
            <option>work</option>
            <option>harcore</option>
          </select>

          <label class="sr-only" for="inline-password">Date limite</label>
          <input type="date" class="form-control mb-2 mr-sm-2" id="inline-password" v-model="newTaskDeadline">
        </form>
      </div>

  <!-- DISPLAY TASK NOT DONE  -->
      <div>
        <ul class="container">
          <li v-if="task.status === false" v-for="task in tasks" :key="task.id">
            <input type="checkbox"  v-on:change="doneTask(task.id)" v-model="task.status" />
            <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.title }}</label>
            <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.priority }}</label>
            <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.deadline }}</label>
          </li>
        </ul>
        
  <!-- DISPLAY TASK  DONE  -->
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
  </div>
</template>

<script>
import Rails from '@rails/ujs';
import Header from './packs/components/Header.vue'

export default {
  components: {
    navheader: Header,
  },
  props: ['original_tasks'],
  data: function () {
    return {
      tasks: this.original_tasks,
      status: false,
      newTask: '',
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
    addTask: function () {
      var data = new FormData
      data.append("task[title]", this.newTask)
      data.append("task[deadline]", this.newTaskDeadline)
      data.append("task[priority]", this.newTaskPriority)
      
      Rails.ajax({
          url: "/tasks",
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = window.store.tasks.findIndex(item => item.id == this.list.id)
            window.store.tasks[index].tasks.push(data)
            this.message = ""
            this.$nextTick(() => { this.$refs.newTask.focus() })
            this.$nextTick(() => { this.$refs.newTaskDeadline.focus() })
            this.$nextTick(() => { this.$refs.newTaskPriority.focus() })
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

  .new {
    display: flex;
    flex-direction: row;
    align-items: center
  }

  .border {
    border: 10px solid #BCEED9;
    border-radius: 5px;
  }
</style>
