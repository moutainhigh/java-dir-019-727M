package com.yaolong.rbac.jwt.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.component.DynamicSecurityMetadataSource;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.domain.SysPermissionCategory;
import com.yaolong.rbac.jwt.domain.SysRolePermission;
import com.yaolong.rbac.jwt.dto.vbenAdmin.PermissionDto;
import com.yaolong.rbac.jwt.dto.vbenAdmin.PermissionNode;
import com.yaolong.rbac.jwt.mapper.SysPermissionMapper;
import com.yaolong.rbac.jwt.po.Permission;
import com.yaolong.rbac.jwt.service.ISysPermissionCategoryService;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysRolePermissionService;
import com.yaolong.rbac.jwt.vo.PermissionParam;
import lombok.SneakyThrows;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

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
    ISysRolePermissionService sysRolePermissionService;

    @Autowired
    DynamicSecurityMetadataSource dynamicSecurityMetadataSource;

    @Autowired
    ISysPermissionCategoryService sysPermissionCategoryService;

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
            wrapper.eq("permission_id", id);
            sysRolePermissionService.remove(wrapper);

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
                .like(!ObjectTool.isEmpty(domain.getRemark()), "remark", domain.getRemark())
                .like(!ObjectTool.isEmpty(domain.getSort()), "sort", domain.getSort());
        Page<SysPermission> page = new Page<>(current, size);
        return super.page(page, queryWrapper);
    }

    @SneakyThrows
    @Override
    public List<SysPermission> getPermissionListByRoleId(Long roleId) {
        return sysPermissionMapper.getPermissionListByRoleId(roleId).stream().filter(ObjectUtil::isNotEmpty).collect(Collectors.toList());
    }

    @Override
    public List<PermissionNode> getPermissionTree() {
        //所有的接口权限
        List<SysPermission> allPermission = super.getAll();
        //所有的接口权限分类
        List<SysPermissionCategory> allPermissionCate = sysPermissionCategoryService.getAll();

        //将接口权限分类列表转换为PermissionNode作为父级
        List<PermissionNode> permissionCateNodes = allPermissionCate.stream().map(p -> MapperUtils.copy(p, new PermissionNode())).collect(Collectors.toList());

        //拼装接口权限树
        return permissionCateNodes.stream().peek(pc -> {
            //拿到当前接口类别的所有接口资源并转换为PermissionNode
            List<PermissionNode> children = allPermission.stream().filter(ap -> ap.getCategoryId().equals(pc.getId())).map(p -> MapperUtils.copy(p, new PermissionNode())).collect(Collectors.toList());
            //以当前的分类为父级设置处理好的接口权限为子级
            pc.setChildren(children);
            pc.setId((long) (Math.random() * 10000));
            //返回处理好的数据结构
        }).collect(Collectors.toList());
    }

    @Override
    public List<PermissionDto> getList(PermissionParam param) {
        return MapperUtils.copyList(baseMapper.getPermissionList(new QueryWrapper<>()), PermissionDto.class);
    }

    @Override
    public IPage<PermissionDto> getPage(int current, int size, PermissionParam param) {
        TableInfoHelper.initTableInfo(new MapperBuilderAssistant(new MybatisConfiguration(), ""), Permission.class);
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(!ObjectTool.isEmpty(param.getName()), "p.name", param.getName())
                .eq(!ObjectTool.isEmpty(param.getStatus()), "status", param.getStatus())
                .eq(!ObjectTool.isEmpty(param.getCategoryId()), "category_id", param.getCategoryId())
                .eq(!ObjectTool.isEmpty(param.getType()), "type", param.getType());
        Page<Permission> page = new Page<>(current, size);
        return baseMapper.getPermissionPage(page, queryWrapper).convert(p -> MapperUtils.copy(p, new PermissionDto()));
    }


}
