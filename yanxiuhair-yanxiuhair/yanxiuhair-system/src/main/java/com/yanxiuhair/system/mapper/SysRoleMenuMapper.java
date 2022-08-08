package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysRoleMenu;

/**
 * @ClassName:  SysRoleMenuMapper   
 * @Description: 角色与菜单关联表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:16:19   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysRoleMenuMapper {
	/**
	 * 通过角色ID删除角色和菜单关联
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 结果
	 */
	public int deleteRoleMenuByRoleId(Long roleId);

	/**
	 * 批量删除角色菜单关联信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteRoleMenu(Long[] ids);

	/**
	 * 查询菜单使用数量
	 * 
	 * @param menuId
	 *            菜单ID
	 * @return 结果
	 */
	public int selectCountRoleMenuByMenuId(Long menuId);

	/**
	 * 批量新增角色菜单信息
	 * 
	 * @param roleMenuList
	 *            角色菜单列表
	 * @return 结果
	 */
	public int batchRoleMenu(List<SysRoleMenu> roleMenuList);
}
