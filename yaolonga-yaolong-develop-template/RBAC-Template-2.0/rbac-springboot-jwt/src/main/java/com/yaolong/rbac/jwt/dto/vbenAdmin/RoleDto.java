package com.yaolong.rbac.jwt.dto.vbenAdmin;

import com.yaolong.rbac.commons.base.BaseDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
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
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class RoleDto extends BaseDto {

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
    private String remark;

    /**
     * 排序
     */
    private Long orderNo;

}
