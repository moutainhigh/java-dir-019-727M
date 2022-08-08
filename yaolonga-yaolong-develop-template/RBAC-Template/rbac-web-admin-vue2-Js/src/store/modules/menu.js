import { asyncRoutes, constantRoutes } from '@/router'
import { getAuthMenu } from '@/api/user'
import Layout from '@/layout'

/**
 * 后台查询的菜单数据拼装成路由格式的数据
 * @param  routes
 */
export function generaMenu(routes, data) {
  data.forEach(item => {
    // alert(JSON.stringify(item))
    const menu = {
      path: item.url,
      component: item.component === 'Layout' ? Layout : (resolve) => require([`@/views${item.component}/index`], resolve),
      hidden: item.hidden,
      children: [],
      name: item.title,
      meta: { title: item.title, id: item.id, icon: item.icon ? item.icon : 'dashboard' }
    }
    if (item.children) {
      generaMenu(menu.children, item.children)
    }
    routes.push(menu)
  })
}

const state = {
  routes: [],
  addRoutes: []
}

const mutations = {
  SET_ROUTES: (state, routes) => {
    state.addRoutes = routes
    state.routes = constantRoutes.concat(routes)
  },
  RESET_ROUTES: (state, defaultRoutes) => {
    state.addRoutes = []
    state.routes = defaultRoutes
  }
}

const actions = {
  generateRoutes({ commit }, roles) {
    return new Promise(resolve => {
      // 获取权限最高的角色
      const loadMenuData = []
      // 先查询后台并返回左侧菜单数据并把数据添加到路由
      getAuthMenu().then(response => {
        const data = response.data
        Object.assign(loadMenuData, data)
        generaMenu(asyncRoutes, loadMenuData)
        asyncRoutes.push({ path: '*', redirect: '/404', hidden: true })
        commit('SET_ROUTES', asyncRoutes)
        resolve(asyncRoutes)
      }).catch(error => {
        console.log(error)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
