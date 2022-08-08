package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.jwt.domain.SysDict;
import com.yaolong.rbac.jwt.service.ISysDictService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

/**
 * <p>
 * 数据字典表 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@RestController
@RequestMapping("/vbenadmin/sys/dict")
@Api(tags = {"《字典管理》"})
public class SysVbenadminDictController extends BaseController<SysDict, ISysDictService> {
}
