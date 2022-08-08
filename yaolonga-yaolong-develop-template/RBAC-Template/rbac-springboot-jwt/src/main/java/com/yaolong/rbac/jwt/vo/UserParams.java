package com.yaolong.rbac.jwt.vo;

import lombok.Data;

import java.util.List;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template
 * @description 用户请求参数
 * @create 2021-08-09 14:12
 **/
@Data
public class UserParams {
    private String username;
    private Long userId;
    private Long deptId;
    private List<Long> roles;
    private String email;
    private String nickName;
    private String realName;
    private Boolean status;
    private String remark;

    /**
     * @description 用户信息id
     * @author yaolong
     * @date 2021/8/11 8:48
     * @version v1.0.0
     */
    private Long id;
}
