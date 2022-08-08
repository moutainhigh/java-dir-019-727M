package com.yanxiuhair.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @ClassName:  SysRoleDept   
 * @Description: 角色和部门关联 sys_role_dept
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:12:40   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class SysRoleDept {
	/** 角色ID */
	private Long roleId;

	/** 部门ID */
	private Long deptId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("roleId", getRoleId())
				.append("deptId", getDeptId()).toString();
	}
}
