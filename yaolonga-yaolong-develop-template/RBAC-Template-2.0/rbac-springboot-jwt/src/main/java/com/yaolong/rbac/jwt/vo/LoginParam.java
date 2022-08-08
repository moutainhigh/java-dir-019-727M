package com.yaolong.rbac.jwt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * @program: study-project
 * @description: 登录参数
 * @author: yaolong
 * @create: 2021-05-11 19:50
 **/
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Data
public class LoginParam {

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;
}
