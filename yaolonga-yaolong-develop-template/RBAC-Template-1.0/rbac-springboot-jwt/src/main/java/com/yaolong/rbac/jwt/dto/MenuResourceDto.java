package com.yaolong.rbac.jwt.dto;

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
public class MenuResourceDto extends BaseDto {

    private static final long serialVersionUID = -7561356423666899845L;

    /**
     * 菜单父级id
     */
    private Long parentId;

    /**
     * 菜单标题名称
     */
    private String title;

    /**
     * 菜单名
     */
    private String name;

    /**
     * vue前端路由路
     */
    private String url;

    /**
     * 图标
     */
    private String icon;

    /**
     * 组件（前端vue的文件位置路径，根路径为Layout）
     */
    private String component;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否隐藏
     */
    private Boolean hidden;

    /**
     * 排序
     */
    private Long sort;

    /**
     * 菜单级别
     */
    private Long level;


}
