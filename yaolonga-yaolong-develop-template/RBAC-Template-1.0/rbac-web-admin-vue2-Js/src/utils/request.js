import axios from 'axios'
import { MessageBox, Message } from 'element-ui'
import store from '@/store'
import { getToken } from '@/utils/auth'

const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
  timeout: 5000 // request timeout
})

service.interceptors.request.use(
  config => {
    if (store.getters.token) {
      config.headers['Authorization'] = 'Bearer ' + getToken()
    }
    return config
  },
  error => {
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

service.interceptors.response.use(
  response => {
    const res = response.data

    if (res.code !== 20000) {
      console.log(res.code)

      switch (res.code) {
        case 70001:
          Message.info('当前接口无权限访问，请联系管理员')
          break
        case 70002:
          MessageBox.confirm('当前Token无效请重新登录', '确认登出', {
            confirmButtonText: '重新登入',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            store.dispatch('user/resetToken').then(() => {
              location.reload()
            })
          })
          break
        case 20001:
          MessageBox.confirm('当前用户未登录，请登录！', '确认登出', {
            confirmButtonText: '登录',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            store.dispatch('user/resetToken').then(() => {
              location.reload()
            })
          })
          break
        default:
          Message({
            message: res.message || 'Error',
            type: 'error',
            duration: 5 * 1000
          })
          break
      }
      return Promise.reject(new Error(res.message || 'Error'))
    } else {
      return res
    }
  },
  error => {
    const res = error
    console.log(res)
    console.log('err' + error) // for debug
    Message({
      message: error.message,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)

export default service
