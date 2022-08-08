package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author yaolong
 * @version V1.0.0
 * @program study-mybatis-generator
 * @description 用户信息
 * @create 2021-08-02 15:36
 **/
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_user_info")
public class SysUserInfo extends BaseDomain {

    private static final long serialVersionUID = -1498480208333283350L;

    /**
     * @description  用户id
     * @date 2021/8/2 15:28
     */
    private Long userId;
    /**
     * @description  用户名
     * @date 2021/8/2 15:28
     */
    private String username;
    /**
     * @description  真实名字
     * @date 2021/8/2 15:28
     */
    private String realName;
    /**
     * @description  头像
     * @date 2021/8/2 15:28
     */
    private String avatar;
    /**
     * @description  介绍
     * @date 2021/8/2 15:28
     */
    private String desc;


}
