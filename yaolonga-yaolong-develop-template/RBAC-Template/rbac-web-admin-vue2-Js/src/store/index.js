import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters.js'
Vue.use(Vuex)
const files = require.context('./modules', false, /\.js$/)
const modules = {}
files.keys().forEach(key => {
  const item = files(key).default
  key = key.replace('./', '').replace('.js', '')
  modules[key] = item
})
const store = new Vuex.Store({
  modules: modules,
  getters
})
export default store