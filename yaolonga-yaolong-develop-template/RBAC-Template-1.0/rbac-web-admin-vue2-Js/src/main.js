import Vue from 'vue'
import App from './App.vue'
import 'normalize.css/normalize.css' // A modern alternative to CSS resets
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/styles/index.scss' // global css
import store from './store'
import router from './router'

import '@/icons' // icon
import '@/permission' // permission control

Vue.use(ElementUI)
Vue.config.productionTip = false

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
