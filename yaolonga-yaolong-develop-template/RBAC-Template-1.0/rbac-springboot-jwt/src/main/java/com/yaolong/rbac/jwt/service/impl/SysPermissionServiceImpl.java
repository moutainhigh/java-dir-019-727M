package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.component.DynamicSecurityMetadataSource;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.domain.SysRolePermission;
import com.yaolong.rbac.jwt.mapper.SysPermissionMapper;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

    @Resource
    SysPermissionMapper sysPermissionMapper;


    @Resource
    ISysRolePermissionService studyRolePermissionService;

    @Autowired
    DynamicSecurityMetadataSource dynamicSecurityMetadataSource;


    @Override
    public boolean create(SysPermission domain) {
        boolean b = super.create(domain);
        if (b) {
            // 接口资源添加成功后进行重载权限资源
            dynamicSecurityMetadataSource.loadDataSource();
        }
        return b;
    }

    @Override
    public boolean remove(Long id) {
        if (checkId(id)) {
            // 刪除角色权限关系
            QueryWrapper<SysRolePermission> wrapper = new QueryWrapper<>();
            wrapper.eq("permission_id",id);
            studyRolePermissionService.remove(wrapper);

            boolean remove = super.removeById(id);
            // 接口资源删除成功后进行重载权限资源
            dynamicSecurityMetadataSource.loadDataSource();
            return remove;
        }
        return false;
    }

    @Override
    public boolean update(SysPermission domain) {
        boolean update = super.update(domain);
        if (update) {
            // 接口资源修改成功后进行重载权限资源
            dynamicSecurityMetadataSource.loadDataSource();
        }
        return update;
    }

    @Override
    public IPage<?> page(int current, int size, SysPermission domain) {
        QueryWrapper<SysPermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(!ObjectTool.isEmpty(domain.getName()), "name", domain.getName())
                .like(!ObjectTool.isEmpty(domain.getPath()), "path", domain.getPath())
                .eq(!ObjectTool.isEmpty(domain.getCategoryId()), "category_id", domain.getCategoryId())
                .eq(!ObjectTool.isEmpty(domain.getType()), "type", domain.getType())
                .like(!ObjectTool.isEmpty(domain.getDescription()), "description", domain.getDescription())
                .like(!ObjectTool.isEmpty(domain.getSort()), "sort", domain.getSort());
        Page<SysPermission> page = new Page<>(current, size);
        return super.page(page, queryWrapper);
    }

    @Override
    public List<SysPermission> getPermissionListByRoleId(Long roleId) {
        return sysPermissionMapper.getPermissionListByRoleId(roleId);
    }
}
