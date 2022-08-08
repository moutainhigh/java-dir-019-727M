package com.yaolong.rbac.jwt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @program: study-project
 * @description:
 * @author: yaolong
 * @create: 2021-05-14 19:39
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class AllotMenuParam {

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 菜单Id
     */
    private List<Long> menuIds;
}
