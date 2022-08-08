package com.yanxiuhair.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yanxiuhair.common.core.domain.entity.SysMenu;

/**
 * @ClassName:  SysMenuMapper   
 * @Description: 菜单表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:15:00   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysMenuMapper {
	/**
	 * 查询系统所有菜单（含按钮）
	 * 
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenuAll();

	/**
	 * 根据用户ID查询菜单
	 * 
	 * @param userId
	 *            用户ID
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenuAllByUserId(Long userId);

	/**
	 * 查询系统正常显示菜单（不含按钮）
	 * 
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenuNormalAll();

	/**
	 * 根据用户ID查询菜单
	 * 
	 * @param userId
	 *            用户ID
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenusByUserId(Long userId);

	/**
	 * 根据用户ID查询权限
	 * 
	 * @param userId
	 *            用户ID
	 * @return 权限列表
	 */
	public List<String> selectPermsByUserId(Long userId);

	/**
	 * 根据角色ID查询菜单
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 菜单列表
	 */
	public List<String> selectMenuTree(Long roleId);

	/**
	 * 查询系统菜单列表
	 * 
	 * @param menu
	 *            菜单信息
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenuList(SysMenu menu);

	/**
	 * 查询系统菜单列表
	 * 
	 * @param menu
	 *            菜单信息
	 * @return 菜单列表
	 */
	public List<SysMenu> selectMenuListByUserId(SysMenu menu);

	/**
	 * 删除菜单管理信息
	 * 
	 * @param menuId
	 *            菜单ID
	 * @return 结果
	 */
	public int deleteMenuById(Long menuId);

	/**
	 * 根据菜单ID查询信息
	 * 
	 * @param menuId
	 *            菜单ID
	 * @return 菜单信息
	 */
	public SysMenu selectMenuById(Long menuId);

	/**
	 * 查询菜单数量
	 * 
	 * @param parentId
	 *            菜单父ID
	 * @return 结果
	 */
	public int selectCountMenuByParentId(Long parentId);

	/**
	 * 新增菜单信息
	 * 
	 * @param menu
	 *            菜单信息
	 * @return 结果
	 */
	public int insertMenu(SysMenu menu);

	/**
	 * 修改菜单信息
	 * 
	 * @param menu
	 *            菜单信息
	 * @return 结果
	 */
	public int updateMenu(SysMenu menu);

	/**
	 * 校验菜单名称是否唯一
	 * 
	 * @param menuName
	 *            菜单名称
	 * @param parentId
	 *            父菜单ID
	 * @return 结果
	 */
	public SysMenu checkMenuNameUnique(@Param("menuName") String menuName, @Param("parentId") Long parentId);
}
