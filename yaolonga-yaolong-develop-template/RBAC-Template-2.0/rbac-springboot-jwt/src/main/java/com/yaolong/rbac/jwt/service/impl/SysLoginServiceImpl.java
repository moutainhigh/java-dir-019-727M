package com.yaolong.rbac.jwt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.jwt.domain.SysUser;
import com.yaolong.rbac.jwt.dto.elementAdmin.UserDto;
import com.yaolong.rbac.jwt.service.ISysLoginService;
import com.yaolong.rbac.jwt.service.ISysUserService;
import com.yaolong.rbac.jwt.util.JwtTokenUtil;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: study-project
 * @description:
 * @author: yaolong
 * @create: 2021-05-11 19:47
 **/
@Service
@Slf4j
public class SysLoginServiceImpl implements ISysLoginService {

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Resource
    private HttpServletRequest request;

    @Resource
    private JwtTokenUtil jwtTokenUtil;

    @Resource
    private PasswordEncoder passwordEncoder;

    @Resource
    private SysUserDetailServiceImpl userDetailService;

    @Resource
    private ISysUserService sysUserService;


    @Override
    public Map<String, String> login(String username, String password) {
        Map<String, String> tokenMap = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = userDetailService.loadUserByUsername(username);
            if(!passwordEncoder.matches(password,userDetails.getPassword())){
                throw new BusinessException(ResponseCode.USER_LOGIN_ERROR);
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            String token = jwtTokenUtil.generateToken(userDetails);
            if (null == token){
                throw  new BusinessException(ResponseCode.USER_LOGIN_ERROR);
            }
             tokenMap = new HashMap<>();
            tokenMap.put("token", token);
            tokenMap.put("tokenHead", tokenHead);
        } catch (AuthenticationException e) {
            log.warn("登录异常:{}", e.getMessage());
        }
        return tokenMap;
    }

    @Override
    public Map<String, String> refresh() {
        String token = request.getHeader(tokenHeader);
        String refreshToken = jwtTokenUtil.refreshHeadToken(token);
        log.info("当前刷新了token{}",refreshToken);
        if (refreshToken == null) {
            throw new BusinessException("token已经过期！");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", refreshToken);
        tokenMap.put("tokenHead", tokenHead);
        return tokenMap;
    }

    @Override
    public UserDto register(RegisterUserParam registerUserParam) {
        SysUser user = MapperUtils.copy(registerUserParam, new SysUser());
        // 是否已经注册
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username",user.getUsername());
        SysUser one = sysUserService.getOne(wrapper);
        if (null != one){
            throw new BusinessException(ResponseCode.USER_HAS_EXISTED);
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        boolean save = sysUserService.save(user);
        // 返回false就失败直接抛异常
        if (!save){
            throw new BusinessException(ResponseCode.FAILURE);
        }
        return MapperUtils.copy(user,new UserDto());
    }

}
