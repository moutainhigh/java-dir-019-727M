package com.yaolong.rbac.jwt.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.dto.vbenAdmin.PermissionNode;
import com.yaolong.rbac.jwt.dto.vbenAdmin.PermissionDto;
import com.yaolong.rbac.jwt.vo.PermissionParam;

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

    /**
     * 获取接口权限树（接口权限树不是真的树是由接口权限为子级，以接口权限所在的类别为父级）
     * @param
     * @return java.util.List<com.yaolong.rbac.jwt.dto.vbenAdmin.PermissionNode>
     * @author yaolong
     * @date 2021/8/13 18:27
     */
    List<PermissionNode> getPermissionTree();

    /**
     * @description 获取列表
     * @param
     * @return java.util.List<com.yaolong.rbac.jwt.po.Permission>
     * @author yaolong
     * @date 2021/8/15 17:12
     */
    List<PermissionDto> getList(PermissionParam param);

    /**
     * @description  分页获取
     * @param current
     * @return java.util.List<com.yaolong.rbac.jwt.dto.vbenAdmin.Permission>
     * @author yaolong
     * @date 2021/8/15 17:16
     */
    IPage<PermissionDto> getPage(int current, int size, PermissionParam param);
}
