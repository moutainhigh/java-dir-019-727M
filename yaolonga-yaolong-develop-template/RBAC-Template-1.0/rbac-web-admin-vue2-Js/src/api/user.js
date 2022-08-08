import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName
 * @apiName
 * @url user
 * @description 描述
 * @date 2020/10/6 0:40
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################接口文件#################################################
 *###################################################################################################
 **/

/**
 * 退出登录
 */
export function logout() {
  return http({
    url: `${apiPrefix}/sys/user/logout`,
    method: 'post'
  })
}

/**
 * 登录
 * @param data{username,password}
 */
export function login(data) {
  return http({
    url: `${apiPrefix}/sys/user/login`,
    method: 'post',
    data
  })
}

/**
 * 获取信息
 *
 */
export function getInfo() {
  return http({
    url: `${apiPrefix}/sys/user/info`,
    method: 'get'
  })
}

/**
 * 获取菜单
 * @param id 色id
 */
export function getAuthMenu() {
  return http({
    url: `${apiPrefix}/sys/menu/auth/tree`,
    method: 'get'
  })
}

/**
 * @des 获取所有用户名
 */
export function getUsers() {
  return http({
    url: `${apiPrefix}/sys/user/list`,
    method: 'get'
  })
}
