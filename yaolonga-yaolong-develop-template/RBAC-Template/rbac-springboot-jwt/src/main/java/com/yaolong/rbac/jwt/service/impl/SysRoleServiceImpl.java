package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.jwt.domain.SysMenuResourceVben;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.domain.SysRoleDept;
import com.yaolong.rbac.jwt.domain.SysRoleMenuResource;
import com.yaolong.rbac.jwt.domain.SysRoleMenuResourceVben;
import com.yaolong.rbac.jwt.domain.SysRolePermission;
import com.yaolong.rbac.jwt.domain.SysUserRole;
import com.yaolong.rbac.jwt.dto.elementAdmin.RoleDto;
import com.yaolong.rbac.jwt.mapper.SysRoleMapper;
import com.yaolong.rbac.jwt.po.elementAdmin.Role;
import com.yaolong.rbac.jwt.service.ISysDeptService;
import com.yaolong.rbac.jwt.service.ISysMenuResourceVbenService;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import com.yaolong.rbac.jwt.service.ISysRoleDeptService;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceService;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceVbenService;
import com.yaolong.rbac.jwt.service.ISysRolePermissionService;
import com.yaolong.rbac.jwt.service.ISysRoleService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysUserRoleService;
import com.yaolong.rbac.jwt.vo.AllotDeptParam;
import com.yaolong.rbac.jwt.vo.AllotMenuParam;
import com.yaolong.rbac.jwt.vo.AllotPermissionParam;
import com.yaolong.rbac.jwt.vo.RoleParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@Service
@Slf4j
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    @Resource
    ISysRoleMenuResourceService sysRoleMenuResourceService;

    @Resource
    ISysRoleMenuResourceVbenService sysRoleMenuResourceVbenService;

    @Resource
    ISysMenuResourceVbenService sysMenuResourceVbenService;

    @Resource
    ISysRolePermissionService sysRolePermissionService;

    @Resource
    ISysPermissionService sysPermissionService;

    @Resource
    ISysRoleDeptService sysRoleDeptService;

    @Resource
    ISysDeptService sysDeptService;


    @Resource
    ISysUserRoleService sysUserRoleService;

    @Override
    public IPage<?> page(int current, int size, SysRole domain) {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(!ObjectTool.isEmpty(domain.getName()), "name", domain.getName())
                .eq(!ObjectTool.isEmpty(domain.getEnName()), "en_name", domain.getEnName())
                .like(!ObjectTool.isEmpty(domain.getRemark()), "remark", domain.getRemark());
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
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotMenu(AllotMenuParam allotMenuParam) {
        try {
            Long roleId = allotMenuParam.getRoleId();
            // 先删除当前角色的菜单
            UpdateWrapper<SysRoleMenuResource> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleMenuResourceService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotMenuParam.getMenuIds())) {
                // 分配菜单
                List<SysRoleMenuResource> list = new ArrayList<>();
                allotMenuParam.getMenuIds().forEach(id -> {
                    list.add(new SysRoleMenuResource().setMenuId(id).setRoleId(roleId));
                });
                return sysRoleMenuResourceService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }

    /**
     * 分配菜单
     *
     * @param allotMenuParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotMenuVben(AllotMenuParam allotMenuParam) {
        try {
            Long roleId = allotMenuParam.getRoleId();
            // 先删除当前角色的菜单
            UpdateWrapper<SysRoleMenuResourceVben> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleMenuResourceVbenService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotMenuParam.getMenuIds())) {
                // 分配菜单
                List<SysRoleMenuResourceVben> list = new ArrayList<>();
                allotMenuParam.getMenuIds().forEach(id -> {
                    list.add(new SysRoleMenuResourceVben().setMenuId(id).setRoleId(roleId));
                });
                return sysRoleMenuResourceVbenService.saveBatch(list);
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
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotPermission(AllotPermissionParam allotPermissionParam) {
        try {
            Long roleId = allotPermissionParam.getRoleId();
            // 先删除当前角色的接口权限
            UpdateWrapper<SysRolePermission> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRolePermissionService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotPermissionParam.getPermissionIds())) {
                // 分配接口权限
                List<SysRolePermission> list = new ArrayList<>();
                allotPermissionParam.getPermissionIds().forEach(id -> {
                    list.add(new SysRolePermission().setPermissionId(id).setRoleId(roleId));
                });
                return sysRolePermissionService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }

    /**
     * 分配部门权限
     *
     * @param allotDeptParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotDept(AllotDeptParam allotDeptParam) {
        try {
            Long roleId = allotDeptParam.getRoleId();
            // 先删除当前角色的部门权限
            UpdateWrapper<SysRoleDept> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleDeptService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotDeptParam.getDeptIds())) {
                // 分配接口权限
                List<SysRoleDept> list = new ArrayList<>();
                allotDeptParam.getDeptIds().forEach(id -> {
                    list.add(new SysRoleDept().setDeptId(id).setRoleId(roleId));
                });
                return sysRoleDeptService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("分配部门异常");
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
    public boolean create(RoleParam param) {
        try {
            SysRole sysRole = new SysRole();
            //创建角色
            super.create(MapperUtils.copy(param, sysRole));
            param.setId(sysRole.getId());
            //分配的部门、菜单、权限处理-主要是处理前端的tree组件选择子树无法获取父id，所返回给后端的id缺少父id
            RoleParam roleParam = allotIdsHandler(param);
            //分配部门
            allotResource(roleParam);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new BusinessException(ex.getMessage());
        }
    }

    /**
     * @param param
     * @return void
     * @description 分配id之前的处理
     * @author yaolong
     * @date 2021/8/12 11:28
     *
     */
    private RoleParam allotIdsHandler(RoleParam param) {
        //================菜单id处理 （获取父id）===============
        List<SysMenuResourceVben> menuResources = sysMenuResourceVbenService.list();
        List<Long> menuIds = param.getMenuIds();
        log.info("前端选中的id:{}",menuIds);
        //菜单选中项的所有pid(多层父pid)
        List<Long> menuPids = getMenuPIds(menuResources, menuIds);
        //合并
        menuIds.addAll(menuPids);
        List<Long> newMenuIds = menuIds.stream().distinct().collect(Collectors.toList());
        param.setMenuIds(newMenuIds);

        //===============部门id处理 （获取父id）===========
        List<SysDept> depts = sysDeptService.list();
        List<Long> deptIds = param.getDeptIds();
        //部门选中项的所有pid(多层父pid)
        List<Long> deptPids = getDeptPIds(depts,deptIds);
        //合并
        deptIds.addAll(deptPids);
        List<Long> newDeptIds = deptIds.stream().distinct().collect(Collectors.toList());
        param.setDeptIds(newDeptIds);

        //===============接口权限id处理 （暂无）===========
        return param;
    }

    /**
     * @param menuResources menuIds
     * @return java.util.List<java.lang.Long>
     * @description 递归获取菜单节点的父节点
     * @author yaolong
     * @date 2021/8/12 15:01
     */
    private List<Long> getMenuPIds(List<SysMenuResourceVben> menuResources, List<Long> menuIds) {
        Stream<SysMenuResourceVben> ids = menuResources.stream().filter(m -> menuIds.contains(m.getId()));
        List<Long> menuIds2 = ids.map(SysMenuResourceVben::getParentId).filter(r -> r != 0)
                .distinct().collect(Collectors.toList());
        List<Long> longs = new ArrayList<>();
        if (menuIds2.size() > 0) {
            longs = getMenuPIds(menuResources, menuIds2);
        }
        menuIds2.addAll(longs);
        return menuIds2;
    }

    /**
     * @param deptResources menuIds
     * @return java.util.List<java.lang.Long>
     * @description 递归获取部门节点的父节点
     * @author yaolong
     * @date 2021/8/12 15:01
     */
    private List<Long> getDeptPIds(List<SysDept> deptResources, List<Long> deptIds) {
        Stream<SysDept> ids = deptResources.stream().filter(m -> deptIds.contains(m.getId()));
        List<Long> deptIds2 = ids.map(SysDept::getParentId).filter(r -> r != 0)
                .distinct().collect(Collectors.toList());
        List<Long> longs = new ArrayList<>();
        if (deptIds2.size() > 0) {
            longs = getDeptPIds(deptResources, deptIds2);
        }
        deptIds2.addAll(longs);
        return deptIds2;
    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean update(RoleParam param) {
        try {
            checkId(param.getId());
            //更新角色
            SysRole role = MapperUtils.copy(param, new SysRole());
            role.setRemark(param.getRemark());
            super.update(role);
            RoleParam roleParam = allotIdsHandler(param);
            //分配资源
            allotResource(roleParam);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new BusinessException(ex.getMessage());
        }
    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean updateStatus(RoleParam param) {
        try {
            checkId(param.getId());
            //更新角色
            super.update(MapperUtils.copy(param, new SysRole()));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("状态更新异常");
        }

    }

    private void allotResource(RoleParam param) {
        try {
            //分配部门
            AllotDeptParam allotDeptParam = new AllotDeptParam();
            allotDeptParam.setRoleId(param.getId());
            allotDeptParam.setDeptIds(param.getDeptIds());
            allotDept(allotDeptParam);
            //分配菜单
            AllotMenuParam allotMenuParam = new AllotMenuParam();
            allotMenuParam.setRoleId(param.getId());
            allotMenuParam.setMenuIds(param.getMenuIds());
            allotMenuVben(allotMenuParam);
            //分配接口
            AllotPermissionParam allotPermissionParam = new AllotPermissionParam();
            allotPermissionParam.setPermissionIds(param.getItfIds());
            allotPermissionParam.setRoleId(param.getId());
            allotPermission(allotPermissionParam);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("分配资源失败");
        }

    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)) {
            //删除该角色接口权限关系表数据
            QueryWrapper<SysRolePermission> rolePermissionQueryWrapper = new QueryWrapper<>();
            rolePermissionQueryWrapper.eq("role_id", id);
            sysRolePermissionService.remove(rolePermissionQueryWrapper);

            //删除该角色用户角色关系表数据
            QueryWrapper<SysUserRole> userRoleQueryWrapper = new QueryWrapper<>();
            userRoleQueryWrapper.eq("role_id", id);
            sysUserRoleService.remove(userRoleQueryWrapper);

            //删除该角色对应的部门关系表数据
            QueryWrapper<SysRoleDept> deptQueryWrapper = new QueryWrapper<>();
            userRoleQueryWrapper.eq("role_id", id);
            sysRoleDeptService.remove(deptQueryWrapper);

            //删除该角色菜单关系表数据
            QueryWrapper<SysRoleMenuResource> roleMenuQueryWrapper = new QueryWrapper<>();
            roleMenuQueryWrapper.eq("role_id", id);
            sysRoleMenuResourceService.remove(roleMenuQueryWrapper);

            return super.remove(id);
        }
        return false;
    }
}
