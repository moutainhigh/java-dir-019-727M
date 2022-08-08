package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("sys_permission")
public class SysPermission extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 分类id
     */
    private Long categoryId;

    /**
     * 接口权限名
     */
    private String name;

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
    private String remark;

    /**
     * 排序
     */
    private Long sort;

    /**
     * 状态
     */
    private Boolean status;

}
