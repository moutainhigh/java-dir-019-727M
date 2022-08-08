package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysDict;
import com.yaolong.rbac.jwt.mapper.SysDictMapper;
import com.yaolong.rbac.jwt.service.ISysDictService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 数据字典表 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@Service
public class SysDictServiceImpl extends BaseServiceImpl<SysDictMapper, SysDict> implements ISysDictService {

    @Override
    public IPage<?> page(int current, int size, SysDict domain) {
        IPage<SysDict> page = new Page<>(current,size);
        LambdaQueryWrapper<SysDict> wrapper = getSysDictLambdaQueryWrapper(domain);
        return super.page(page,wrapper);
    }


    @Override
    public List<SysDict> list(SysDict domain) {
        LambdaQueryWrapper<SysDict> wrapper = getSysDictLambdaQueryWrapper(domain);
        return super.list(wrapper);
    }

    /**
     * 获取wrapper
     */
    private LambdaQueryWrapper<SysDict> getSysDictLambdaQueryWrapper(SysDict domain) {
        LambdaQueryWrapper<SysDict> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!ObjectTool.isEmpty(domain.getLabel()), SysDict::getLabel, domain.getLabel())
                .eq(!ObjectTool.isEmpty(domain.getStatus()), SysDict::getStatus, domain.getStatus())
                .eq(!ObjectTool.isEmpty(domain.getName()), SysDict::getName, domain.getName())
                .eq(!ObjectTool.isEmpty(domain.getType()), SysDict::getType, domain.getType())
                .eq(!ObjectTool.isEmpty(domain.getRemark()), SysDict::getRemark, domain.getRemark());
        return wrapper;
    }


}
