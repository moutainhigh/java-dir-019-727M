package com.yanxiuhair.system.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yanxiuhair.common.annotation.DataScope;
import com.yanxiuhair.common.constant.UserConstants;
import com.yanxiuhair.common.core.domain.Ztree;
import com.yanxiuhair.common.core.domain.entity.SysDept;
import com.yanxiuhair.common.core.domain.entity.SysRole;
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.common.exception.BusinessException;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.system.mapper.SysDeptMapper;
import com.yanxiuhair.system.service.ISysDeptService;

/**
 * @ClassName:  SysDeptServiceImpl   
 * @Description: 部门管理 服务实现
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:20:19   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service
public class SysDeptServiceImpl implements ISysDeptService {
	@Autowired
	private SysDeptMapper deptMapper;

	/**
	 * 查询部门管理数据
	 * 
	 * @param dept
	 *            部门信息
	 * @return 部门信息集合
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<SysDept> selectDeptList(SysDept dept) {
		return deptMapper.selectDeptList(dept);
	}

	//***************************查询Easyui部门信息*************************
	@Override
	@DataScope(deptAlias = "d")
	public List<SysDept> selectDeptList2(SysDept dept) {
		List<SysDept> deptList = deptMapper.selectDeptList(dept);
		for (int i = deptList.size() - 1; i >= 0; i--) {
			SysDept obj = deptList.get(i);
			if (hasChild(deptList, obj)) {
				recursionFn(deptList, obj);
			}
		}
		return deptList;
	}
	/**
	 * 递归列表
	 * 
	 * @param list
	 * @param t
	 */
	private void recursionFn(List<SysDept> list, SysDept t) {
		// 得到子节点列表
		List<SysDept> childList = getChildList(list, t);
		t.setChildren(childList);
		for (SysDept tChild : childList) {
			if (hasChild(list, tChild)) {
				recursionFn(list, tChild);
			}
		}
	}
		
	/**
	 * 得到子节点列表
	 */
	private List<SysDept> getChildList(List<SysDept> list, SysDept t) {
		List<SysDept> tlist = new ArrayList<SysDept>();
		Iterator<SysDept> it = list.iterator();
		while (it.hasNext()) {
			SysDept n = (SysDept) it.next();
			if (n.getParentId().longValue() == t.getDeptId().longValue()) {
				tlist.add(n);
				it.remove();
			}
		}
		return tlist;
	}
	
	private List<SysDept> getChildList2(List<SysDept> list, SysDept t) {
		List<SysDept> tlist = new ArrayList<SysDept>();
		Iterator<SysDept> it = list.iterator();
		while (it.hasNext()) {
			SysDept n = (SysDept) it.next();
			if (n.getParentId().longValue() == t.getDeptId().longValue()) {
				tlist.add(n);
			}
		}
		return tlist;
	}
	
	/**
	 * 判断是否有子节点
	 */
	private boolean hasChild(List<SysDept> list, SysDept t) {
		return getChildList2(list, t).size() > 0 ? true : false;
	}
	//*****************************************************************
		
	/**
	 * 查询部门管理树
	 * 
	 * @param dept
	 *            部门信息
	 * @return 所有部门信息
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<Ztree> selectDeptTree(SysDept dept) {
		List<SysDept> deptList = deptMapper.selectDeptList(dept);
		List<Ztree> ztrees = initZtree(deptList);
		return ztrees;
	}

	/**
	 * 查询部门管理树（排除下级）
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 所有部门信息
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<Ztree> selectDeptTreeExcludeChild(SysDept dept) {
		Long deptId = dept.getDeptId();
		List<SysDept> deptList = deptMapper.selectDeptList(dept);
		Iterator<SysDept> it = deptList.iterator();
		while (it.hasNext()) {
			SysDept d = (SysDept) it.next();
			if (d.getDeptId().intValue() == deptId
					|| ArrayUtils.contains(StringUtils.split(d.getAncestors(), ","), deptId + "")) {
				it.remove();
			}
		}
		List<Ztree> ztrees = initZtree(deptList);
		return ztrees;
	}

	/**
	 * 根据角色ID查询部门（数据权限）
	 *
	 * @param role
	 *            角色对象
	 * @return 部门列表（数据权限）
	 */
	@Override
	public List<Ztree> roleDeptTreeData(SysRole role) {
		Long roleId = role.getRoleId();
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<SysDept> deptList = selectDeptList(new SysDept());
		if (StringUtils.isNotNull(roleId)) {
			List<String> roleDeptList = deptMapper.selectRoleDeptTree(roleId);
			ztrees = initZtree(deptList, roleDeptList);
		} else {
			ztrees = initZtree(deptList);
		}
		return ztrees;
	}

	/**
	 * 对象转部门树
	 *
	 * @param deptList
	 *            部门列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SysDept> deptList) {
		return initZtree(deptList, null);
	}

	/**
	 * 对象转部门树
	 *
	 * @param deptList
	 *            部门列表
	 * @param roleDeptList
	 *            角色已存在菜单列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<SysDept> deptList, List<String> roleDeptList) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(roleDeptList);
		for (SysDept dept : deptList) {
			if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
				Ztree ztree = new Ztree();
				ztree.setId(dept.getDeptId());
				ztree.setpId(dept.getParentId());
				ztree.setName(dept.getDeptName());
				ztree.setTitle(dept.getDeptName());
				if (isCheck) {
					ztree.setChecked(roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	/**
	 * 查询部门人数
	 * 
	 * @param parentId
	 *            部门ID
	 * @return 结果
	 */
	@Override
	public int selectDeptCount(Long parentId) {
		SysDept dept = new SysDept();
		dept.setParentId(parentId);
		return deptMapper.selectDeptCount(dept);
	}

	/**
	 * 查询部门是否存在用户
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 结果 true 存在 false 不存在
	 */
	@Override
	public boolean checkDeptExistUser(Long deptId) {
		int result = deptMapper.checkDeptExistUser(deptId);
		return result > 0 ? true : false;
	}

	/**
	 * 删除部门管理信息
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 结果
	 */
	@Override
	public int deleteDeptById(Long deptId) {
		return deptMapper.deleteDeptById(deptId);
	}

	/**
	 * 新增保存部门信息
	 * 
	 * @param dept
	 *            部门信息
	 * @return 结果
	 */
	@Override
	public int insertDept(SysDept dept) {
		SysDept info = deptMapper.selectDeptById(dept.getParentId());
		// 如果父节点不为"正常"状态,则不允许新增子节点
		if (!UserConstants.DEPT_NORMAL.equals(info.getStatus())) {
			throw new BusinessException("部门停用，不允许新增");
		}
		dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
		return deptMapper.insertDept(dept);
	}

	/**
	 * 修改保存部门信息
	 * 
	 * @param dept
	 *            部门信息
	 * @return 结果
	 */
	@Override
	@Transactional
	public int updateDept(SysDept dept) {
		SysDept newParentDept = deptMapper.selectDeptById(dept.getParentId());
		SysDept oldDept = selectDeptById(dept.getDeptId());
		if (StringUtils.isNotNull(newParentDept) && StringUtils.isNotNull(oldDept)) {
			String newAncestors = newParentDept.getAncestors() + "," + newParentDept.getDeptId();
			String oldAncestors = oldDept.getAncestors();
			dept.setAncestors(newAncestors);
			updateDeptChildren(dept.getDeptId(), newAncestors, oldAncestors);
		}
		int result = deptMapper.updateDept(dept);
		if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
			// 如果该部门是启用状态，则启用该部门的所有上级部门
			updateParentDeptStatusNormal(dept);
		}
		return result;
	}

	/**
	 * 修改该部门的父级部门状态
	 * 
	 * @param dept
	 *            当前部门
	 */
	private void updateParentDeptStatusNormal(SysDept dept) {
		String ancestors = dept.getAncestors();
		Long[] deptIds = Convert.toLongArray(ancestors);
		deptMapper.updateDeptStatusNormal(deptIds);
	}

	/**
	 * 修改子元素关系
	 * 
	 * @param deptId
	 *            被修改的部门ID
	 * @param newAncestors
	 *            新的父ID集合
	 * @param oldAncestors
	 *            旧的父ID集合
	 */
	public void updateDeptChildren(Long deptId, String newAncestors, String oldAncestors) {
		List<SysDept> children = deptMapper.selectChildrenDeptById(deptId);
		for (SysDept child : children) {
			child.setAncestors(child.getAncestors().replaceFirst(oldAncestors, newAncestors));
		}
		if (children.size() > 0) {
			deptMapper.updateDeptChildren(children);
		}
	}

	/**
	 * 根据部门ID查询信息
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 部门信息
	 */
	@Override
	public SysDept selectDeptById(Long deptId) {
		return deptMapper.selectDeptById(deptId);
	}

	/**
	 * 根据ID查询所有子部门（正常状态）
	 * 
	 * @param deptId
	 *            部门ID
	 * @return 子部门数
	 */
	@Override
	public int selectNormalChildrenDeptById(Long deptId) {
		return deptMapper.selectNormalChildrenDeptById(deptId);
	}

	/**
	 * 校验部门名称是否唯一
	 * 
	 * @param dept
	 *            部门信息
	 * @return 结果
	 */
	@Override
	public String checkDeptNameUnique(SysDept dept) {
		Long deptId = StringUtils.isNull(dept.getDeptId()) ? -1L : dept.getDeptId();
		SysDept info = deptMapper.checkDeptNameUnique(dept.getDeptName(), dept.getParentId());
		if (StringUtils.isNotNull(info) && info.getDeptId().longValue() != deptId.longValue()) {
			return UserConstants.DEPT_NAME_NOT_UNIQUE;
		}
		return UserConstants.DEPT_NAME_UNIQUE;
	}
}
