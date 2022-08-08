package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.yaolong.rbac.commons.base.BaseDomain;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.jwt.vo.MenuParams;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author yaolong
 * @since 2021-08-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_menu_resource_vben")
@AllArgsConstructor
public class SysMenuResourceVben extends BaseDomain {

    private static final long serialVersionUID = 1L;



   public SysMenuResourceVben(MenuParams params){
    MapperUtils.copy(params, this);
    this.meta = MapperUtils.copy(params,new SysMenuMeta());
   }

    public SysMenuResourceVben(){

    }

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
     * 菜单原信息id
     */
    private Long metaId;


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
     * 元数据信息
     */
    @TableField(exist = false)
    private SysMenuMeta meta;

}
