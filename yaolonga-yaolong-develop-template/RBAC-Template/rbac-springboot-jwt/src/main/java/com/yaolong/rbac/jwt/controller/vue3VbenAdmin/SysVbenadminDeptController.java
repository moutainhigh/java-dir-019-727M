package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.response.model.ListDataResult;
import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.jwt.service.ISysDeptService;
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
public class SysVbenadminDeptController extends BaseController<SysDept,ISysDeptService> {


    /**
     * @description 获取部门列表
     * @param domain
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @author yaolong
     * @date 2021/8/8 15:15
     */
    @GetMapping("/tree/list")
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
    public ResponseResult deptList(@PathVariable("roleId") Long roleId){
        return ResponseResult.success(service.getListByRoleId(roleId));
    }
}
