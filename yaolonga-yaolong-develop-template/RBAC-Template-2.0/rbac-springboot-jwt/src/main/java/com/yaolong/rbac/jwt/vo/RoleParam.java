package com.yaolong.rbac.jwt.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template
 * @description 角色vo参数
 * @create 2021-08-11 10:39
 **/
@Data
@Accessors(chain = true)
public class RoleParam {
    private String name;
    private String enName;
    private String remark;
    private Long id;
    private Long orderNo;
    private Boolean status;

    /**
     * @description 部门资源id
     * @author yaolong
     * @date 2021/8/11 10:44
     * @version v1.0.0
     */
    private List<Long> deptIds;
    /**
     * @description 菜单资源id
     * @author yaolong
     * @date 2021/8/11 10:43
     * @version v1.0.0
     */
    private List<Long> menuIds;

    /**
     * @description 接口资源id
     * @author yaolong
     * @date 2021/8/11 10:43
     * @version v1.0.0
     */
    private List<Long> itfIds;
}
