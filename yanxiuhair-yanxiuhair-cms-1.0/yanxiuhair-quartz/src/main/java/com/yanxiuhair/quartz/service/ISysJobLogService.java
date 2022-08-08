package com.yanxiuhair.quartz.service;

import java.util.List;
import com.yanxiuhair.quartz.domain.SysJobLog;

/**
 * @ClassName:  ISysJobLogService   
 * @Description: 定时任务调度日志信息信息 服务层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:59:34   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface ISysJobLogService {
	/**
	 * 获取quartz调度器日志的计划任务
	 * 
	 * @param jobLog
	 *            调度日志信息
	 * @return 调度任务日志集合
	 */
	public List<SysJobLog> selectJobLogList(SysJobLog jobLog);

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
	 */
	public void addJobLog(SysJobLog jobLog);

	/**
	 * 批量删除调度日志信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteJobLogByIds(String ids);

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
