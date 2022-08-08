package com.yaolong.rbac.jwt.mapper;

import com.yaolong.rbac.jwt.domain.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author yaolong
 * @since 2021-08-08
 */
public interface SysDeptMapper extends BaseMapper<SysDept> {
    /**
     * 根据角色id获取部门列表
     *
     * @param
     * @return java.util.List<com.yaolong.rbac.jwt.domain.SysDept>
     * @author yaolong
     * @date 2021/8/11 14:32
     */
    @Select("select d.* from sys_role r left join sys_role_dept rd on rd.role_id = r.id left join sys_dept d on d.id = rd.dept_id where r.id = #{roleId}")
    List<SysDept> getDeptListByRoleId(Long roleId);
}
