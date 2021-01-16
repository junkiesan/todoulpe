<template>
  <div class="container">
    <!-- NEW TASK FORM -->
    <div class="row new">
      <form class="form-inline">
        <button v-on:click="createTask">
          <i class="material-icons">add</i>
        </button>
        <label class="sr-only" for="inline-email">Titre</label>
        <input type="text" class="form-control mb-2 mr-sm-2" id="inline-email new-task-form" placeholder="Votre tâche" v-model="newTask" required>

        <label class="sr-only" for="inline-password">Priorité</label>
        <select class="form-control" id="exampleFormControlSelect1">
          <option>chill</option>
          <option>work</option>
          <option>harcore</option>
        </select>

        <label class="sr-only" for="inline-password">Date limite</label>
        <input type="date" class="form-control mb-2 mr-sm-2" id="inline-password">
      </form>
    </div>
    <!-- DISPLAY TASK NOT DONE  -->
    <!-- <div>
      <ul class="collection">
        <li v-bind:id="'row_task_' + task.id" class="collection-item" v-for="task in tasks" v-if="!task.is_done">
          <input type="checkbox" v-bind:id="'task_' + task.id" v-on:change="doneTask(task.id)" />
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.name }}</label>
        </li>
      </ul>
    </div> -->
    <!-- DISPLAY TASK NOT DONE  -->
    <!-- <div>
      <ul class="collection">
        <li v-bind:id="'row_task_' + task.id" class="collection-item" v-for="task in tasks" v-if="!task.is_done">
          <input type="checkbox" v-bind:id="'task_' + task.id" v-on:change="doneTask(task.id)" />
          <label v-bind:for="'task_' + task.id" class="word-color-black">{{ task.name }}</label>
        </li>
      </ul>
    </div> -->
  </div>
</template>

<script>
// import axios from 'axios';

export default {
  data: function () {
    return {
      tasks: [],
      newTask: ''
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
</style>