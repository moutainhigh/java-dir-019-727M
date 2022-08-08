package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

import javax.validation.Valid;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@RestController
@RequestMapping("/eladmin/sys/permission")
public class SysEladminPermissionController extends BaseController<SysPermission, ISysPermissionService> {


    public final ISysPermissionService studyPermissionService;

    public SysEladminPermissionController(ISysPermissionService studyPermissionService) {
        this.studyPermissionService = studyPermissionService;
    }


    /**
     * 通过角色ID获取权限列表
     * @param roleId
     * @return
     */
    @GetMapping("/list/role/{roleId}")
    public ResponseResult getPermissionListByRoleId(@PathVariable("roleId") @Valid Long roleId){
        return ResponseResult.success(studyPermissionService.getPermissionListByRoleId(roleId));
    }
}
