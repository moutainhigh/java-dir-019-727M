import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName Role
 * @apiName 角色
 * @prefixField request_core_business
 * @url auth/role
 * @description description
 * @date 2020/10/19 10:19
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################角色接口文件#################################################
 *###################################################################################################
 **/

/**
 * @des 获取角色
 */
export function getRole() {
  return http({
    url: `${apiPrefix}/sys/role/list`,
    method: 'get'
  })
}

/**
 * @des 根据用户id获取角色列表
 */
export function getRoleListByUserId(id) {
  return http({
    url: `${apiPrefix}/sys/role/list/userId/${id}`,
    method: 'get'
  })
}

/**
 * @des 分页获取角色
 * @param params{current,size,keyword}
 */
export function getRoleByPage(params) {
  return http({
    url: `${apiPrefix}/sys/role/page`,
    method: 'get',
    params
  })
}

/**
 * @des 根据id获取角色
 * @param id
 */
export function getRoleById(id) {
  return http({
    url: `${apiPrefix}/sys/role/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据id删除角色
 * @param id
 */
export function deleteRoleById(id) {
  return http({
    url: `${apiPrefix}/sys/role/${id}`,
    method: 'delete'
  })
}

/**
 * @des 批量删除角色
 * @param list{[]}
 */
export function deleteRole(list) {
  return http({
    url: `${apiPrefix}/sys/role/batch`,
    method: 'delete',
    data: list
  })
}

/**
 * @des 更新角色
 * @param data   更新角色信息
 */
export function updateRole(data) {
  return http({
    url: `${apiPrefix}/sys/role`,
    method: 'put',
    data
  })
}

/**
 * @des 添加角色
 * @param data   添加角色
 */
export function createRole(data) {
  return http({
    url: `${apiPrefix}/sys/role`,
    method: 'post',
    data
  })
}

/**
 * @des 分配菜单
 * @param data   分配菜单
 */
export function allotMenu(data) {
  return http({
    url: `${apiPrefix}/sys/role/allot/menu`,
    method: 'post',
    data
  })
}

/**
 * @des 分配资源权限
 * @param data   分配资源
 */
export function allotPermission(data) {
  return http({
    url: `${apiPrefix}/sys/role/allot/permission`,
    method: 'post',
    data
  })
}

