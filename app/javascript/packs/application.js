// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// import TurbolinksAdapter from 'vue-turbolinks'

// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

// window.store = {}
// Vue.use(TurbolinksAdapter)

// document.addEventListener('turbolinks:load', () => {
  //   // Call your functions here, e.g:
  //   // initSelect2();

  
  //     const app = new Vue({
  //       el: element,
        // data: window.store,
        // template: "<App :original_tasks='tasks' />",
  //       components: { App }
  //     })
  //   }
  // });

  // import Vue from 'vue'
  // import App from '../app.vue'
  
  // document.addEventListener('DOMContentLoaded', () => {
  //   const app = new Vue({
  //     render: h => h(App)
  //   }).$mount()
  //   document.body.appendChild(app.$el)
  
  //   console.log(app)
  // })


import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
// import Router from './router/router.js'
export const EventBus = new Vue();

window.store = {}
Vue.use(TurbolinksAdapter)

  document.addEventListener('turbolinks:load', () => {
    var element = document.querySelector("#project")
    if (element != undefined) {
      window.store.tasks = JSON.parse(element.dataset.tasks)
        const app = new Vue({
          el: element,
          data: window.store,
          template: "<App :original_tasks='tasks' />",
          components: { App }
        })
    }
  })
