<template>
  <div class="container border">
    <!-- NEW TASK FORM -->
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
        <li></li>
      </ul>
    </div>
    <!-- DISPLAY TASK NOT DONE  -->
    <!-- <div>
      <ul class="container">
        <li v-for="task in listTasks" :key="task.status">
          <input type="checkbox" v-bind:id="'task_' + task.id" v-on:change="doneTask(task.id)" />
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.name }}</label>
        </li>
      </ul>
    </div> -->
  </div>
</template>

<script>
// import axios from 'axios';
import Rails from '@rails/ujs';

export default {
  data: function () {
    return {
      listTasks: this.original_tasks,
      newTask: '',
      todo: [],
      completed: [],
    }
  },
  methods: {
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
    checkStatus: function () {
      if(task.status === false){
        this.todo.push(this.task)
      } else {
        this.completed.push(this.task)
      }
    },
    fillTasks: function () {

    }
  }
}
</script>

<style>
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