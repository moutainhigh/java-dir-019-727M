package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.jwt.domain.SysMenuMeta;
import com.yaolong.rbac.jwt.service.ISysMenuMetaService;
import io.swagger.annotations.Api;
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
@Api(tags = {"《菜单元数据》"})
public class SysVbenadminMenuMetaController extends BaseController<SysMenuMeta, ISysMenuMetaService> {

}
