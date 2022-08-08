package com.yaolong.rbac.jwt.dto;

import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @program: study-project
 * @description: 用户
 * @author: yaolong
 * @create: 2021-05-11 16:21
 **/
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class UserDto extends BaseDomain {

    private static final long serialVersionUID = -2649354620751415010L;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 状态
     */
    private Boolean status;



}
