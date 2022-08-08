package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysRoleDept;

/**
 * @ClassName:  SysRoleDeptMapper   
 * @Description: 角色与部门关联表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:15:50   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysRoleDeptMapper {
	/**
	 * 通过角色ID删除角色和部门关联
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 结果
	 */
	public int deleteRoleDeptByRoleId(Long roleId);

	/**
	 * 批量删除角色部门关联信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteRoleDept(Long[] ids);

	/**
	 * 查询部门使用数量
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 结果
	 */
	public int selectCountRoleDeptByDeptId(Long deptId);

	/**
	 * 批量新增角色部门信息
	 * 
	 * @param roleDeptList
	 *            角色部门列表
	 * @return 结果
	 */
	public int batchRoleDept(List<SysRoleDept> roleDeptList);
}
