package com.yaolong.rbac.jwt.vo;

import com.yaolong.rbac.commons.base.BaseDomain;
import com.yaolong.rbac.commons.base.BaseVo;
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
public class PermissionParam extends BaseVo {

    private static final long serialVersionUID = 1L;

    /**
     * 接口权限名
     */
    private String category;

    /**
     * 分类Id
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
     * 状态
     */
    private Boolean status;
}
