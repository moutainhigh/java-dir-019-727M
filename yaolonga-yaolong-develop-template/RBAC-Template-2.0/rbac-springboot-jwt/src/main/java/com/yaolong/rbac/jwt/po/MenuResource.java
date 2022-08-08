package com.yaolong.rbac.jwt.po;

import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author yaolong
 * @version V1.0.0
 * @description
 * @create 2021-08-03 14:38
 **/

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class MenuResource extends BaseDomain {
    /**
     * 菜单父级id
     */
    private Long parentId;

    /**
     * 菜单名
     */
    private String name;

    /**
     * vue前端路由路
     */
    private String path;

    /**
     * 组件（前端vue的文件位置路径，根路径为Layout）
     */
    private String component;

    /**
     * 描述
     */
    private String description;

    /**
     * 菜单级别
     */
    private Long level;

    /**
     * 重定向路劲
     */
    private String redirect;

    /**
     * 区分大小写
     */
    private Boolean caseSensitive;

    /**
     * 禁用状态 0 false 1 true
     */
    private String status;

    /**
     * 是否外链
     */
    private String isExt;


    /**
     * 菜单权限标识
     */
    private String permission;


    /**
     * 创建人
     */
    private String createBy;


    /**
     * 更新人
     */
    private String updateBy;


    /**
     * 菜单类型 dir menu button
     */
    private String menuType;


    /**
     * 菜单名称
     */
    private String menuName;


    /**
     * 菜单原信息id
     */
    private Long metaId;


    /**
     * 菜单原信息
     */
    private MenuMeta meta;
}
