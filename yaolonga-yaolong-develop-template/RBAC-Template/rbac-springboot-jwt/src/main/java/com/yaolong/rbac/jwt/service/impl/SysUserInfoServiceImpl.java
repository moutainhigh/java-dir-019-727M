package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.commons.constant.GlobConstant;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto;
import com.yaolong.rbac.jwt.mapper.SysUserInfoMapper;
import com.yaolong.rbac.jwt.po.vbenAdmin.MenuItem;
import com.yaolong.rbac.jwt.po.vbenAdmin.UserInfo;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.UserParams;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
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
public class SysUserInfoServiceImpl extends BaseServiceImpl<SysUserInfoMapper, SysUserInfo> implements ISysUserInfoService {


    @Autowired
    private ISysUserService sysUserService;

    @Override
    public UserInfoDto userInfoByName(String username) {
        try {
//            QueryWrapper<UserInfo> queryWrapper = new QueryWrapper<>();
//            queryWrapper.eq("username", username);
            UserInfo userInfo = super.baseMapper.getUserInfoByName(username);
            return MapperUtils.copy(userInfo, new UserInfoDto());
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }


    @Override
    public UserInfoDto userInfoByContext() {
        return this.userInfoByName(LoginContext.getContentName());
    }

    /**
     * @param current
     * @param size
     * @param params
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto>
     * @description 分页获取
     * @author yaolong
     * @date 2021/8/9 15:44
     */
    @Override
    public IPage<UserInfoDto> page(int current, int size, UserParams params) {
        TableInfoHelper.initTableInfo(new MapperBuilderAssistant(new MybatisConfiguration(), ""), UserInfo.class);
        Page<UserInfo> page = new Page<>(current, size);
        LambdaQueryWrapper<UserInfo> wrapper = getUserInfoLambdaQueryWrapper(params);
        IPage<UserInfo> pageResult = super.baseMapper.page(page, wrapper);
        //去重
        pageResult.setRecords(pageResult.getRecords().stream().distinct().collect(Collectors.toList()));
        return pageResult.convert(info -> MapperUtils.copy(info, new UserInfoDto()));
    }


    @Override
    public List<UserInfoDto> list(UserParams params) {
        return MapperUtils.copyList(super.baseMapper.list(getUserInfoLambdaQueryWrapper(params)), UserInfoDto.class).stream().distinct().collect(Collectors.toList());
    }

    /**
     * @param params
     * @description 查詢wrapper
     * @date 2021/8/9 15:52
     */
    private LambdaQueryWrapper<UserInfo> getUserInfoLambdaQueryWrapper(UserParams params) {
        LambdaQueryWrapper<UserInfo> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(!ObjectTool.isEmpty(params.getNickName()), UserInfo::getNickName, params.getNickName())
                .like(!ObjectTool.isEmpty(params.getRealName()), UserInfo::getRealName, params.getRealName())
                .eq(!ObjectTool.isEmpty(params.getStatus()), UserInfo::getStatus, params.getStatus())
                .eq(!ObjectTool.isEmpty(params.getDeptId()), UserInfo::getDeptId, params.getDeptId())
                .like(!ObjectTool.isEmpty(params.getUsername()), UserInfo::getUsername, params.getUsername());
        return wrapper;
    }

}
