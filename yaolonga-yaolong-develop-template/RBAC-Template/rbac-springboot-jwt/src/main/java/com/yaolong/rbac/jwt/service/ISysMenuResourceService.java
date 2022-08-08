package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.dto.elementAdmin.MenuResourceNode;
import com.yaolong.rbac.jwt.po.elementAdmin.MenuResource;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysMenuResourceService extends IBaseService<SysMenuResource> {


    /**
     * 根据用户名获取菜单树
     * @return
     */
    List<MenuResourceNode> treeListByUsername();

    /**
     * 根据角色id获取菜单列表
     * @param roleId
     * @return List<MenuResource>
     */
    List<MenuResource> listByRoleId(Long roleId);

    /**
     * 获取菜单树
     * @return
     */
    List<MenuResourceNode> treeList();

}
