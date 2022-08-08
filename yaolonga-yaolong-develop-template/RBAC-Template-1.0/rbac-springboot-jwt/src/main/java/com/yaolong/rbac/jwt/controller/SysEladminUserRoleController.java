package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.jwt.domain.SysUserRole;
import com.yaolong.rbac.jwt.service.ISysUserRoleService;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@RestController
@RequestMapping("/eladmin/sys/user-role")
public class SysEladminUserRoleController extends BaseController<SysUserRole, ISysUserRoleService> {

}