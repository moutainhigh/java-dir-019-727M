package com.yaolong.rbac.jwt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @program: study-project
 * @description: 分配角色
 * @author: yaolong
 * @create: 2021-05-14 16:46
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class AllotRoleParam {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 要分配的角色id
     */
    private List<Long> roleIds;
}
