package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.common.core.domain.entity.SysRole;

/**
 * @ClassName:  SysRoleMapper   
 * @Description: 角色表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:16:07   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysRoleMapper {
	/**
	 * 根据条件分页查询角色数据
	 * 
	 * @param role
	 *            角色信息
	 * @return 角色数据集合信息
	 */
	public List<SysRole> selectRoleList(SysRole role);

	/**
	 * 根据用户ID查询角色
	 * 
	 * @param userId
	 *            用户ID
	 * @return 角色列表
	 */
	public List<SysRole> selectRolesByUserId(Long userId);

	/**
	 * 通过角色ID查询角色
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 角色对象信息
	 */
	public SysRole selectRoleById(Long roleId);

	/**
	 * 通过角色ID删除角色
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 结果
	 */
	public int deleteRoleById(Long roleId);

	/**
	 * 批量角色用户信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteRoleByIds(Long[] ids);

	/**
	 * 修改角色信息
	 * 
	 * @param role
	 *            角色信息
	 * @return 结果
	 */
	public int updateRole(SysRole role);

	/**
	 * 新增角色信息
	 * 
	 * @param role
	 *            角色信息
	 * @return 结果
	 */
	public int insertRole(SysRole role);

	/**
	 * 校验角色名称是否唯一
	 * 
	 * @param roleName
	 *            角色名称
	 * @return 角色信息
	 */
	public SysRole checkRoleNameUnique(String roleName);

	/**
	 * 校验角色权限是否唯一
	 * 
	 * @param roleKey
	 *            角色权限
	 * @return 角色信息
	 */
	public SysRole checkRoleKeyUnique(String roleKey);
}
