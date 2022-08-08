package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.po.Role;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 根据用户id获取用户角色列表
     * @param userId
     * @return
     */
    List<Role> getRolesByUserId(Long userId);

    /**
     * 根据用户名称获取用户角色列表
     * @param username
     * @return
     */
    List<Role> getRolesByUsername(String username);
}
