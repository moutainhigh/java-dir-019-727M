package com.yanxiuhair.quartz.util;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import com.yanxiuhair.quartz.domain.SysJob;

/**
 * @ClassName:  QuartzDisallowConcurrentExecution   
 * @Description: 定时任务处理（禁止并发执行） 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:02:23   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
	@Override
	protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception {
		JobInvokeUtil.invokeMethod(sysJob);
	}
}
