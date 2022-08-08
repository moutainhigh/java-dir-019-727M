package com.yaolong.rbac.jwt.po;

import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author yaolong
 * @version V1.0.0
 * @program
 * @description 用户信息Dto
 * @create 2021-08-02 15:16
 **/

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class UserInfo extends BaseDomain {

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
