package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.domain.SysRoleMenuResource;
import com.yaolong.rbac.jwt.dto.MenuResourceDto;
import com.yaolong.rbac.jwt.dto.MenuResourceNode;
import com.yaolong.rbac.jwt.mapper.SysMenuResourceMapper;
import com.yaolong.rbac.jwt.po.MenuResource;
import com.yaolong.rbac.jwt.service.ISysMenuResourceService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Slf4j
public class SysMenuResourceServiceImpl extends BaseServiceImpl<SysMenuResourceMapper, SysMenuResource> implements ISysMenuResourceService {

    @Resource
    public SysMenuResourceMapper sysMenuResourceMapper;


    @Resource
    public ISysRoleMenuResourceService studyRoleMenuResourceService;

    @Override
    public IPage<?> page(int current, int size, SysMenuResource domain) {
        Page<SysMenuResource> page = new Page<>(current, size);
        QueryWrapper<SysMenuResource> wrapper = new QueryWrapper<>();
        wrapper.eq(!ObjectTool.isEmpty(domain.getParentId()),"parent_id",domain.getParentId());
        return super.page(page, wrapper);
    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)){

            //删除角色菜单关系
            QueryWrapper<SysRoleMenuResource> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("menu_id",id);
            studyRoleMenuResourceService.remove(queryWrapper);

            // 判断是否存在子菜单
            SysMenuResource sysMenuResource = super.get(id);
            List<SysMenuResource> list = super.list();
            list.forEach(item ->{
                if (sysMenuResource.getId().equals(item.getParentId())){
                    throw new BusinessException("菜单下存在子菜单，请先删除子菜单");
                }
            });
            return super.remove(id);
        }
        return false;
    }

    /**
     * 获取当前用户角色的菜单树
     *
     * @return
     */
    @Override
    public List<MenuResourceNode> treeListByUsername() {
        log.info("当前用户：{}",LoginContext.getContentName());
        List<MenuResource> list = sysMenuResourceMapper.getMenuResourceListByUsername(LoginContext.getContentName());
        // 去重菜单资源（因为多个角色时可能会有重复的菜单权限）
        List<SysMenuResource> collect = list.stream().distinct().map(menuResource -> MapperUtils.copy(menuResource, new SysMenuResource())).collect(Collectors.toList());
        return generateTree(collect);
    }

    /**
     * 根据角色id获取菜单树
     *
     * @return
     */
    @Override
    public  List<MenuResource> listByRoleId(Long roleId) {
        return sysMenuResourceMapper.getMenuResourceListByRoleId(roleId);
    }

    @Override
    public List<MenuResourceNode> treeList() {
        List<SysMenuResource> all = super.getAll();
        return generateTree(all);
    }

    /**
     * 生成菜单树
     *
     * @param menuResources
     * @return
     */
    public List<MenuResourceNode> generateTree(List<SysMenuResource> menuResources) {
        List<MenuResourceDto> menuResourceDtos = MapperUtils.copyList(menuResources, MenuResourceDto.class);
        return menuResourceDtos.stream()
                .filter(subMenuResource -> subMenuResource.getParentId().equals(0L))
                .map(menuResource -> recursion(menuResource, menuResourceDtos))
                .collect(Collectors.toList());
    }

    /**
     * 递归拼接生成菜单树
     *
     * @param menuResourceDto
     * @param menuResourceDtos
     * @return
     */
    private MenuResourceNode recursion(MenuResourceDto menuResourceDto, List<MenuResourceDto> menuResourceDtos) {
        MenuResourceNode resourceNode = MapperUtils.copy(menuResourceDto, new MenuResourceNode());
        List<MenuResourceNode> nodes = menuResourceDtos.stream()
                .filter(subMenuResource -> subMenuResource.getParentId().equals(menuResourceDto.getId()))
                .map(menuResource -> recursion(menuResource, menuResourceDtos))
                .collect(Collectors.toList());
        resourceNode.setChildren(nodes);
        return resourceNode;
    }




}
