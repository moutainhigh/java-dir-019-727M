package com.yaolong.rbac.jwt.po.vbenAdmin;

import com.yaolong.rbac.commons.base.BaseDomain;
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
public class MenuItem extends BaseDomain {

    private static final long serialVersionUID = -7561356423666899845L;

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
     * 菜单原信息id
     */
    private Long metaId;


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
     * 路由title  一般必填
     */
    private String title;


    /**
     * 忽略路由。用于在ROUTE_MAPPING以及BACK权限模式下，生成对应的菜单而忽略路由。
     */
    private Boolean ignoreRoute;

    /**
     * 菜单排序，只对第一级有效
     */
    private Long orderNo;

    /**
     * 当前路由不再菜单显示
     */
    private Boolean hideMenu;

    /**
     * 当前路由不再标签页显示
     */
    private Boolean hideTab;

    /**
     * 当前激活的菜单。用于配置详情页时左侧激活的菜单路径
     */
    private String currentActiveMenu;

    /**
     * 隐藏所有子菜单
     */
    private Boolean hideChildrenInMenu;

    /**
     * 如果该路由会携带参数，且需要在tab页上面显示。则需要设置为true
     */
    private Boolean carryParam;

    /**
     * 隐藏该路由在面包屑上面的显示
     */
    private Boolean hideBreadcrumb;

    /**
     * 指定该路由切换的动画名
     */
    private String transitionName;

    /**
     * 内嵌iframe的地址
     */
    private String frameSrc;

    /**
     * 图标，也是菜单图标
     */
    private String icon;

    /**
     * 是否固定标签
     */
    private Boolean affix;

    /**
     * 是否忽略KeepAlive缓存
     */
    private Boolean ignoreKeepAlive;

}
