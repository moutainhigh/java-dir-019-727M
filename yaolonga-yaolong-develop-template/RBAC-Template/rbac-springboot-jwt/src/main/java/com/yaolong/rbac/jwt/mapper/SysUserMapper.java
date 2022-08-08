package com.yaolong.rbac.jwt.mapper;

import com.yaolong.rbac.jwt.domain.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yaolong.rbac.jwt.po.elementAdmin.User;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
    /**
     * 获取用户
     * @param username
     * @return
     */
    User findByUserName(String username);
}
