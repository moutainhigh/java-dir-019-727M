package com.yaolong.rbac.jwt.po;

import com.yaolong.rbac.commons.base.BaseDomain;
import com.yaolong.rbac.jwt.domain.SysRole;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @program: study-project
 * @description: 用户
 * @author: yaolong
 * @create: 2021-05-11 16:21
 **/
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class User extends BaseDomain {

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
     * 是否禁用
     */
    private Boolean status;


    /**
     * 备注
     */
    private String remark;

    /**
     * 权限
     */
    private List<SysRole> roles;

}
