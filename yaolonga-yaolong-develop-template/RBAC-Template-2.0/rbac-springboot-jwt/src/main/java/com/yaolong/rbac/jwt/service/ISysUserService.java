package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.dto.elementAdmin.UserDto;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;
import com.yaolong.rbac.jwt.vo.UserParams;

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


     /**
      * @description  更新账号信息
      * @param params
      */
    boolean update(UserParams params);

    /**
     * @description  创建账号
     * @param params
     * @author yaolong
     * @date 2021/8/10 17:02
     */
    boolean create(UserParams params);
}
