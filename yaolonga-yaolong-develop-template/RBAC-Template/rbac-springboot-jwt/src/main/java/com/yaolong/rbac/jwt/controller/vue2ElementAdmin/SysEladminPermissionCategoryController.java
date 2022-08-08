package com.yaolong.rbac.jwt.controller.vue2ElementAdmin;


import com.yaolong.rbac.jwt.domain.SysPermissionCategory;
import com.yaolong.rbac.jwt.service.ISysPermissionCategoryService;
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
@RequestMapping("/eladmin/sys/permission/category")
public class SysEladminPermissionCategoryController extends BaseController<SysPermissionCategory, ISysPermissionCategoryService> {

}
