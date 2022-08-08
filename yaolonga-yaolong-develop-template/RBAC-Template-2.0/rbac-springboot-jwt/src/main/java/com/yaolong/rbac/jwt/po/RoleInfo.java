package com.yaolong.rbac.jwt.po;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author yaolong
 * @version V1.0.0
 * @program study-mybatis-generator
 * @description 角色信息
 * @create 2021-08-02 15:20
 **/
@Data
@Accessors(chain = true)
public class RoleInfo {
    private Long id;
    private String roleName;
    private String value;
}
