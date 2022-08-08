package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.dto.elementAdmin.RoleDto;
import com.yaolong.rbac.jwt.vo.AllotDeptParam;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import com.yaolong.rbac.jwt.vo.RoleParam;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysRoleService extends IBaseService<SysRole> {

    /**
     * 分配菜单资源
     *
     * @param allotMenuParam
     * @return
     */
    boolean allotMenu(AllotMenuParam allotMenuParam);

    @Transactional(rollbackFor = BusinessException.class)
    boolean allotMenuVben(AllotMenuParam allotMenuParam);

    /**
     * 分配接口权限资源
     *
     * @param allotPermissionParam
     * @return
     */
    boolean allotPermission(AllotPermissionParam allotPermissionParam);


    /**
     * 分配部门权限资源
     *
     * @param allotDeptParam
     * @return
     */
    boolean allotDept(AllotDeptParam allotDeptParam);

    /**
     * 根据用户名获取用户角色列表
     *
     * @param username
     * @return
     */
    List<RoleDto> getRoleListByUsername(String username);

    /**
     * 根据用户ID获取用户角色列表
     *
     * @param userId
     * @return
     */
    List<RoleDto> getRoleListByUserId(Long userId);

    /**
     * 更新角色信息以及角色所拥有的的权限
     * @param param
     * @return boolean
     * @author yaolong
     * @date 2021/8/11 10:47
     */
    boolean update(RoleParam param);

    /**
     * 创建角色信息以及角色所拥有的的权限
     * @param param
     * @return boolean
     * @author yaolong
     * @date 2021/8/11 10:47
     */
    boolean create(RoleParam param);

    /**
     * @description 更新状态
     * @param
     * @param param
     * @return boolean
     * @author yaolong
     * @date 2021/8/11 12:35
     */
    boolean updateStatus(RoleParam param);
}
