<template>
  
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
  }
}
</script>

<style>

</style>