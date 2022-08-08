import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName Resource
 * @apiName 资源权限
 * @prefixField request_core_business
 * @url auth/resource
 * @description description
 * @date 2020/10/22 19:40
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################资源接口文件#################################################
 *###################################################################################################
 **/

/**
 * @des 获取资源权限
 */
export function getPermission() {
  return http({
    url: `${apiPrefix}/sys/permission/list`,
    method: 'get'
  })
}

/**
 * @des 分页获取资源权限
 * @param params
 */
export function getPermissionByPage(params) {
  return http({
    url: `${apiPrefix}/sys/permission/page`,
    method: 'get',
    params
  })
}

/**
 * @des 根据id获取资源权限
 * @param id
 */
export function getPermissionById(id) {
  return http({
    url: `${apiPrefix}/sys/permission/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据id删除资源权限
 * @param id
 */
export function deletePermissionById(id) {
  return http({
    url: `${apiPrefix}/sys/permission/${id}`,
    method: 'delete'
  })
}

/**
 * @des 根据角色id获取资源权限列表
 * @param id
 */
export function getPermissionByRoleId(id) {
  return http({
    url: `${apiPrefix}/sys/permission/list/role/${id}`,
    method: 'get'
  })
}

/**
 * @des 更新资源权限
 * @param data   更新资源权限信息
 */
export function updatePermission(data) {
  return http({
    url: `${apiPrefix}/sys/permission`,
    method: 'put',
    data
  })
}

/**
 * @des 添加资源权限
 * @param data   添加资源权限
 */
export function createPermission(data) {
  return http({
    url: `${apiPrefix}/sys/permission`,
    method: 'post',
    data
  })
}

