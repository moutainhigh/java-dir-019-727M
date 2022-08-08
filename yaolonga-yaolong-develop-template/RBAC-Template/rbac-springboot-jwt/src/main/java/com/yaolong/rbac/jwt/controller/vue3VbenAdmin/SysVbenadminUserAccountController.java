package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;


import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;
import com.yaolong.rbac.jwt.vo.UserParams;
import org.springframework.web.bind.annotation.DeleteMapping;
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
 * 前端控制器
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
@RestController
@RequestMapping("/vbenadmin/sys/user/account")
public class SysVbenadminUserAccountController {

    public final ISysUserService studyUserService;
    public final ISysUserInfoService sysUserInfoService;

    public SysVbenadminUserAccountController(ISysUserService studyUserService, ISysUserInfoService sysUserInfoService) {
        this.studyUserService = studyUserService;
        this.sysUserInfoService = sysUserInfoService;
    }

    /**
     * 分配角色
     *
     * @param allotRoleParam
     * @return
     */
    @PostMapping("/allot/role")
    public ResponseResult allotRole(@Valid @RequestBody AllotRoleParam allotRoleParam) {
        studyUserService.allotRole(allotRoleParam);
        return ResponseResult.success();
    }

    /**
     * @param current
     * @param size
     * @param params
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @description 分页
     * @author yaolong
     * @date 2021/8/9 15:34
     */
    @GetMapping("/page")
    public ResponseResult pageList(int current, int size, UserParams params) {
        return ResponseResult.success(sysUserInfoService.page(current, size, params));
    }

    /**
     * @param params
     * @return com.yaolong.rbac.commons.response.ResponseResult
     * @description 获取所有列表
     * @author yaolong
     * @date 2021/8/9 15:34
     */
    @GetMapping("/list")
    public ResponseResult pageList(@RequestBody UserParams params) {
        return ResponseResult.success(sysUserInfoService.list(params));
    }


    /**
     * @param params
     * @description 更新账户信息
     */
    @PutMapping("")
    public ResponseResult update(@RequestBody UserParams params) {
        return ResponseResult.success(studyUserService.update(params));
    }

    /**
     * @param params
     * @description 创建账户信息
     */
    @PostMapping("")
    public ResponseResult create(@RequestBody UserParams params) {
        return ResponseResult.success(studyUserService.create(params));
    }
    /**
     * @param id
     * @description 删除账户
     */
    @DeleteMapping("{id}")
    public ResponseResult remove(@PathVariable("id") Long id) {
        return ResponseResult.success(studyUserService.remove(id));
    }


}
