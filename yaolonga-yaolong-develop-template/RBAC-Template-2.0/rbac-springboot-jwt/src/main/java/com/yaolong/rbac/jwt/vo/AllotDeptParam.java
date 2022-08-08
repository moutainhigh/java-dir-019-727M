package com.yaolong.rbac.jwt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: yaolong
 * @create: 2021-05-14 19:41
 **/
@NoArgsConstructor
@Accessors(chain = true)
@Data
@AllArgsConstructor
public class AllotDeptParam {

    /**
     * 角色ID
     */
    private Long roleId;

    /**
     * 接口权限Id
     */
    private List<Long> deptIds;

}
