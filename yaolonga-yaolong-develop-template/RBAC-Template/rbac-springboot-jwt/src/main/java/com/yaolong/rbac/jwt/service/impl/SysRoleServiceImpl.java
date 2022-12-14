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
 * ???????????????
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
     * ????????????
     *
     * @param allotMenuParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotMenu(AllotMenuParam allotMenuParam) {
        try {
            Long roleId = allotMenuParam.getRoleId();
            // ??????????????????????????????
            UpdateWrapper<SysRoleMenuResource> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleMenuResourceService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotMenuParam.getMenuIds())) {
                // ????????????
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
     * ????????????
     *
     * @param allotMenuParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotMenuVben(AllotMenuParam allotMenuParam) {
        try {
            Long roleId = allotMenuParam.getRoleId();
            // ??????????????????????????????
            UpdateWrapper<SysRoleMenuResourceVben> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleMenuResourceVbenService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotMenuParam.getMenuIds())) {
                // ????????????
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
     * ??????????????????
     *
     * @param allotPermissionParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotPermission(AllotPermissionParam allotPermissionParam) {
        try {
            Long roleId = allotPermissionParam.getRoleId();
            // ????????????????????????????????????
            UpdateWrapper<SysRolePermission> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRolePermissionService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotPermissionParam.getPermissionIds())) {
                // ??????????????????
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
     * ??????????????????
     *
     * @param allotDeptParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotDept(AllotDeptParam allotDeptParam) {
        try {
            Long roleId = allotDeptParam.getRoleId();
            // ????????????????????????????????????
            UpdateWrapper<SysRoleDept> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq(!ObjectTool.isEmpty(roleId), "role_id", roleId);
            sysRoleDeptService.remove(updateWrapper);
            if (!ObjectTool.isEmpty(allotDeptParam.getDeptIds())) {
                // ??????????????????
                List<SysRoleDept> list = new ArrayList<>();
                allotDeptParam.getDeptIds().forEach(id -> {
                    list.add(new SysRoleDept().setDeptId(id).setRoleId(roleId));
                });
                return sysRoleDeptService.saveBatch(list);
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("??????????????????");
        }
    }

    /**
     * ?????????????????????????????????
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
     * ????????????ID??????????????????
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
            //????????????
            super.create(MapperUtils.copy(param, sysRole));
            param.setId(sysRole.getId());
            //???????????????????????????????????????-????????????????????????tree?????????????????????????????????id????????????????????????id?????????id
            RoleParam roleParam = allotIdsHandler(param);
            //????????????
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
     * @description ??????id???????????????
     * @author yaolong
     * @date 2021/8/12 11:28
     *
     */
    private RoleParam allotIdsHandler(RoleParam param) {
        //================??????id?????? ????????????id???===============
        List<SysMenuResourceVben> menuResources = sysMenuResourceVbenService.list();
        List<Long> menuIds = param.getMenuIds();
        log.info("???????????????id:{}",menuIds);
        //????????????????????????pid(?????????pid)
        List<Long> menuPids = getMenuPIds(menuResources, menuIds);
        //??????
        menuIds.addAll(menuPids);
        List<Long> newMenuIds = menuIds.stream().distinct().collect(Collectors.toList());
        param.setMenuIds(newMenuIds);

        //===============??????id?????? ????????????id???===========
        List<SysDept> depts = sysDeptService.list();
        List<Long> deptIds = param.getDeptIds();
        //????????????????????????pid(?????????pid)
        List<Long> deptPids = getDeptPIds(depts,deptIds);
        //??????
        deptIds.addAll(deptPids);
        List<Long> newDeptIds = deptIds.stream().distinct().collect(Collectors.toList());
        param.setDeptIds(newDeptIds);

        //===============????????????id?????? ????????????===========
        return param;
    }

    /**
     * @param menuResources menuIds
     * @return java.util.List<java.lang.Long>
     * @description ????????????????????????????????????
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
     * @description ????????????????????????????????????
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
            //????????????
            SysRole role = MapperUtils.copy(param, new SysRole());
            role.setRemark(param.getRemark());
            super.update(role);
            RoleParam roleParam = allotIdsHandler(param);
            //????????????
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
            //????????????
            super.update(MapperUtils.copy(param, new SysRole()));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("??????????????????");
        }

    }

    private void allotResource(RoleParam param) {
        try {
            //????????????
            AllotDeptParam allotDeptParam = new AllotDeptParam();
            allotDeptParam.setRoleId(param.getId());
            allotDeptParam.setDeptIds(param.getDeptIds());
            allotDept(allotDeptParam);
            //????????????
            AllotMenuParam allotMenuParam = new AllotMenuParam();
            allotMenuParam.setRoleId(param.getId());
            allotMenuParam.setMenuIds(param.getMenuIds());
            allotMenuVben(allotMenuParam);
            //????????????
            AllotPermissionParam allotPermissionParam = new AllotPermissionParam();
            allotPermissionParam.setPermissionIds(param.getItfIds());
            allotPermissionParam.setRoleId(param.getId());
            allotPermission(allotPermissionParam);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("??????????????????");
        }

    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)) {
            //??????????????????????????????????????????
            QueryWrapper<SysRolePermission> rolePermissionQueryWrapper = new QueryWrapper<>();
            rolePermissionQueryWrapper.eq("role_id", id);
            sysRolePermissionService.remove(rolePermissionQueryWrapper);

            //??????????????????????????????????????????
            QueryWrapper<SysUserRole> userRoleQueryWrapper = new QueryWrapper<>();
            userRoleQueryWrapper.eq("role_id", id);
            sysUserRoleService.remove(userRoleQueryWrapper);

            //?????????????????????????????????????????????
            QueryWrapper<SysRoleDept> deptQueryWrapper = new QueryWrapper<>();
            userRoleQueryWrapper.eq("role_id", id);
            sysRoleDeptService.remove(deptQueryWrapper);

            //????????????????????????????????????
            QueryWrapper<SysRoleMenuResource> roleMenuQueryWrapper = new QueryWrapper<>();
            roleMenuQueryWrapper.eq("role_id", id);
            sysRoleMenuResourceService.remove(roleMenuQueryWrapper);

            return super.remove(id);
        }
        return false;
    }
}
