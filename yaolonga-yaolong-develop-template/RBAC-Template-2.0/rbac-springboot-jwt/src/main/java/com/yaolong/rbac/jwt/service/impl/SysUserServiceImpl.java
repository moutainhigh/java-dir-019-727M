package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yaolong.rbac.commons.constant.GlobConstant;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.jwt.domain.SysUserInfo;
import com.yaolong.rbac.jwt.domain.SysUserRole;
import com.yaolong.rbac.jwt.dto.elementAdmin.UserDto;
import com.yaolong.rbac.jwt.mapper.SysUserMapper;
import com.yaolong.rbac.jwt.po.User;
import com.yaolong.rbac.jwt.service.ISysLoginService;
import com.yaolong.rbac.jwt.service.ISysUserInfoService;
import com.yaolong.rbac.jwt.service.ISysUserRoleService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import com.yaolong.rbac.jwt.utils.LoginContext;
import com.yaolong.rbac.jwt.vo.AllotRoleParam;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;
import com.yaolong.rbac.jwt.vo.UserParams;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    ISysUserRoleService sysUserRoleService;

    @Resource
    ISysLoginService sysLoginService;

    @Resource
    ISysUserInfoService sysUserInfoService;


    @Resource
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean create(SysUser domain) {
        UserDto register = sysLoginService.register(MapperUtils.copy(domain, new RegisterUserParam()));
        return null != register;
    }


    @Override
    public IPage<?> page(int current, int size, SysUser domain) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(!ObjectTool.isEmpty(domain.getUsername()), "username", domain.getUsername())
                .eq(!ObjectTool.isEmpty(domain.getRemark()), "remark", domain.getRemark())
                .eq(!ObjectTool.isEmpty(domain.getStatus()), "status", domain.getStatus());
        Page<SysUser> page = new Page<>(current, size);
        return super.page(page, queryWrapper);
    }


    /**
     * 分配角色
     *
     * @param allotRoleParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean allotRole(AllotRoleParam allotRoleParam) {
        Long userId = allotRoleParam.getUserId();
        if (!ObjectTool.isEmpty(allotRoleParam.getRoleIds())) {
            // 删除当前用户的所有角色
            UpdateWrapper<SysUserRole> wrapper = new UpdateWrapper<>();
            wrapper.eq("user_id", userId);
            boolean remove = sysUserRoleService.remove(wrapper);
            // 分配角色
            List<SysUserRole> list = new ArrayList<>();
            allotRoleParam.getRoleIds().forEach(id -> {
                SysUserRole sysUserRole = new SysUserRole().setRoleId(id).setUserId(userId);
                list.add(sysUserRole);
            });
            return sysUserRoleService.saveBatch(list);
        }
        throw new BusinessException("分配失败");
    }

    /**
     * 获取用户信息
     *
     * @return
     */
    @Override
    public UserDto getUserInfo() {
        try {
            QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
            System.out.println(LoginContext.getContentName());
            queryWrapper.eq("username", LoginContext.getContentName());
            return MapperUtils.copy(super.getOne(queryWrapper), new UserDto(), "remark");
        } catch (Exception e) {
            throw new BusinessException(e.getMessage());
        }
    }


    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean update(UserParams params) {
        try {
            checkIds(params);
            //更新用户账户
            SysUser user = MapperUtils.copy(params, new SysUser(), "remark");
            user.setId(params.getUserId());
            user.setStatus(params.getStatus());
            user.setUsername(params.getUsername());
            super.update(user);
            //更新用户信息
            SysUserInfo userInfo = MapperUtils.copy(params, new SysUserInfo());
            sysUserInfoService.update(userInfo);
            //更新角色信息 （分配角色）
            AllotRoleParam allotRoleParam = new AllotRoleParam();
            allotRoleParam.setUserId(params.getUserId());
            allotRoleParam.setRoleIds(params.getRoles());
            allotRole(allotRoleParam);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new BusinessException("更新异常");
        }

    }

    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean create(UserParams params) {
        try {
            //验证用户是否已经存在
            SysUser sysUser1 = getOne(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, params.getUsername()));
            if (!ObjectTool.isEmpty(sysUser1)) {
                throw new BusinessException(ResponseCode.USER_HAS_EXISTED);
            }
            //添加用户
            SysUser sysUser = new SysUser();
            sysUser.setPassword(new BCryptPasswordEncoder().encode(GlobConstant.DEFAULT_PASSWORD));
            sysUser.setUsername(params.getUsername());
            sysUser.setStatus(params.getStatus());
            super.create(sysUser);
            //添加用户信息
            sysUserInfoService.create(MapperUtils.copy(params, new SysUserInfo()).setUserId(sysUser.getId()));
            //添加角色信息（分配角色）
            AllotRoleParam allotRoleParam = new AllotRoleParam();
            allotRoleParam.setUserId(sysUser.getId());
            allotRoleParam.setRoleIds(params.getRoles());
            allotRole(allotRoleParam);
            return true;
        } catch (Exception ex) {
            throw new BusinessException(ex.getMessage());
        }
    }

    private void checkIds(UserParams params) {
        if (ObjectTool.isEmpty(params.getId()) && ObjectTool.isEmpty(params.getUserId())) {
            throw new BusinessException("用户id或用户信息id不能为空");
        }
    }

    @Override
    public boolean update(SysUser domain) {
        if (!StringUtils.isEmpty(domain.getPassword())) {
            domain.setPassword(bCryptPasswordEncoder.encode(domain.getPassword()));
        }
        return super.update(domain);
    }


    @Override
    @Transactional(rollbackFor = BusinessException.class)
    public boolean remove(Long id) {
        if (checkId(id)) {
            try {
                //删除角色
                QueryWrapper<SysUserRole> wrapper = new QueryWrapper<>();
                wrapper.eq("user_id", id);
                sysUserRoleService.remove(wrapper);
                //删除用户信息
                LambdaQueryWrapper<SysUserInfo> uwrapper = new LambdaQueryWrapper<>();
                uwrapper.eq(SysUserInfo::getUserId, id);
                sysUserInfoService.remove(uwrapper);
                //删除账号
                super.removeById(id);
                return true;
            } catch (Exception ex) {
                throw new BusinessException("删除用户异常");
            }
        }
        return false;
    }
}
