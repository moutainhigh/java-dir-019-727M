package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysPost;

/**
 * @ClassName:  SysPostMapper   
 * @Description: 岗位信息 数据层  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:15:37   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysPostMapper {
	/**
	 * 查询岗位数据集合
	 * 
	 * @param post
	 *            岗位信息
	 * @return 岗位数据集合
	 */
	public List<SysPost> selectPostList(SysPost post);

	/**
	 * 查询所有岗位
	 * 
	 * @return 岗位列表
	 */
	public List<SysPost> selectPostAll();

	/**
	 * 根据用户ID查询岗位
	 * 
	 * @param userId
	 *            用户ID
	 * @return 岗位列表
	 */
	public List<SysPost> selectPostsByUserId(Long userId);

	/**
	 * 通过岗位ID查询岗位信息
	 * 
	 * @param postId
	 *            岗位ID
	 * @return 角色对象信息
	 */
	public SysPost selectPostById(Long postId);

	/**
	 * 批量删除岗位信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deletePostByIds(Long[] ids);

	/**
	 * 修改岗位信息
	 * 
	 * @param post
	 *            岗位信息
	 * @return 结果
	 */
	public int updatePost(SysPost post);

	/**
	 * 新增岗位信息
	 * 
	 * @param post
	 *            岗位信息
	 * @return 结果
	 */
	public int insertPost(SysPost post);

	/**
	 * 校验岗位名称
	 * 
	 * @param postName
	 *            岗位名称
	 * @return 结果
	 */
	public SysPost checkPostNameUnique(String postName);

	/**
	 * 校验岗位编码
	 * 
	 * @param postCode
	 *            岗位编码
	 * @return 结果
	 */
	public SysPost checkPostCodeUnique(String postCode);
}
