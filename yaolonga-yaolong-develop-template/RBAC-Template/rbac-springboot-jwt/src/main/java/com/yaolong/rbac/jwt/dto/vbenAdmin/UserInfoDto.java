package com.yaolong.rbac.jwt.dto.vbenAdmin;

import com.yaolong.rbac.commons.base.BaseDto;
import com.yaolong.rbac.commons.constant.GlobConstant;
import com.yaolong.rbac.jwt.po.vbenAdmin.RoleInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author yaolong
 * @version V1.0.0
 * @program
 * @description 用户信息Dto
 * @create 2021-08-02 15:16
 **/

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class UserInfoDto extends BaseDto {

    private List<RoleInfoDto> roles;

    /**
     * @description 用户id
     * @date 2021/8/2 15:28
     */
    private Long userId;
    /**
     * @description 用户名
     * @date 2021/8/2 15:28
     */
    private String username;
    /**
     * @description 真实名字
     * @date 2021/8/2 15:28
     */
    private String realName;
    /**
     * @description 头像
     * @date 2021/8/2 15:28
     */
    private String avatar;
    /**
     * @description 备注
     * @date 2021/8/2 15:28
     */
    private String remark;

    /**
     * @description 部门id
     * @date 2021/8/2 15:28
     */
    private Long deptId;

    /**
     * @description 邮箱
     * @date 2021/8/2 15:28
     */
    private String email;

    /**
     * @description 昵称
     * @date 2021/8/2 15:28
     */
    private String nickName;

    /**
     * @description 用户状态
     * @author
     * @date 2021/8/9 15:13
     * @version v1.0.0
     */
    private Boolean status;

}
