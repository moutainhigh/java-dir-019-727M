package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.dto.UserDto;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
public interface ISysUserService extends IBaseService<SysUser> {

    /**
     * 分配角色
     * @param allotRoleParam
     * @return
     */
     boolean allotRole(AllotRoleParam allotRoleParam);

     /**
     * 获取用户信息
     * @return
     */
     UserDto getUserInfo();




}
