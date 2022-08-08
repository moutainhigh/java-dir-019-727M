package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.ListPageUtil;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.dto.vbenAdmin.UserInfoDto;
import com.yaolong.rbac.jwt.mapper.SysUserInfoMapper;
import com.yaolong.rbac.jwt.po.UserInfo;
import com.yaolong.rbac.jwt.service.ISysDeptService;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.UserParams;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
public class SysUserInfoServiceImpl extends BaseServiceImpl<SysUserInfoMapper, SysUserInfo> implements ISysUserInfoService {


    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private ISysDeptService sysDeptService;


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
        IPage<UserInfo> pageResult;
        if (!ObjectTool.isEmpty(params.getDeptId())) {
            // 当部门id不为空的时候要实现查到部门下所有子部门的所有用户必须用手动分页实现
            pageResult = getResultList(current, size, params);
        } else {
            pageResult = baseMapper.page(new Page<>(current, size), getUserInfoLambdaQueryWrapper(params));
        }
        return pageResult.convert(info -> MapperUtils.copy(info, new UserInfoDto()));
    }

    /**
     * <p>
     * 获取手动分页后的数据列表
     * </p>
     *
     * @param params
     * @return java.util.List<java.lang.Long>
     * @version 1.0.0 <br>
     * @date 2021/8/20 14:30 <br>
     * @author yaolonga <br>
     */
    private IPage<UserInfo> getResultList(int current, int size, UserParams params) {
        Long pid = params.getDeptId();
        //过滤为id集合
        List<Long> ids = getIds(params);
        //添加父id
        ids.add(pid);

        //用户信息列表
        List<UserInfo> list = new ArrayList<>();
        //将所有符合条件的列表查出来
        ids.forEach(id -> {
            params.setDeptId(id);
            list.addAll(baseMapper.list(getUserInfoLambdaQueryWrapper(params)));
        });
        //去重
        List<UserInfo> collect = list.stream().distinct().collect(Collectors.toList());
        //手动分页
        ListPageUtil<UserInfo> page = new ListPageUtil<>(collect, current, size);
        IPage<UserInfo> pageResult = new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        pageResult.setRecords(page.getPagedList());
        return pageResult;
    }

    /**
     * <p>
     * 获取当前树以及所有子树id
     * </p>
     *
     * @param
     * @param params
     * @return java.util.List<java.lang.Long>
     * @version 1.0.0 <br>
     * @date 2021/8/20 15:43 <br>
     * @author yaolonga <br>
     */
    private List<Long> getIds(UserParams params) {
        //查询所有子部门
        QueryWrapper<SysDept> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(SysDept::getParentId, params.getDeptId());
        List<Long> ids = sysDeptService.list(wrapper).stream().map(SysDept::getId).collect(Collectors.toList());

        List<Long> cids = new ArrayList<>();
        ids.forEach(id -> {
            params.setDeptId(id);
            cids.addAll(getIds(params));
            cids.add(id);
        });
        cids.addAll(ids);
        return cids.stream().distinct().collect(Collectors.toList());
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
        QueryWrapper<UserInfo> wrapper = new QueryWrapper<>();
        LambdaQueryWrapper<UserInfo> distinct_userId = wrapper.select("DISTINCT ui.id").lambda();
        distinct_userId.like(!ObjectTool.isEmpty(params.getNickName()), UserInfo::getNickName, params.getNickName())
                .like(!ObjectTool.isEmpty(params.getRealName()), UserInfo::getRealName, params.getRealName())
                .eq(!ObjectTool.isEmpty(params.getStatus()), UserInfo::getStatus, params.getStatus())
                .eq(!ObjectTool.isEmpty(params.getDeptId()), UserInfo::getDeptId, params.getDeptId())
                .like(!ObjectTool.isEmpty(params.getUsername()), UserInfo::getUsername, params.getUsername())
                .groupBy(UserInfo::getUserId); //此处分组只为去从
        return distinct_userId;
    }

}
