package com.yaolong.rbac.jwt.service.impl;

import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.jwt.bo.AdminUserDetails;
import com.yaolong.rbac.jwt.mapper.SysPermissionMapper;
import com.yaolong.rbac.jwt.mapper.SysUserMapper;
import com.yaolong.rbac.jwt.po.Permission;
import com.yaolong.rbac.jwt.po.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-10
 */
@Service
public class SysUserDetailServiceImpl implements  UserDetailsService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Resource
    private SysPermissionMapper sysPermissionMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = sysUserMapper.findByUserName(s);
        if (null == user){
            throw new BusinessException(ResponseCode.USER_NOT_EXIST);
        }

        List<Permission> permissionList = sysPermissionMapper.getPermissionListByUserId(user.getId());


        List<GrantedAuthority> authorities = new ArrayList<>();
        permissionList.forEach(permission ->{
            if (permission != null&& permission.getName() != null){
                GrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(permission.getId() + ":" + permission.getName());
                authorities.add(simpleGrantedAuthority);
            }
        });
        return new AdminUserDetails(user,authorities);
    }
}
