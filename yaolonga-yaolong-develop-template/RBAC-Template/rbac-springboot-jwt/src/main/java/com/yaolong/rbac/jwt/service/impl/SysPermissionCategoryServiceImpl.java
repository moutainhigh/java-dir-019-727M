package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysPermissionCategory;
import com.yaolong.rbac.jwt.mapper.SysPermissionCategoryMapper;
import com.yaolong.rbac.jwt.service.ISysPermissionCategoryService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@Service
public class SysPermissionCategoryServiceImpl extends BaseServiceImpl<SysPermissionCategoryMapper, SysPermissionCategory> implements ISysPermissionCategoryService {


    @Override
    public IPage<?> page(int current, int size, SysPermissionCategory domain) {
        LambdaQueryWrapper<SysPermissionCategory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!ObjectTool.isEmpty(domain.getName()),SysPermissionCategory::getName,domain.getName())
                .eq(!ObjectTool.isEmpty(domain.getDescription()),SysPermissionCategory::getDescription,domain.getDescription());
        Page<SysPermissionCategory> page = new Page<>(current,size);
        return super.page(page, wrapper);
    }
}
