package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.domain.SysRoleMenuResource;
import com.yaolong.rbac.jwt.domain.SysRolePermission;
import com.yaolong.rbac.jwt.domain.SysUserRole;
import com.yaolong.rbac.jwt.dto.RoleDto;
import com.yaolong.rbac.jwt.mapper.SysRoleMapper;
import com.yaolong.rbac.jwt.po.Role;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceService;
import com.yaolong.rbac.jwt.service.ISysRolePermissionService;
import com.yaolong.rbac.jwt.service.ISysRoleService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysUserRoleService;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    @Resource
    ISysRoleMenuResourceService studyRoleMenuResourceService;

    @Resource
    ISysRolePermissionService studyRolePermissionService;

    @Resource
    ISysUserRoleService studyUserRoleService;

    @Override
    public IPage<?> page(int current, int size, SysRole domain) {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(!ObjectTool.isEmpty(domain.getName()), "name", domain.getName())
                    .eq(!ObjectTool.isEmpty(domain.getEnName()), "en_name", domain.getEnName())
                .like(!ObjectTool.isEmpty(domain.getDescription()), "description", domain.getDescription());
        Page<SysRole> objectPage = new Page<>(current, size);
        return super.page(objectPage, queryWrapper);
    }

    /**
     * 分配菜单
     *
     * @param allotMenuParam
     * @return
     */
    @Override
    public boolean allotMenu(AllotMenuParam allotMenuParam) {
        try {
            Long roleId = allotMenuParam.getRoleId();
            if (!ObjectTool.isEmpty(allotMenuParam.getMenuIds())) {
                // 先删除当前角色的菜单
                UpdateWrapper<SysRoleMenuResource> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
                studyRoleMenuResourceService.remove(updateWrapper);
                // 分配菜单
                List<SysRoleMenuResource> list = new ArrayList<>();
                allotMenuParam.getMenuIds().forEach(id -> {
                    list.add(new SysRoleMenuResource().setMenuId(id).setRoleId(roleId));
                });
                return studyRoleMenuResourceService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }

    /**
     * 分配接口权限
     *
     * @param allotPermissionParam
     * @return
     */
    @Override
    public boolean allotPermission(AllotPermissionParam allotPermissionParam) {
        try {
            Long roleId = allotPermissionParam.getRoleId();
            if (!ObjectTool.isEmpty(allotPermissionParam.getPermissionIds())) {
                // 先删除当前角色的接口权限
                UpdateWrapper<SysRolePermission> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
                studyRolePermissionService.remove(updateWrapper);
                // 分配接口权限
                List<SysRolePermission> list = new ArrayList<>();
                allotPermissionParam.getPermissionIds().forEach(id -> {
                    list.add(new SysRolePermission().setPermissionId(id).setRoleId(roleId));
                });
                return studyRolePermissionService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }

    /**
     * 根据用户名获取角色列表
     *
     * @param username
     * @return
     */
    @Override
    public List<RoleDto> getRoleListByUsername(String username) {
        List<Role> rolesByUsername = super.baseMapper.getRolesByUsername(username);
        return MapperUtils.copyList(rolesByUsername, RoleDto.class);

    }

    /**
     * 根据用户ID获取角色列表
     *
     * @param userId
     * @return
     */
    @Override
    public List<RoleDto> getRoleListByUserId(Long userId) {
        List<Role> rolesByUsername = super.baseMapper.getRolesByUserId(userId);
        return MapperUtils.copyList(rolesByUsername, RoleDto.class);

    }


    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)){
            //删除该角色接口权限关系表数据
            QueryWrapper<SysRolePermission> rolePermissionQueryWrapper = new QueryWrapper<>();
            rolePermissionQueryWrapper.eq("role_id",id);
            studyRolePermissionService.remove(rolePermissionQueryWrapper);

            //删除该角色用户角色关系表数据
            QueryWrapper<SysUserRole> userRoleQueryWrapper = new QueryWrapper<>();
            userRoleQueryWrapper.eq("role_id",id);
            studyUserRoleService.remove(userRoleQueryWrapper);

            //删除该角色菜单关系表数据
            QueryWrapper<SysRoleMenuResource> roleMenuQueryWrapper = new QueryWrapper<>();
            roleMenuQueryWrapper.eq("role_id",id);
            studyRoleMenuResourceService.remove(roleMenuQueryWrapper);

            return super.remove(id);
        }
        return false;
    }
}
