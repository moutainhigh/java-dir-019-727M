package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.jwt.domain.SysLog;
import com.yaolong.rbac.jwt.service.ISysLogService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

/**
 * <p>
 * 系统日志 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@RestController
@RequestMapping("/vbenadmin/sys/log")
@Api(tags = {"《日志管理》"})
public class SysVbenadminLogController extends BaseController<SysLog, ISysLogService> {

}
