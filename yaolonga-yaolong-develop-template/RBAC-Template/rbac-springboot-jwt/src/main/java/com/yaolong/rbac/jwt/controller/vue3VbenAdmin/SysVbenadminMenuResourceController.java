package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.response.model.ListDataResult;
import com.yaolong.rbac.jwt.domain.SysMenuResourceVben;
import com.yaolong.rbac.jwt.service.ISysMenuResourceVbenService;
import com.yaolong.rbac.jwt.vo.MenuParams;
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
public class SysVbenadminMenuResourceController extends BaseController<SysMenuResourceVben, ISysMenuResourceVbenService> {

    /**
     * 获取当前用户的权限菜单树
     * @return
     */
    @GetMapping("/auth/tree")
    public ResponseResult getAuthTree(){
        return ResponseResult.success(service.treeListByUsername());
    }

    /**
     * 获取所有权限菜单树
     * @return
     */
    @GetMapping("/tree/list")
    public ResponseResult getTreeList(MenuParams params){
        return ResponseResult.success(new ListDataResult<>(service.treeMenus(params)));
    }

    /**
     * 根据角色ID获取权限菜单列表
     * @return
     */
    @GetMapping("/role/{roleId}")
    public ResponseResult getListByRoleId(@PathVariable("roleId") @Valid Long roleId){
        return ResponseResult.success(service.listByRoleId(roleId));
    }

    @PutMapping("/update")
    public ResponseResult update(@Valid @RequestBody MenuParams domain) {
        return ResponseResult.success(service.update(new SysMenuResourceVben(domain)));
    }

    @PostMapping("/create")
    public ResponseResult create(@Valid @RequestBody MenuParams domain) {
        return ResponseResult.success(service.create(new SysMenuResourceVben(domain)));
    }

    @GetMapping("/authCode")
    public ResponseResult getPermissionCode() {
        return ResponseResult.success(service.getPermissionCode());
    }
}
