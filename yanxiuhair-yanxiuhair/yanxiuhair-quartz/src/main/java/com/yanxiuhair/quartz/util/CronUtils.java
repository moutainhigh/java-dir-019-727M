package com.yanxiuhair.quartz.util;

import java.text.ParseException;
import java.util.Date;
import org.quartz.CronExpression;

/**
 * @ClassName:  CronUtils   
 * @Description:  cron表达式工具类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:01:09   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class CronUtils {
	/**
	 * 返回一个布尔值代表一个给定的Cron表达式的有效性
	 *
	 * @param cronExpression
	 *            Cron表达式
	 * @return boolean 表达式是否有效
	 */
	public static boolean isValid(String cronExpression) {
		return CronExpression.isValidExpression(cronExpression);
	}

	/**
	 * 返回一个字符串值,表示该消息无效Cron表达式给出有效性
	 *
	 * @param cronExpression
	 *            Cron表达式
	 * @return String 无效时返回表达式错误描述,如果有效返回null
	 */
	public static String getInvalidMessage(String cronExpression) {
		try {
			new CronExpression(cronExpression);
			return null;
		} catch (ParseException pe) {
			return pe.getMessage();
		}
	}

	/**
	 * 返回下一个执行时间根据给定的Cron表达式
	 *
	 * @param cronExpression
	 *            Cron表达式
	 * @return Date 下次Cron表达式执行时间
	 */
	public static Date getNextExecution(String cronExpression) {
		try {
			CronExpression cron = new CronExpression(cronExpression);
			return cron.getNextValidTimeAfter(new Date(System.currentTimeMillis()));
		} catch (ParseException e) {
			throw new IllegalArgumentException(e.getMessage());
		}
	}
}
