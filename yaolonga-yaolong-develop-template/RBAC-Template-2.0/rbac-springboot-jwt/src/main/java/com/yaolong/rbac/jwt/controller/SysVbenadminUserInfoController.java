package com.yaolong.rbac.jwt.controller;

import com.yaolong.rbac.commons.annotation.SysLog;
import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yaolong
 * @version V1.0.0
 * @program study-mybatis-generator
 * @description 用户基本信息
 * @create 2021-08-02 15:40
 **/
@RestController
@RequestMapping("/vbenadmin/sys/user")
@Api(tags = "《用戶信息》")
public class SysVbenadminUserInfoController extends BaseController<SysUserInfo, ISysUserInfoService> {
    /**
     * 获取用户信息
     * @param
     * @return
     */
    @GetMapping("/info")
    @ApiOperation(value = "获取当前用户信息",notes = "获取当前用户信息")
    @SysLog(value = "获取登录用户信息")
    public ResponseResult getUserInfo() {
        return ResponseResult.success(service.userInfoByContext());
    }

}
