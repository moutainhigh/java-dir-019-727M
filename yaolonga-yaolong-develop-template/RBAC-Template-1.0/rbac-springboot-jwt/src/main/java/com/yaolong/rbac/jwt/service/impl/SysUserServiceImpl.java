package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.jwt.domain.SysUserRole;
import com.yaolong.rbac.jwt.dto.UserDto;
import com.yaolong.rbac.jwt.mapper.SysUserMapper;
import com.yaolong.rbac.jwt.service.ISysLoginService;
import com.yaolong.rbac.jwt.service.ISysUserRoleService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
@Service
@Slf4j
public class SysUserServiceImpl extends BaseServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Resource
    ISysUserRoleService studyUserRoleService;

    @Resource
    ISysLoginService studyLoginService;

    @Resource
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean create(SysUser domain) {
        UserDto register = studyLoginService.register(MapperUtils.copy(domain, new RegisterUserParam()));
        return null != register;
    }


    @Override
    public IPage<?> page(int current, int size, SysUser domain) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(!ObjectTool.isEmpty(domain.getUsername()),"username",domain.getUsername())
                    .eq(!ObjectTool.isEmpty(domain.getRemark()),"remark",domain.getRemark())
                    .eq(!ObjectTool.isEmpty(domain.getStatus()),"status",domain.getStatus());
        Page<SysUser> page = new Page<>(current,size);
        return super.page(page, queryWrapper);
    }


    /**
     * 分配角色
     * @param allotRoleParam
     * @return
     */
    @Override
    public boolean allotRole(AllotRoleParam allotRoleParam) {
        Long userId = allotRoleParam.getUserId();
        if (!ObjectTool.isEmpty(allotRoleParam.getRoleIds())){
            // 删除当前用户的所有角色
            UpdateWrapper<SysUserRole> wrapper = new UpdateWrapper<>();
            wrapper.eq("user_id",userId);
            boolean remove = studyUserRoleService.remove(wrapper);
            // 分配角色
            List<SysUserRole> list = new ArrayList<>();
            allotRoleParam.getRoleIds().forEach(id ->{
                SysUserRole sysUserRole = new SysUserRole().setRoleId(id).setUserId(userId);
                list.add(sysUserRole);
            });
            return studyUserRoleService.saveBatch(list);
        }
        throw new BusinessException("分配失败");
    }

    /**
     * 获取用户信息
     * @return
     */
    @Override
    public UserDto getUserInfo() {
        try {
            QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
            System.out.println(LoginContext.getContentName());
            queryWrapper.eq("username",LoginContext.getContentName());
            return MapperUtils.copy(super.getOne(queryWrapper),new UserDto(),"remark");
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }


    @Override
    public boolean update(SysUser domain) {
        if (!StringUtils.isEmpty(domain.getPassword())){
            domain.setPassword(bCryptPasswordEncoder.encode(domain.getPassword()));
        }
        return super.update(domain);
    }


    @Override
    public boolean remove(Long id) {
        if (checkId(id)) {
            QueryWrapper<SysUserRole> wrapper = new QueryWrapper<>();
            wrapper.eq("user_id",id);
            studyUserRoleService.remove(wrapper);
            return super.removeById(id);
        }
        return false;
    }
}
