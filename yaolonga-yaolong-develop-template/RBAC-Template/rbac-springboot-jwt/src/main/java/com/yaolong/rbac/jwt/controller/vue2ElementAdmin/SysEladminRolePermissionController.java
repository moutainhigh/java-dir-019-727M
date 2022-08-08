package com.yaolong.rbac.jwt.controller.vue2ElementAdmin;


import com.yaolong.rbac.jwt.domain.SysRolePermission;
import com.yaolong.rbac.jwt.service.ISysRolePermissionService;
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
@RequestMapping("/eladmin/sys/study-role-permission")
public class SysEladminRolePermissionController extends BaseController<SysRolePermission, ISysRolePermissionService> {

}
