package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.po.Permission;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    /**
     * 根据用户id获取接口权限列表
     * @param userId
     * @return
     */
    List<Permission> getPermissionListByUserId(Long userId);

    /**
     * 根据角色id获取接口权限列表
     * @param roleId
     * @return
     */
    List<SysPermission> getPermissionListByRoleId(Long roleId);


}
