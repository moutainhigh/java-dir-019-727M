package com.yanxiuhair.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @ClassName:  SysRoleMenu   
 * @Description: 角色和菜单关联 sys_role_menu  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:12:53   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class SysRoleMenu {
	/** 角色ID */
	private Long roleId;

	/** 菜单ID */
	private Long menuId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("roleId", getRoleId())
				.append("menuId", getMenuId()).toString();
	}
}
