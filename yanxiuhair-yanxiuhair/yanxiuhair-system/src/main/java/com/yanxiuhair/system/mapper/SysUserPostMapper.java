package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysUserPost;

/**
 * @ClassName:  SysUserPostMapper   
 * @Description:用户与岗位关联表 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:16:59   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysUserPostMapper {
	/**
	 * 通过用户ID删除用户和岗位关联
	 * 
	 * @param userId
	 *            用户ID
	 * @return 结果
	 */
	public int deleteUserPostByUserId(Long userId);

	/**
	 * 通过岗位ID查询岗位使用数量
	 * 
	 * @param postId
	 *            岗位ID
	 * @return 结果
	 */
	public int countUserPostById(Long postId);

	/**
	 * 批量删除用户和岗位关联
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteUserPost(Long[] ids);

	/**
	 * 批量新增用户岗位信息
	 * 
	 * @param userPostList
	 *            用户角色列表
	 * @return 结果
	 */
	public int batchUserPost(List<SysUserPost> userPostList);
}
