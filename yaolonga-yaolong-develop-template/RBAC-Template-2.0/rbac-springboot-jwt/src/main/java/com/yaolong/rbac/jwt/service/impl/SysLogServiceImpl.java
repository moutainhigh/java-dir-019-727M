package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysDict;
import com.yaolong.rbac.jwt.domain.SysLog;
import com.yaolong.rbac.jwt.mapper.SysLogMapper;
import com.yaolong.rbac.jwt.service.ISysLogService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 系统日志 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@Service
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLog> implements ISysLogService {
    @Override
    public IPage<?> page(int current, int size, SysLog domain) {
        IPage<SysLog> page = new Page<>(current,size);
        LambdaQueryWrapper<SysLog> wrapper = getSysDictLambdaQueryWrapper(domain);
        return super.page(page,wrapper);
    }


    @Override
    public List<SysLog> list(SysLog domain) {
        LambdaQueryWrapper<SysLog> wrapper = getSysDictLambdaQueryWrapper(domain);
        return super.list(wrapper);
    }

    /**
     * 获取wrapper
     */
    private LambdaQueryWrapper<SysLog> getSysDictLambdaQueryWrapper(SysLog domain) {
        LambdaQueryWrapper<SysLog> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!ObjectTool.isEmpty(domain.getUsername()), SysLog::getUsername, domain.getUsername())
                .eq(!ObjectTool.isEmpty(domain.getOperation()), SysLog::getOperation, domain.getOperation())
                .eq(!ObjectTool.isEmpty(domain.getIsSuccess()), SysLog::getIsSuccess, domain.getIsSuccess())
                .eq(!ObjectTool.isEmpty(domain.getUrl()), SysLog::getUrl, domain.getUrl())
                .eq(!ObjectTool.isEmpty(domain.getRequestType()), SysLog::getRequestType, domain.getRequestType())
                .orderByDesc(SysLog::getCreateTime);
        return wrapper;
    }
}
