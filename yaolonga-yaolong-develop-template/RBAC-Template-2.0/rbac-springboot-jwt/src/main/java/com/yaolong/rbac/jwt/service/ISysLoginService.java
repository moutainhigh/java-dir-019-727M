package com.yaolong.rbac.jwt.service;

import com.yaolong.rbac.jwt.dto.elementAdmin.UserDto;
import com.yaolong.rbac.jwt.vo.RegisterUserParam;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
public interface ISysLoginService {

    /**
     * 登录成功后仅返回 Token
     * @param username {@code String} 账号
     * @param password {@code String} 密码
     * @return {@code Map<String, String>} key: token
     */
    Map<String, String> login(String username, String password);

    /**
     * 刷新 Token
     * @return {@code Map<String, String>} 新 Token，key: token
     */
    Map<String, String> refresh();

    /**
     * 注册用户
     * @param registerUserParam
     * @return {@code Map<String, String>}
     */
    UserDto register(RegisterUserParam registerUserParam);
}
