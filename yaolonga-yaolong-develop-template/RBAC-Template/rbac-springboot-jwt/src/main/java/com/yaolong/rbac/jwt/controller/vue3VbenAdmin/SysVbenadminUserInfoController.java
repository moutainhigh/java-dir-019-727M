package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;

import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
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
public class SysVbenadminUserInfoController extends BaseController<SysUserInfo, ISysUserInfoService> {
    /**
     * 获取用户信息
     * @param
     * @return
     */
    @GetMapping("/info")
    public ResponseResult getUserInfo() {
        return ResponseResult.success(service.userInfoByContext());
    }

}
