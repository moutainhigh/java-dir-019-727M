package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.service.ISysRoleService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import com.yaolong.rbac.jwt.vo.RoleParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
@RequestMapping("/vbenadmin/sys/role")
@Api(tags = "《角色管理》")
public class SysVbendminRoleController{
    public final ISysRoleService studyRoleService;

    public SysVbendminRoleController(ISysRoleService studyRoleService) {
        this.studyRoleService = studyRoleService;
    }


    /**
     * 分配菜单
     *
     * @param allotMenuParam
     * @return
     */
    @PostMapping("/allot/menu")
    @ApiOperation(value = "分配菜单",notes = "分配菜单")
    public ResponseResult allotMenu(@RequestBody @Valid AllotMenuParam allotMenuParam) {
        boolean b = studyRoleService.allotMenuVben(allotMenuParam);
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
    @ApiOperation(value = "分配接口权限",notes = "分配接口权限")
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
    @ApiOperation(value = "获取角色列表",notes = "获取角色列表")
    public ResponseResult getRoleListByUsername(@PathVariable @NotBlank String username) {
        return ResponseResult.success(studyRoleService.getRoleListByUsername(username));
    }

    /**
     * 获取上下文用户角色列表
     * @return
     */
    @GetMapping("list/username")
    @ApiOperation(value = "获取去当前用户角色",notes = "获取去当前用户角色")
    public ResponseResult getRoleList() {
        return ResponseResult.success(studyRoleService.getRoleListByUsername(LoginContext.getContentName()));
    }

    /**
     * 获取角色列表
     * @param userId
     * @return
     */
    @GetMapping("list/userId/{userId}")
    @ApiOperation(value = "获取角色列表ByUserId",notes = "获取角色列表ByUserId")
    public ResponseResult getRoleListByUserId(@PathVariable @NotBlank Long userId) {
        return ResponseResult.success(studyRoleService.getRoleListByUserId(userId));
    }

    /**
     * 分页
     * @param current {@code int} 页码
     * @param size {@code int} 笔数
     * @return {@link ResponseResult}
     */
    @GetMapping("page")
    @ApiOperation(value = "分页获取角色列表",notes = "分页获取角色列表")
    public ResponseResult page(int current,int size, SysRole role) {
        return ResponseResult.success(studyRoleService.page(current,size,role));
    }


    /**
     * list
     * @return {@link ResponseResult}
     */
    @GetMapping("list")
    @ApiOperation(value = "获取所有角色",notes = "获取所有角色")
    public ResponseResult list(SysRole role) {
        return ResponseResult.success(studyRoleService.list(role));
    }

    /**
     * @description  update
     * @param param
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/11 10:33
     */
    @PutMapping("")
    @ApiOperation(value = "更新角色",notes = "更新角色")
    public ResponseResult update(@RequestBody RoleParam param) {
        return ResponseResult.success(studyRoleService.update(param));
    }

    /**
     * @description  update  status
     * @param param
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/11 10:33
     */
    @PutMapping("/status")
    @ApiOperation(value = "更新角色状态",notes = "更新角色状态")
    public ResponseResult updateStatus(@RequestBody RoleParam param) {
        return ResponseResult.success(studyRoleService.updateStatus(param));
    }


    /**
     * @description  create
     * @param param
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/11 10:33
     */
    @PostMapping("")
    @ApiOperation(value = "创建角色",notes = "创建角色")
    public ResponseResult create(@RequestBody RoleParam param) {
        return ResponseResult.success(studyRoleService.create(param));
    }

    /**
     * @description  get
     * @param id
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/11 10:33
     */
    @GetMapping("{id}")
    @ApiOperation(value = "获取角色",notes = "获取角色")
    public ResponseResult get(@PathVariable("id") Long id) {
        return ResponseResult.success(studyRoleService.get(id));
    }

    /**
     * @description remove
     * @param id
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/11 10:33
     */
    @DeleteMapping("{id}")
    @ApiOperation(value = "删除角色",notes = "删除角色")
    public ResponseResult remove(@PathVariable("id") Long id) {
        return ResponseResult.success(studyRoleService.remove(id));
    }

}
