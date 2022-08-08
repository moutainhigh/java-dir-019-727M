import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName Menu
 * @apiName 资源菜单
 * @prefixField request_core_business
 * @url auth/permission
 * @description description
 * @date 2020/10/19 10:31
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################资源菜单接口文件#################################################
 *###################################################################################################
 **/

/**
 * @des 分页获取资源菜单
 * @param params{current,size,keyword}
 */
export function getMenuByPage(params) {
  return http({
    url: `${apiPrefix}/sys/menu/page`,
    method: 'get',
    params
  })
}

/**
 * @des 获取资源菜单
 */
export function getMenuList() {
  return http({
    url: `${apiPrefix}/sys/menu/tree`,
    method: 'get'
  })
}

/**
 * @des 根据id获取资源菜单
 * @param id
 */
export function getMenuById(id) {
  return http({
    url: `${apiPrefix}/sys/menu/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据角色id获取资源菜单
 * @param id
 */
export function getMenuByRoleId(id) {
  return http({
    url: `${apiPrefix}/sys/menu/role/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据id删除资源菜单
 * @param id
 */
export function deleteMenuById(id) {
  return http({
    url: `${apiPrefix}/sys/menu/${id}`,
    method: 'delete'
  })
}

/**
 * @des 批量删除资源菜单
 * @param list{[]}
 */
export function deleteMenu(list) {
  return http({
    url: `${apiPrefix}/sys/menu/delete`,
    method: 'post',
    data: list
  })
}

/**
 * @des 更新资源菜单
 * @param data   更新资源菜单信息
 */
export function updateMenu(data) {
  return http({
    url: `${apiPrefix}/sys/menu`,
    method: 'put',
    data
  })
}

/**
 * @des 添加资源菜单
 * @param data   添加资源菜单
 */
export function createMenu(data) {
  return http({
    url: `${apiPrefix}/sys/menu`,
    method: 'post',
    data
  })
}

