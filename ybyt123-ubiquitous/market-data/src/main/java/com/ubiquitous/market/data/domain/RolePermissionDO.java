package com.ubiquitous.market.data.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
 * Created by admin on 2019/4/8.
 */
@Data
@TableName("ubiquitous_role_permission")
public class RolePermissionDO extends SuperDO {

    @TableField("role_id")
    private Long roleId;

    private String permission;

    private Integer deleted;

}
