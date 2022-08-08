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
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_role_dept")
public class SysRoleDept extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 部门id
     */
    private Long deptId;


}
