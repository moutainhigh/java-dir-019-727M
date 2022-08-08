package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.service.ISysRoleService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@RestController
@RequestMapping("/eladmin/sys/role")
public class SysEladminRoleController extends BaseController<SysRole, ISysRoleService> {
    public final ISysRoleService studyRoleService;

    public SysEladminRoleController(ISysRoleService studyRoleService) {
        this.studyRoleService = studyRoleService;
    }


    /**
     * 分配菜单
     *
     * @param allotMenuParam
     * @return
     */
    @PostMapping("/allot/menu")
    public ResponseResult allotMenu(@RequestBody @Valid AllotMenuParam allotMenuParam) {
        boolean b = studyRoleService.allotMenu(allotMenuParam);
        if (!b) {
            throw new BusinessException(ResponseCode.FAILURE);
        }
        return ResponseResult.success("分配菜单成功");
    }

    /**
     * 分配接口权限
     *
     * @param allotPermissionParam
     * @return
     */
    @PostMapping("/allot/permission")
    public ResponseResult allotPermission(@RequestBody @Valid AllotPermissionParam allotPermissionParam) {
        boolean b = studyRoleService.allotPermission(allotPermissionParam);
        if (!b) {
            throw new BusinessException(ResponseCode.FAILURE);
        }
        return ResponseResult.success("分配接口权限成功");
    }


    /**
     * 获取角色列表
     * @param username
     * @return
     */
    @GetMapping("list/username/{username}")
    public ResponseResult getRoleListByUsername(@PathVariable @NotBlank String username) {
        return ResponseResult.success(studyRoleService.getRoleListByUsername(username));
    }

    /**
     * 获取上下文用户角色列表
     * @return
     */
    @GetMapping("list/username")
    public ResponseResult getRoleList() {
        return ResponseResult.success(studyRoleService.getRoleListByUsername(LoginContext.getContentName()));
    }

    /**
     * 获取角色列表
     * @param userId
     * @return
     */
    @GetMapping("list/userId/{userId}")
    public ResponseResult getRoleListByUserId(@PathVariable @NotBlank Long userId) {
        return ResponseResult.success(studyRoleService.getRoleListByUserId(userId));
    }
}
