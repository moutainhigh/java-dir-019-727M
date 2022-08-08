package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.jwt.domain.SysMenuResourceVben;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuItemNode;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuResourceNode;
import com.yaolong.rbac.jwt.po.vbenAdmin.MenuResource;
import com.yaolong.rbac.jwt.vo.MenuParams;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-03
 */
public interface ISysMenuResourceVbenService extends IBaseService<SysMenuResourceVben> {
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

    /**
     * 获取菜单树(meta合并之后的菜单)
     *  @param params
     * @return
     */
    List<MenuItemNode> treeMenus(MenuParams params);


    /**
     * 获取菜单页面按钮权限
     * @return
     */
    List<String> getPermissionCode();
}
