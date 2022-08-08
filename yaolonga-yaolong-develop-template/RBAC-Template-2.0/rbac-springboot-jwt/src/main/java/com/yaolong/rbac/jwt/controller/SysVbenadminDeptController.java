package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.annotation.SysLog;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.response.model.ListDataResult;
import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.jwt.service.ISysDeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.yaolong.rbac.commons.base.BaseController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-08-08
 */
@RestController
@RequestMapping("/vbenadmin/sys/dept")
@Api(tags = {"《部门管理》"})
public class SysVbenadminDeptController extends BaseController<SysDept,ISysDeptService> {


    /**
     * @description 获取部门列表
     * @param domain
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/8 15:15
     */
    @GetMapping("/tree/list")
    @ApiOperation(value = "获取部门列表", notes = "获取部门列表")
    @SysLog(value = "获取部门列表")
    public ResponseResult deptList(SysDept domain){
        return ResponseResult.success(new ListDataResult<>(service.treeList(domain)));
    }


    /**
     * @description 根据角色id获取部门列表
     * @param roleId
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/8 15:15
     */
    @GetMapping("/role/{roleId}")
    @ApiImplicitParam(name="roleId",value="角色id",required=true,paramType="path")
    @ApiOperation(value = "获取部门列表ByRoleID", notes = "获取部门列表ByRoleID")
    @SysLog(value = "根据角色id获取部门列表")
    public ResponseResult deptList(@PathVariable("roleId") Long roleId){
        return ResponseResult.success(service.getListByRoleId(roleId));
    }
}
