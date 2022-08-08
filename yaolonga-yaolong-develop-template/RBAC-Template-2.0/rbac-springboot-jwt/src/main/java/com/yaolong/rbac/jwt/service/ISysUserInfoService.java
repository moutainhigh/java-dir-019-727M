package com.yaolong.rbac.jwt.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto;
import com.yaolong.rbac.jwt.vo.UserParams;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysUserInfoService extends IBaseService<SysUserInfo> {

    /**
     * 根据用户名查询用户信息
     *
     * @param username
     * @return com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto
     * @description
     * @author yaolong
     * @date 2021/8/2 16:31
     */
    UserInfoDto userInfoByName(String username);


    /**
     * 获取上下文的用户信息
     *
     * @return com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto
     * @description
     * @author yaolong
     * @date 2021/8/2 16:31
     */
    UserInfoDto userInfoByContext();


    /**
     * @param current
     * @param size
     * @param params
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto>
     * @description 分页查询用户列表
     * @author yaolong
     * @date 2021/8/9 15:27
     */
    IPage<UserInfoDto> page(int current, int size, UserParams params);


    /**
     * @description 获取哟农户列表
     * @param params
     * @return java.util.List<com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto>
     * @author yaolong
     * @date 2021/8/9 15:33
     */
    List<UserInfoDto> list(UserParams params);
}
