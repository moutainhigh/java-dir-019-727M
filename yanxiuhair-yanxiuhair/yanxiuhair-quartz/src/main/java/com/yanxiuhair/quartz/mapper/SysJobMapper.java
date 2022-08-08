package com.yanxiuhair.quartz.mapper;

import com.yanxiuhair.quartz.domain.SysJob;
import java.util.List;

/**
 * @ClassName:  SysJobMapper   
 * @Description: 调度任务信息 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:59:18   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysJobMapper {
	/**
	 * 查询调度任务日志集合
	 * 
	 * @param job
	 *            调度信息
	 * @return 操作日志集合
	 */
	public List<SysJob> selectJobList(SysJob job);

	/**
	 * 查询所有调度任务
	 * 
	 * @return 调度任务列表
	 */
	public List<SysJob> selectJobAll();

	/**
	 * 通过调度ID查询调度任务信息
	 * 
	 * @param jobId
	 *            调度ID
	 * @return 角色对象信息
	 */
	public SysJob selectJobById(Long jobId);

	/**
	 * 通过调度ID删除调度任务信息
	 * 
	 * @param jobId
	 *            调度ID
	 * @return 结果
	 */
	public int deleteJobById(Long jobId);

	/**
	 * 批量删除调度任务信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteJobByIds(Long[] ids);

	/**
	 * 修改调度任务信息
	 * 
	 * @param job
	 *            调度任务信息
	 * @return 结果
	 */
	public int updateJob(SysJob job);

	/**
	 * 新增调度任务信息
	 * 
	 * @param job
	 *            调度任务信息
	 * @return 结果
	 */
	public int insertJob(SysJob job);
}
