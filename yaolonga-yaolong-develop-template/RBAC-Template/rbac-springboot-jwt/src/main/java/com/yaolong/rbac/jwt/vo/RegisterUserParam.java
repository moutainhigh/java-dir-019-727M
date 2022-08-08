package com.yaolong.rbac.jwt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @program: study-project
 * @description:
 * @author: yaolong
 * @create: 2021-05-11 20:05
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class RegisterUserParam {

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

}
