package com.yaolong.rbac.jwt.dto.vbenAdmin;

import lombok.Data;

import java.util.List;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template
 * @description 接口权限树
 * @create 2021-08-13 18:21
 **/
@Data
public class PermissionNode{

    private Long id;

    private String name;

    private List<PermissionNode> children;
}
