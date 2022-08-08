package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
@RestController
@RequestMapping("/eladmin/sys/user")
public class SysEladminUserController extends BaseController<SysUser, ISysUserService> {

    public final ISysUserService studyUserService;

    public SysEladminUserController(ISysUserService studyUserService) {
        this.studyUserService = studyUserService;
    }

    /**
     * 分配角色
     * @param allotRoleParam
     * @return
     */
    @PostMapping("/allot/role")
    public ResponseResult allotRole(@Valid @RequestBody AllotRoleParam allotRoleParam) {
        studyUserService.allotRole(allotRoleParam);
        return ResponseResult.success();
    }


    /**
     * 获取用户信息
     * @return
     */
    @GetMapping("/info")
    public ResponseResult getUserInfo() {
        return ResponseResult.success(studyUserService.getUserInfo());
    }
}
