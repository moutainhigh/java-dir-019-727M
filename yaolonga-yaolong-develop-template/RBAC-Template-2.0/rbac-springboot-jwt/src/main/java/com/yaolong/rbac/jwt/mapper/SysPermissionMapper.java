package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.po.Permission;
import org.apache.ibatis.annotations.Param;

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
     * 权限列表
     * @return
     * @param wrapper
     */
    List<Permission> getPermissionList(@Param(Constants.WRAPPER) Wrapper<Permission> wrapper);

    /**
     * 权限列表
     * @param page
     * @param wrapper
     * @return
     */
    IPage<Permission> getPermissionPage(IPage<Permission> page, @Param(Constants.WRAPPER) Wrapper<Permission> wrapper);

    /**
     * 根据角色id获取接口权限列表
     * @param roleId
     * @return
     */
    List<SysPermission> getPermissionListByRoleId(Long roleId);


}
