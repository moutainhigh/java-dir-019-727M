package com.yanxiuhair.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yanxiuhair.system.domain.SysUserRole;

/**
 * @ClassName:  SysUserRoleMapper   
 * @Description: 用户与角色关联表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:17:12   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysUserRoleMapper {
	/**
	 * 通过用户ID查询用户和角色关联
	 * 
	 * @param userId
	 *            用户ID
	 * @return 用户和角色关联列表
	 */
	public List<SysUserRole> selectUserRoleByUserId(Long userId);

	/**
	 * 通过用户ID删除用户和角色关联
	 * 
	 * @param userId
	 *            用户ID
	 * @return 结果
	 */
	public int deleteUserRoleByUserId(Long userId);

	/**
	 * 批量删除用户和角色关联
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteUserRole(Long[] ids);

	/**
	 * 通过角色ID查询角色使用数量
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 结果
	 */
	public int countUserRoleByRoleId(Long roleId);

	/**
	 * 批量新增用户角色信息
	 * 
	 * @param userRoleList
	 *            用户角色列表
	 * @return 结果
	 */
	public int batchUserRole(List<SysUserRole> userRoleList);

	/**
	 * 删除用户和角色关联信息
	 * 
	 * @param userRole
	 *            用户和角色关联信息
	 * @return 结果
	 */
	public int deleteUserRoleInfo(SysUserRole userRole);

	/**
	 * 批量取消授权用户角色
	 * 
	 * @param roleId
	 *            角色ID
	 * @param userIds
	 *            需要删除的用户数据ID
	 * @return 结果
	 */
	public int deleteUserRoleInfos(@Param("roleId") Long roleId, @Param("userIds") Long[] userIds);
}
