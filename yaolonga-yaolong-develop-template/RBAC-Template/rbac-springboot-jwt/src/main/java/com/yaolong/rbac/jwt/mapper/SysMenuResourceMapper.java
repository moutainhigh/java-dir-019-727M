package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.po.elementAdmin.MenuResource;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface SysMenuResourceMapper extends BaseMapper<SysMenuResource> {


    /**
     * 根据用户名获取菜单列表
     * @param username
     * @return
     */
    List<MenuResource> getMenuResourceListByUsername(String username);

    /**
     * 根据角色获取菜单列表
     * @param roleId
     * @return
     */
    List<MenuResource> getMenuResourceListByRoleId(Long roleId);

}
