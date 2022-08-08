package com.yaolong.rbac.jwt.controller.vue2ElementAdmin;

import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.component.DynamicSecurityMetadataSource;
import com.yaolong.rbac.jwt.mapper.SysPermissionMapper;
import com.yaolong.rbac.jwt.service.ISysLoginService;
import com.yaolong.rbac.jwt.vo.LoginParam;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;
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
 * @description:
 * @author: yaolong
 * @create: 2021-05-11 19:45
 **/
@RestController
@RequestMapping(value = "/eladmin/sys/user")
@Slf4j
public class SysEladminLoginController {
    @Resource
    private HttpServletRequest request;

    @Resource
    private ISysLoginService loginService;

    public final DynamicSecurityMetadataSource dynamicSecurityMetadataSource;

    public SysEladminLoginController(DynamicSecurityMetadataSource dynamicSecurityMetadataSource) {
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
    public ResponseResult login(@RequestBody @Valid LoginParam loginParam, HttpServletResponse response) {
        return ResponseResult.success(loginService.login(loginParam.getUsername(), loginParam.getPassword()));
    }

    /**
     * 退出登录
     * @return {@link ResponseResult}
     */
    @PostMapping("/logout")
    public ResponseResult logout() {
        return ResponseResult.success();
    }

    /**
     * 注册
     * @param registerUserParam {@code JSON} {@link RegisterUserParam}
     * @return {@link ResponseResult}
     */
    @PostMapping("/register")
    public ResponseResult register(@RequestBody @Valid RegisterUserParam registerUserParam, HttpServletResponse response) {
        return ResponseResult.success(loginService.register(registerUserParam));
    }


    /**
     * 重新登录
     * @param loginParam {@code JSON} {@link LoginParam}
     * @return {@link ResponseResult}
     */
    @PostMapping("/reLogin")
    public ResponseResult reLogin(@RequestBody @Valid LoginParam loginParam, HttpServletResponse response) {
        return ResponseResult.success(loginService.refresh());
    }

    /**
     * 获取用户的权限
     * @param userId {@code JSON} {@link String}
     * @return {@link ResponseResult}
     */
    @GetMapping("/permission/{userId}")
    public ResponseResult getPermission(@PathVariable Long userId) {
        return ResponseResult.success(sysPermissionMapper.getPermissionListByUserId(userId));
    }



    /**
     * 刷新权限
     * @return {@link ResponseResult}
     */
    @GetMapping("/refresh/auth")
    public ResponseResult reAuth() {
        dynamicSecurityMetadataSource.loadDataSource();
        return ResponseResult.success();
    }


}
