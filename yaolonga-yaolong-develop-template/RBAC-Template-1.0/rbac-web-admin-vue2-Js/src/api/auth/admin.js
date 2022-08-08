import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName Admin
 * @apiName 用户
 * @prefixField request_core_business
 * @url auth/user
 * @description description
 * @date 2020/10/19 10:13
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################用户接口文件#################################################
 *###################################################################################################
 **/

/**
 * @des 分页获取用户
 * @param params{current,size,keyword}
 */
export function getAdminByPage(params) {
  return http({
    url: `${apiPrefix}/sys/user/page`,
    method: 'get',
    params
  })
}

/**
 * @des 根据id获取用户
 * @param id
 */
export function getAdminById(id) {
  return http({
    url: `${apiPrefix}/sys/user/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据id删除用户
 * @param id
 */
export function deleteAdminById(id) {
  return http({
    url: `${apiPrefix}/sys/user/${id}`,
    method: 'delete'
  })
}

/**
 * @des 批量删除用户
 * @param list{[]}
 */
export function deleteAdmin(list) {
  return http({
    url: `${apiPrefix}/sys/user/batch`,
    method: 'post',
    data: list
  })
}

/**
 * @des 更新用户
 * @param data   更新用户信息
 */
export function updateAdmin(data) {
  return http({
    url: `${apiPrefix}/sys/user`,
    method: 'put',
    data
  })
}
/**
 * @des 添加用户
 * @param data   添加用户
 */
export function createAdmin(data) {
  return http({
    url: `${apiPrefix}/sys/user`,
    method: 'post',
    data
  })
}

/**
 * @des 分配角色
 * @param data   分配角色
 */
export function allotRole(data) {
  return http({
    url: `${apiPrefix}/sys/user/allot/role`,
    method: 'post',
    data
  })
}

