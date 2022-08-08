package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yaolong.rbac.jwt.po.MenuItem;
import com.yaolong.rbac.jwt.po.MenuResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-08-03
 */
public interface SysMenuResourceMapper extends BaseMapper<SysMenuResource> {

    /**
     * 根据用户名获取菜单列表
     *
     * @param username
     * @return
     */
    List<MenuResource> getMenuResourceListByUsername(String username);

    /**
     * 根据角色获取菜单列表
     *
     * @param roleId
     * @return
     */
    List<MenuResource> getMenuResourceListByRoleId(Long roleId);

    /**
     * 根据角色获取菜单列表
     *
     * @param wrapper
     * @return
     */
    List<MenuResource> getList(@Param(Constants.WRAPPER) Wrapper<MenuResource> wrapper);


    /**
     * 根据角色获取菜单列表
     *
     * @param wrapper
     * @return
     */
    List<MenuItem> getMenuItems(@Param(Constants.WRAPPER) Wrapper<MenuItem> wrapper);


    /**
     * 菜单分页
     *
     * @param {page,wrapper}
     * @return
     */
    IPage<MenuResource> page(IPage<MenuResource> page, @Param(Constants.WRAPPER) Wrapper<MenuResource> wrapper);

}
