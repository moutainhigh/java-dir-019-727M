package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yaolong.rbac.commons.base.BaseDomain;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author yaolong
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dept")
public class SysDept extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 上级部门id
     */
    private Long parentId;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 排序
     */
    @TableField("orderNo")
    private Long orderNo;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否禁用 0 false 1true
     */
    private Boolean status;


}
