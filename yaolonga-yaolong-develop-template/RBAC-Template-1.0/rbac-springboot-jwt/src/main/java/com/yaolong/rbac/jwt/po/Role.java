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
public class Role extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    private String name;

    /**
     * 角色英文名称
     */
    private String enName;


    /**
     * 角色状态
     */
    private Boolean status;

    /**
     * 描述
     */
    private String description;

}
