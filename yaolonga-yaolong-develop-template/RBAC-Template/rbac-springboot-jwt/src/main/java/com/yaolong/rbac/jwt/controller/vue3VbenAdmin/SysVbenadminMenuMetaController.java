package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.yaolong.rbac.jwt.domain.SysMenuMeta;
import com.yaolong.rbac.jwt.service.ISysMenuMetaService;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-08-03
 */
@RestController
@RequestMapping("/vbenadmin/sys/menu/meta")
public class SysVbenadminMenuMetaController extends BaseController<SysMenuMeta, ISysMenuMetaService> {

}
