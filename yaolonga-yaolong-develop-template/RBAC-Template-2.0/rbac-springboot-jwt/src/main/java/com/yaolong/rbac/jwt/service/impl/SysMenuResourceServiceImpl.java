package com.yaolong.rbac.jwt.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.constant.GlobConstant;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysMenuMeta;
import com.yaolong.rbac.jwt.domain.SysMenuResource;
import com.yaolong.rbac.jwt.domain.SysRoleMenuResource;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuItemDto;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuItemNode;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuResourceDto;
import com.yaolong.rbac.jwt.dto.vbenAdmin.MenuResourceNode;
import com.yaolong.rbac.jwt.mapper.SysMenuResourceMapper;
import com.yaolong.rbac.jwt.po.MenuItem;
import com.yaolong.rbac.jwt.po.MenuResource;
import com.yaolong.rbac.jwt.service.ISysMenuMetaService;
import com.yaolong.rbac.jwt.service.ISysMenuResourceService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.service.ISysRoleMenuResourceService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.MenuParams;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-03
 */
@Service
@Slf4j
public class SysMenuResourceServiceImpl extends BaseServiceImpl<SysMenuResourceMapper, SysMenuResource> implements ISysMenuResourceService {



    @Resource
    public ISysRoleMenuResourceService studyRoleMenuResourceVbenService;

    @Resource
    public ISysMenuMetaService studyMenuMetaService;

