package com.yaolong.rbac.jwt.dto.vbenAdmin;

import com.yaolong.rbac.commons.base.BaseDomain;
import com.yaolong.rbac.commons.base.BaseDto;
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
public class PermissionDto extends BaseDto {

    private static final long serialVersionUID = 1L;


    /**
     * 分类Id
     */
    private Long categoryId;

    /**
     * 分类
     */
    private String category;

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
