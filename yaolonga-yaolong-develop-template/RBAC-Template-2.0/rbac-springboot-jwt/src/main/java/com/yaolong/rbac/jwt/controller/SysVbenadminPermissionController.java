package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.response.model.ListDataResult;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import com.yaolong.rbac.jwt.vo.PermissionParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@RestController
@RequestMapping("/vbenadmin/sys/interface")
@Api(tags = {"《接口管理》"})
public class SysVbenadminPermissionController extends BaseController<SysPermission, ISysPermissionService> {


    public final ISysPermissionService studyPermissionService;

    public SysVbenadminPermissionController(ISysPermissionService studyPermissionService) {
        this.studyPermissionService = studyPermissionService;
    }


    /**
     * 通过角色ID获取权限列表
     *
     * @param roleId
     * @return
     */
    @GetMapping("/role/{roleId}")
    @ApiOperation(value = "通过角色ID获取权限列表",notes = "通过角色ID获取权限列表")
    public ResponseResult getPermissionListByRoleId(@PathVariable("roleId") @Valid Long roleId) {
        return ResponseResult.success(studyPermissionService.getPermissionListByRoleId(roleId));
    }

    /**
     * 获取权限树
     *
     * @return
     */
    @GetMapping("/tree/list")
    @ApiOperation(value = "获取接口权限树",notes = "获取接口权限树")
    public ResponseResult getPermissionTree() {
        return ResponseResult.success(new ListDataResult<>(studyPermissionService.getPermissionTree()));
    }


    @Override
    public ResponseResult list(SysPermission domain) {
        return ResponseResult.success(service.getList(MapperUtils.copy(domain,new PermissionParam())));
    }

    @Override
    public ResponseResult page(int current, int size, SysPermission domain) {
        return ResponseResult.success(service.getPage(current,size,MapperUtils.copy(domain,new PermissionParam())));
    }
}
