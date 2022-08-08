package com.yaolong.rbac.jwt.dto.vbenAdmin;

import com.baomidou.mybatisplus.annotation.TableField;
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
public class MenuResourceDto extends BaseMenuDto {

    private static final long serialVersionUID = -7561356423666899845L;

    /**
     * 菜单原信息
     */
    private MenuMetaDto meta;


}
