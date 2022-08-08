package com.ubiquitous.market.data.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author admin
 * @date 2019/6/30
 */
@Data
@TableName("ubiquitous_user")
public class UserDO extends SuperDO {

    private String phone;

    private String password;

    /**
     * 使用某平台登录
     */
    @TableField("login_type")
    private Integer loginType;

    @TableField("open_id")
    private String openId;

    private String nickname;

    @TableField("avatar_url")
    private String avatarUrl;

    private Integer level;

    private Date birthday;

    private Integer gender;

    @TableField("gmt_last_login")
    private Date gmtLastLogin;

    @TableField("last_login_ip")
    private String lastLoginIp;

    private Integer status;

    @TableField("old_man")
    private Boolean oldMan;

}