    @Override
    public IPage<?> page(int current, int size, SysMenuResource domain) {
        Page<MenuResource> page = new Page<>(current, size);
        QueryWrapper<MenuResource> wrapper = new QueryWrapper<>();
        wrapper
                .eq(!ObjectTool.isEmpty(domain.getParentId()),"parent_id",domain.getParentId())
                .eq(!ObjectTool.isEmpty(domain.getStatus()),"status",domain.getStatus())
                .eq(!ObjectTool.isEmpty(domain.getName()),"name",domain.getName());
        return baseMapper.page(page, wrapper);
    }


    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean update(SysMenuResource domain) {
        domain.setUpdateBy(LoginContext.getContentName());

        boolean update = super.update(domain);
        SysMenuMeta meta = domain.getMeta();
        meta.setId(domain.getMetaId());
        boolean update1 = studyMenuMetaService.update(meta);
        return update && update1;
    }


    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean create(SysMenuResource domain) {

        //新增meta
        SysMenuMeta meta = domain.getMeta();
        boolean create1 = studyMenuMetaService.create(meta);

        //新增菜单
        domain.setMetaId(meta.getId());
        domain.setCreateBy(LoginContext.getContentName());
        boolean create2 = super.create(domain);
        return create1 && create2;
    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)){
            SysMenuResource studyMenuResource = super.get(id);

            //删除角色菜单关系
            QueryWrapper<SysRoleMenuResource> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("menu_id",id);
            studyRoleMenuResourceVbenService.remove(queryWrapper);

            //删除对应的meta
            studyMenuMetaService.remove(studyMenuResource.getMetaId());
            // 判断是否存在子菜单
            List<SysMenuResource> list = super.list();
            list.forEach(item ->{
                if (studyMenuResource.getId().equals(item.getParentId())){
                    throw new BusinessException("菜单下存在子菜单，请先删除子菜单");
                }
            });
            return super.remove(id);
        }
        return false;
    }


    @Override
    public List<String> getPermissionCode() {
        List<MenuResource> list = baseMapper.getMenuResourceListByUsername(LoginContext.getContentName());
        return list.stream().filter(menu -> GlobConstant.BUTTON.equals(menu.getMenuType())&& GlobConstant.ENABLE.equals(menu.getStatus())).map(MenuResource::getPermission).collect(Collectors.toList());
    }

    /**
     * 获取当前用户角色的菜单树
     *
     * @return
     */
    @Override
    public List<MenuResourceNode> treeListByUsername() {
        log.info("当前用户：{}", LoginContext.getContentName());
        List<MenuResource> list = baseMapper.getMenuResourceListByUsername(LoginContext.getContentName()).stream().filter(menu -> !GlobConstant.BUTTON.equals(menu.getMenuType())&& GlobConstant.ENABLE.equals(menu.getStatus())).collect(Collectors.toList());
        // 去重菜单资源（因为多个角色时可能会有重复的菜单权限）
        List<MenuResource> collect = list.stream().distinct().collect(Collectors.toList());
        return generateTree(collect, 0L);
    }

    /**
     * 根据角色id获取菜单树
     *
     * @return
     */
    @Override
    public  List<MenuResource> listByRoleId(Long roleId) {
        //此处由于多表查询可能会存在空对象，所以先把空对象过滤掉
        List<MenuResource> menuResources = baseMapper.getMenuResourceListByRoleId(roleId).stream().filter(ObjectUtil::isNotEmpty).collect(Collectors.toList());


        //找到所有父id
        List<Long> pids = menuResources.stream().map(MenuResource::getParentId).distinct().collect(Collectors.toList());

        //过滤父id的项
        return menuResources.stream().filter(resource -> !pids.contains(resource.getId())).collect(Collectors.toList());
    }

    @Override
    public List<MenuResourceNode> treeList() {
        List<MenuResource> all = baseMapper.getList(new QueryWrapper<>());
        log.info("条数:{}",all.size());
        return generateTree(all, 0L);
    }

    @SneakyThrows
    @Override
    public List<MenuItemNode> treeMenus(MenuParams params) {
        TableInfoHelper.initTableInfo(new MapperBuilderAssistant(new MybatisConfiguration(), ""), MenuItem.class);
        LambdaQueryWrapper<MenuItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!ObjectUtil.isEmpty(params.getMenuName()),MenuItem::getMenuName,params.getMenuName())
                .eq(!ObjectUtil.isEmpty(params.getStatus()),MenuItem::getStatus,params.getStatus());
        List<MenuItem> menuItems = baseMapper.getMenuItems(wrapper);

        if (menuItems.size()>0) {
            //如果MenuName为空就不查子
            if (!ObjectUtil.isEmpty(params.getMenuName())){
                menuItems.addAll(getChildrenMenuList(menuItems,MapperUtils.copy(params,new MenuItem())));
            }
            log.info("条数：{}",menuItems);
            return generateItemTree(menuItems, getMaxParentId(menuItems));
        }
        return new ArrayList<>();
    }

    /**
     * @description 获取最大的pid
     * @param menuItems
     * @return void
     * @author yaolong
     * @date 2021/8/6 11:19
     */
    private Long getMaxParentId(List<MenuItem> menuItems) {
        List<Long> collect = menuItems.stream().sorted(Comparator.comparing(MenuItem::getParentId)).map(MenuItem::getParentId).collect((Collectors.toList()));
        return collect.get(0);
    }

    /**
     * @description 获取孩子菜单列表
     * @param menuItems
     * @return java.util.List<com.yaolong.rbac.jwt.po.MenuItem>
     * @author yaolong
     * @date 2021/8/6 10:41
     */
    private List<MenuItem> getChildrenMenuList(List<MenuItem> menuItems,MenuItem params) {
        //新建一个list实例防止list并发修改异常
        List<MenuItem> menuItems2 = new ArrayList<>();
        //如果有孩子节点就把孩子节点查出来
        menuItems.forEach(item ->{
            LambdaQueryWrapper<MenuItem> wrapper2 = new LambdaQueryWrapper<>();
            wrapper2.eq(MenuItem::getParentId, item.getId()).eq(!ObjectUtil.isEmpty(params.getStatus()),MenuItem::getStatus, params.getStatus());
            menuItems2.addAll(baseMapper.getMenuItems(wrapper2));
            menuItems2.addAll(getChildrenMenuList(menuItems2,params));
        });
        return menuItems2;
    }

    /**
     * 生成菜单树
     *
     * @param menuResources
     * @param startId 开始生成的id
     * @return
     */
    public List<MenuResourceNode> generateTree(List<MenuResource> menuResources,Long startId) {
        List<MenuResourceDto> menuResourceDtos = MapperUtils.copyList(menuResources, MenuResourceDto.class);
        return menuResourceDtos.stream()
                .filter(subMenuResource -> subMenuResource.getParentId().equals(startId))
                .map(menuResource -> recursion(menuResource, menuResourceDtos)).sorted(Comparator.comparing(l-> l.getMeta().getOrderNo()))
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
                .filter(subMenuResource -> {
                    return subMenuResource.getParentId().equals(menuResourceDto.getId());
                } )
                .map(menuResource -> recursion(menuResource, menuResourceDtos))
                .collect(Collectors.toList());
        resourceNode.setChildren(nodes);
        return resourceNode;
    }




    /**
     * 递归拼接生成菜单树 (meta合并版)
     *
     * @param menuItemDto
     * @param menuItemDtos
     * @return
     */
    private MenuItemNode recursionItem(MenuItemDto menuItemDto, List<MenuItemDto> menuItemDtos) {
        MenuItemNode menuItemNode = MapperUtils.copy(menuItemDto, new MenuItemNode());
        List<MenuItemNode> nodes = menuItemDtos.stream()
                .filter(subMenuResource -> {
                    return subMenuResource.getParentId().equals(menuItemDto.getId());
                } )
                .map(menuResource -> recursionItem(menuResource, menuItemDtos))
                .collect(Collectors.toList());

        if(nodes.size()>0){
            menuItemNode.setChildren(nodes);
        }else {
            menuItemNode.setChildren(null);
        }
        return menuItemNode;
    }



    /**
     * 生成菜单树 递归拼接生成菜单树 (meta合并版)
     *
     * @param menuItems
     * @param startId 查询开始的id（menuItems中最大的parentId）
     * @return
     */
    public List<MenuItemNode> generateItemTree(List<MenuItem> menuItems,Long startId) {
        List<MenuItemDto> menuResourceDtos = MapperUtils.copyList(menuItems, MenuItemDto.class);
        return menuResourceDtos.stream()
                .filter(subMenuResource -> subMenuResource.getParentId().equals(startId))
                .map(menuResource -> recursionItem(menuResource, menuResourceDtos)).sorted(Comparator.comparing(MenuItemDto::getOrderNo))
                .collect(Collectors.toList());
    }







}
