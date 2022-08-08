package com.yaolong.rbac.jwt.controller.vue2ElementAdmin;


import com.yaolong.rbac.jwt.domain.SysRoleMenuResource;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceService;
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
@RequestMapping("/eladmin/sys/role/menuResource")
public class SysEladminRoleMenuResourceController extends BaseController<SysRoleMenuResource, ISysRoleMenuResourceService> {

}
