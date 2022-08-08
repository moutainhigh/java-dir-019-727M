package com.yaolong.rbac.jwt.controller;


import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.service.ISysMenuResourceService;
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
@RequestMapping("/eladmin/sys/menu")
public class SysEladminMenuResourceController extends BaseController<SysMenuResource, ISysMenuResourceService> {


    public final ISysMenuResourceService studyMenuResourceService;

    public SysEladminMenuResourceController(ISysMenuResourceService studyMenuResourceService) {
        this.studyMenuResourceService = studyMenuResourceService;
    }

    /**
     * 获取当前用户的权限菜单树
     * @return
     */
    @GetMapping("/auth/tree")
    public ResponseResult getAuthTree(){
        return ResponseResult.success(studyMenuResourceService.treeListByUsername());
    }

    /**
     * 获取所有权限菜单树
     * @return
     */
    @GetMapping("/tree")
    public ResponseResult getTreeList(){
        return ResponseResult.success(studyMenuResourceService.treeList());
    }

    /**
     * 根据角色ID获取权限菜单列表
     * @return
     */
    @GetMapping("/role/{roleId}")
    public ResponseResult getListByRoleId(@PathVariable("roleId") @Valid Long roleId){
        return ResponseResult.success(studyMenuResourceService.listByRoleId(roleId));
    }
}
