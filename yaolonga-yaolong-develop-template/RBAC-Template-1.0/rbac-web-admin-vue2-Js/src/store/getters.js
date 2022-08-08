const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  username: state => state.user.username,
  email: state => state.user.email,
  site: state => state.user.site,
  id: state => state.user.id,
  roles: state => state.user.roles,
  role: state => state.user.highestRole,
  nickName: state => state.user.nickName,
  addRouters: state => state.menu.addRoutes,
  routes: state => state.menu.routes
}
export default getters
