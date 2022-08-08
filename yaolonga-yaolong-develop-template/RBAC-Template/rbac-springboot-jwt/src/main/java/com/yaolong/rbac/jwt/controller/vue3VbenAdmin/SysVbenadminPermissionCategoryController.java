package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.jwt.domain.SysPermissionCategory;
import com.yaolong.rbac.jwt.service.ISysPermissionCategoryService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@RestController
@RequestMapping("/vbenadmin/sys/interface/category")
public class SysVbenadminPermissionCategoryController extends BaseController<SysPermissionCategory, ISysPermissionCategoryService> {

}
