import http from '@/utils/request'
import { apiPrefix } from '@/config/apiConfig'
/**
 * @methodName ResourceCate
 * @apiName 资源分类
 * @prefixField request_core_business
 * @url auth/resource/category
 * @description description
 * @date 2020/10/22 19:49
 * @author yaolong
 **/

/**
 *###################################################################################################
 *##################################资源分类接口文件#################################################
 *###################################################################################################
 **/

/**
 * @des 获取资源分类
 */
export function getPermissionCate() {
  return http({
    url: `${apiPrefix}/sys/permission/category/list`,
    method: 'get'
  })
}

/**
 * @des 分页获取资源分类
 */
export function getPermissionCateByPage(params) {
  return http({
    url: `${apiPrefix}/sys/permission/category/page`,
    method: 'get',
    params
  })
}

/**
 * @des 根据id获取资源分类
 * @param id
 */
export function getPermissionCateById(id) {
  return http({
    url: `${apiPrefix}/sys/permission/category/${id}`,
    method: 'get'
  })
}

/**
 * @des 根据id删除资源分类
 * @param id
 */
export function deletePermissionCateById(id) {
  return http({
    url: `${apiPrefix}/sys/permission/category/${id}`,
    method: 'delete'
  })
}

/**
 * @des 更新资源分类
 * @param data   更新资源分类信息
 */
export function updatePermissionCate(data) {
  return http({
    url: `${apiPrefix}/sys/permission/category`,
    method: 'put',
    data
  })
}

/**
 * @des 添加资源分类
 * @param data   添加资源分类
 */
export function createPermissionCate(data) {
  return http({
    url: `${apiPrefix}/sys/permission/category`,
    method: 'post',
    data
  })
}

