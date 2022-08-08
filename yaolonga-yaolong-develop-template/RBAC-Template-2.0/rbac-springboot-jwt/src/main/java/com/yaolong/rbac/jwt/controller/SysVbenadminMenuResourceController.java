package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.response.model.ListDataResult;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.service.ISysMenuResourceService;
import com.yaolong.rbac.jwt.vo.MenuParams;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
@RequestMapping("/vbenadmin/sys/menu")
@Api(tags = {"《菜单管理》"})
public class SysVbenadminMenuResourceController extends BaseController<SysMenuResource, ISysMenuResourceService> {

    /**
     * 获取当前用户的权限菜单树
     * @return
     */
    @GetMapping("/auth/tree")
    @ApiOperation(value = "获取当前用户菜单树",notes = "获取当前用户菜单树")
    public ResponseResult getAuthTree(){
        return ResponseResult.success(service.treeListByUsername());
    }

    /**
     * 获取所有权限菜单树
     * @return
     */
    @GetMapping("/tree/list")
    @ApiOperation(value = "获取所有权限菜单树",notes = "获取所有权限菜单树")
    public ResponseResult getTreeList(MenuParams params){
        return ResponseResult.success(new ListDataResult<>(service.treeMenus(params)));
    }

    /**
     * 根据角色ID获取权限菜单列表
     * @return
     */
    @GetMapping("/role/{roleId}")
    @ApiOperation(value = "根据角色获取菜单列表",notes = "根据角色获取菜单列表")
    public ResponseResult getListByRoleId(@PathVariable("roleId") @Valid Long roleId){
        return ResponseResult.success(service.listByRoleId(roleId));
    }

    @PutMapping("/update")
    @ApiOperation(value = "更新菜单",notes = "更新菜单")
    public ResponseResult update(@Valid @RequestBody MenuParams domain) {
        return ResponseResult.success(service.update(new SysMenuResource(domain)));
    }

    @PostMapping("/create")
    @ApiOperation(value = "创建菜单",notes = "创建菜单")
    public ResponseResult create(@Valid @RequestBody MenuParams domain) {
        return ResponseResult.success(service.create(new SysMenuResource(domain)));
    }

    @GetMapping("/authCode")
    @ApiOperation(value = "获取当前用户权限码",notes = "获取当前用户权限码")
    public ResponseResult getPermissionCode() {
        return ResponseResult.success(service.getPermissionCode());
    }
}
