package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yaolong.rbac.commons.base.BaseController;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.service.ISysRoleService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import com.yaolong.rbac.jwt.vo.RoleParam;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;

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

    /**
     * 分页
     * @param current {@code int} 页码
     * @param size {@code int} 笔数
     * @return {@link ResponseResult}
     */
    @GetMapping("page")
    public ResponseResult page(int current,int size, SysRole role) {
        return ResponseResult.success(studyRoleService.page(current,size,role));
    }


    /**
     * list
     * @return {@link ResponseResult}
     */
    @GetMapping("list")
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
    public ResponseResult remove(@PathVariable("id") Long id) {
        return ResponseResult.success(studyRoleService.remove(id));
    }

}
