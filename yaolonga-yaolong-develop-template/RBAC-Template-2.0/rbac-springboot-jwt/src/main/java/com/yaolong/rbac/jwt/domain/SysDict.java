package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 数据字典表
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict")
public class SysDict extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 字典名称
     */
    private String name;

    /**
     * 字典类型
     */
    private String type;

    /**
     * 字典值
     */
    private String value;

    /**
     * 字典标签
     */
    private String label;

    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标记  1：启用  0：禁用
     */
    private Boolean status;


}
