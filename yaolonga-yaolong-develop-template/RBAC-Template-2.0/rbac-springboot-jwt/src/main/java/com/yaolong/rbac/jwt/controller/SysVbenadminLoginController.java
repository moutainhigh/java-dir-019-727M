package com.yaolong.rbac.jwt.controller;

import com.yaolong.rbac.commons.annotation.SysLog;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.component.DynamicSecurityMetadataSource;
import com.yaolong.rbac.jwt.mapper.SysPermissionMapper;
import com.yaolong.rbac.jwt.service.ISysLoginService;
import com.yaolong.rbac.jwt.vo.LoginParam;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * @program: study-project
 * @description:
 * @author: yaolong
 * @create: 2021-05-11 19:45
 **/
@RestController
@RequestMapping(value = "/vbenadmin/sys")
@Slf4j
@Api(tags = {"《认证授权》"})
public class SysVbenadminLoginController {

    @Resource
    private ISysLoginService loginService;

    public final DynamicSecurityMetadataSource dynamicSecurityMetadataSource;

    public SysVbenadminLoginController(DynamicSecurityMetadataSource dynamicSecurityMetadataSource) {
        this.dynamicSecurityMetadataSource = dynamicSecurityMetadataSource;
    }

    @Resource
    private SysPermissionMapper sysPermissionMapper;

    /**
     * 登录
     * @param loginParam {@code JSON} {@link LoginParam}
     * @return {@link ResponseResult}
     */
    @PostMapping("/login")
    @ApiOperation(value = "登录", notes = "登录")
    @SysLog(value = "用户登录")
    public ResponseResult login(@RequestBody @Valid LoginParam loginParam, HttpServletResponse response) {
        return ResponseResult.success(loginService.login(loginParam.getUsername(), loginParam.getPassword()));
    }

    /**
     * 退出登录
     * @return {@link ResponseResult}
     */
    @GetMapping("/logout")
    @ApiOperation(value = "退出登录", notes = "退出登录")
    public ResponseResult logout() {
        return ResponseResult.success();
    }

    /**
     * 注册
     * @param registerUserParam {@code JSON} {@link RegisterUserParam}
     * @return {@link ResponseResult}
     */
    @PostMapping("/register")
    @ApiOperation(value = "用户注册", notes = "用户注册")
    public ResponseResult register(@RequestBody @Valid RegisterUserParam registerUserParam, HttpServletResponse response) {
        return ResponseResult.success(loginService.register(registerUserParam));
    }


    /**
     * 重新登录
     * @return {@link ResponseResult}
     */
    @PostMapping("/reLogin")
    @ApiOperation(value = "重新登录", notes = "重新登录")
    public ResponseResult reLogin() {
        return ResponseResult.success(loginService.refresh());
    }

    /**
     * 获取用户的权限
     * @param userId {@code JSON} {@link String}
     * @return {@link ResponseResult}
     */
    @GetMapping("/permission/{userId}")
    @ApiOperation(value = "获取用户的权限", notes = "获取用户的权限")
    @ApiImplicitParam(name = "userId",value = "用户id",paramType = "path")
    public ResponseResult getPermission(@PathVariable Long userId) {
        return ResponseResult.success(sysPermissionMapper.getPermissionListByUserId(userId));
    }



    /**
     * 刷新权限
     * @return {@link ResponseResult}
     */
    @GetMapping("/refresh/auth")
    @ApiOperation(value = "刷新权限", notes = "刷新权限")
    public ResponseResult reAuth() {
        dynamicSecurityMetadataSource.loadDataSource();
        return ResponseResult.success();
    }


}
