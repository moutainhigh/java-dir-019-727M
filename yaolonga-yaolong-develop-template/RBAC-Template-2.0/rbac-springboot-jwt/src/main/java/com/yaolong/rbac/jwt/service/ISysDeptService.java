package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.commons.base.IBaseService;
import com.yaolong.rbac.jwt.dto.vbenAdmin.DeptNode;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-08
 */
public interface ISysDeptService extends IBaseService<SysDept> {

    /**
     * @description 获取部门树
     * @param domain
     * @return java.util.List<com.yaolong.rbac.jwt.dto.vbenAdmin.DeptNode>
     * @author yaolong
     * @date 2021/8/8 14:55
     */
    List<DeptNode> treeList(SysDept domain);

    /**
     * @description 根据角色id获取部门列表
     * @param roleId
     * @return java.util.List<com.yaolong.rbac.jwt.domain.SysDept>
     * @author yaolong
     * @date 2021/8/11 14:31
     */
    List<SysDept> getListByRoleId(Long roleId);
}
