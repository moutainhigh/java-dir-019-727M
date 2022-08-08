package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.domain.SysPermission;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysPermissionService extends IBaseService<SysPermission> {

    /**
     * 根据角色id获取接口权限列表
     * @param roleId
     * @return
     */
    List<SysPermission> getPermissionListByRoleId(Long roleId);
}
