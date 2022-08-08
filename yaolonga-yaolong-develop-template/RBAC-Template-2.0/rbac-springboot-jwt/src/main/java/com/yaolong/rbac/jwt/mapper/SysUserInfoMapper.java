package com.yaolong.rbac.jwt.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.po.UserInfo;
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
public interface SysUserInfoMapper extends BaseMapper<SysUserInfo> {


    /**
     * 获取用户信息
     * @description
     * @param wrapper
     * @return com.yaolong.rbac.jwt.po.vbenAdmin.RoleInfoDto
     * @author yaolong
     * @date 2021/8/2 16:24
     */
    UserInfo getUserInfo(@Param(Constants.WRAPPER) Wrapper<UserInfo> wrapper);

    /**
     * 根据用户名称获取用户信息
     * @description
     * @param username
     * @return com.yaolong.rbac.jwt.po.vbenAdmin.RoleInfoDto
     * @author yaolong
     * @date 2021/8/2 16:24
     */
    UserInfo getUserInfoByName(String username);

    /**
     * 获取用户信息list
     * @description
     * @param wrapper
     * @author yaolong
     * @date 2021/8/2 16:24
     */
    List<UserInfo> list(@Param(Constants.WRAPPER) Wrapper<UserInfo> wrapper);


    /**
     * 分页获取用户信息
     * @description
     * @param wrapper
     * @author yaolong
     * @date 2021/8/2 16:24
     */
    IPage<UserInfo> page(IPage<UserInfo> page,@Param(Constants.WRAPPER) Wrapper<UserInfo> wrapper);
}
