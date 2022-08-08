package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.dto.RoleDto;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysRoleService extends IBaseService<SysRole> {

    /**
     * 分配菜单资源
     * @param allotMenuParam
     * @return
     */
    boolean allotMenu(AllotMenuParam allotMenuParam);

    /**
     * 分配接口权限资源
     * @param allotPermissionParam
     * @return
     */
    boolean allotPermission(AllotPermissionParam allotPermissionParam);


    /**
     * 根据用户名获取用户角色列表
     * @param username
     * @return
     */
    List<RoleDto> getRoleListByUsername(String username);

    /**
     * 根据用户ID获取用户角色列表
     * @param userId
     * @return
     */
    List<RoleDto> getRoleListByUserId(Long userId);

}
