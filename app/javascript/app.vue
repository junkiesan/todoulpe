<template>
  <div id="app">
    <navheader></navheader>
    <p>Completed: <span id="counter">0</span>/{{tasks.length}}:</p>
    <progress class="progress-bar" value="0" max="100" id="taskProgress">0%</progress>

       <!-- NEW TASK FORM -->
    <div class="container border">
      <div class="row new">
        <form class="form-inline task-new" @submit.prevent="addTask">
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
          <div v-if="task.status === false" v-for="task in tasks" :key="task.id" class="task">
            <input type="checkbox"  v-on:change="doneTask(task.id)" v-model="task.status" />
            <label v-bind:id="'task_' + task.id">{{ task.title }} {{task.id}}</label>
            <label v-bind:id="'task_' + task.id">{{ task.priority }}</label>
            <label v-bind:id="'task_' + task.id">{{ task.deadline }}</label>
            <button v-bind:id="'task_' + task.id" v-on:click="destroyTask(id)">
              <i>Destroy</i>
            </button>
          </div>
        </ul>
        
  <!-- DISPLAY TASK  DONE  -->
        <ul class="container">
          <div v-if="task.status === true" v-for="task in tasks" :key="task.id" class="task-done">
              <input type="checkbox" />
              <label v-bind:for="'task_' + task.id">{{ task.title }} {{task.id}}</label>
              <label v-bind:for="'task_' + task.id">{{ task.priority }}</label>
              <label v-bind:for="'task_' + task.id">{{ task.deadline }}</label> 
          </div>
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
      completed: [],
    }
  },
  methods: {
    doneTask: function () {
      this.status = true
      var data = new FormData
      data.append("task[status]", this.status.true)
      Rails.ajax({
        url: `tasks/${this.task.id}`,
        type: "PATCH",
        data: data,
        dataType: "json",
        success: (data) => {
          const index = window.store.tasks.findIndex(task => task.id == this.task.id)
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
    destroyTask: function (id) {
      var data = new FormData
      data.append("task[id]", id)
        Rails.ajax({
          url: `/tasks/6`,
          type: "DELETE",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = window.store.tasks.findIndex(item => item.id == this.list.id)
            window.store.tasks[index].tasks.push(data)
          }
      })

    },
    progressBar:function () {
      if(data) {
        document.getElementById('counter').innerText--;
        document.getElementById('taskProgress').value-=(100 / tasks.length);
      } else {
        document.getElementById('counter').innerText++;
        document.getElementById('taskProgress').value+=(100 / tasks.length);
      }
    }
  },
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

  .progress-bar {
    display: flex;
    justify-content: center;
    border-radius: 10px;
    background: #3C2E58;
    background-color: #BCEED9;
    box-shadow: 1px 1px 4px rgba( 0, 0, 0, 0.2 );
    width: 75%;
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

  .task {
    border: 2px solid #3C2E58;
    border-radius: 10px;
    margin-bottom: 0.875rem;
    padding-left: 1rem;
  }

  .task-done {
    border: 3px solid #BCEED9;
    border-radius: 10px;
    padding-left: 1rem;
  }

  .task-new {
    border: 1px solid #F4B2B0;
    border-radius: 10px;
    margin: 1rem;
    padding: 0.875rem;
    width: 100%;
  }

</style>
