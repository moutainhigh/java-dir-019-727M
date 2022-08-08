package com.yanxiuhair.quartz.mapper;

import com.yanxiuhair.quartz.domain.SysJobLog;
import java.util.List;

/**
 * @ClassName:  SysJobLogMapper   
 * @Description: 调度任务日志信息 数据层   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:59:03   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysJobLogMapper {
	/**
	 * 获取quartz调度器日志的计划任务
	 * 
	 * @param jobLog
	 *            调度日志信息
	 * @return 调度任务日志集合
	 */
	public List<SysJobLog> selectJobLogList(SysJobLog jobLog);

	/**
	 * 查询所有调度任务日志
	 *
	 * @return 调度任务日志列表
	 */
	public List<SysJobLog> selectJobLogAll();

	/**
	 * 通过调度任务日志ID查询调度信息
	 * 
	 * @param jobLogId
	 *            调度任务日志ID
	 * @return 调度任务日志对象信息
	 */
	public SysJobLog selectJobLogById(Long jobLogId);

	/**
	 * 新增任务日志
	 * 
	 * @param jobLog
	 *            调度日志信息
	 * @return 结果
	 */
	public int insertJobLog(SysJobLog jobLog);

	/**
	 * 批量删除调度日志信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteJobLogByIds(String[] ids);

	/**
	 * 删除任务日志
	 * 
	 * @param jobId
	 *            调度日志ID
	 * @return 结果
	 */
	public int deleteJobLogById(Long jobId);

	/**
	 * 清空任务日志
	 */
	public void cleanJobLog();
}
