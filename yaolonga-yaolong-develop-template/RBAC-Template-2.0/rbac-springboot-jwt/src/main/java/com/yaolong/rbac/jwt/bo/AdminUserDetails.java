package com.yaolong.rbac.jwt.bo;

import com.yaolong.rbac.commons.base.BaseDomain;
import com.yaolong.rbac.jwt.domain.SysRole;
import com.yaolong.rbac.jwt.po.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

/**
 * @program: study-project
 * @description:
 * @author: yaolong
 * @create: 2021-05-11 17:19
 **/
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class AdminUserDetails extends BaseDomain implements UserDetails {

    private static final long serialVersionUID = 1L;
    /**
     * 用户
     */
    private User user;

    List<GrantedAuthority> authority;


    /**
     * 角色列表
     */
    private List<SysRole> roles;


    public AdminUserDetails(User user,List<GrantedAuthority> authority){
        this.user = user;
        this.authority = authority;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authority;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.getStatus();
    }
}
