package com.yaolong.rbac.jwt.po;

import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author yaolong
 * @since 2021-05-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Permission extends BaseDomain {

    private static final long serialVersionUID = 1L;


    /**
     * 分类
     */
    private String category;

    /**
     * 接口权限名
     */
    private String name;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 接口权限路劲
     */
    private String path;

    /**
     * 接口类型（dashboard、protal）
     */
    private String type;

    /**
     * 接口描述
     */
    private String description;

    /**
     * 排序
     */
    private Long sort;
}
