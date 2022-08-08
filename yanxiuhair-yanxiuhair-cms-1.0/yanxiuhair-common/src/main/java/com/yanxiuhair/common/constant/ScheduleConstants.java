package com.yanxiuhair.common.constant;

/**
 * @ClassName:  ScheduleConstants   
 * @Description: 任务调度通用常量 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:38:01   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class ScheduleConstants {
	public static final String TASK_CLASS_NAME = "TASK_CLASS_NAME";

	/** 执行目标key */
	public static final String TASK_PROPERTIES = "TASK_PROPERTIES";

	/** 默认 */
	public static final String MISFIRE_DEFAULT = "0";

	/** 立即触发执行 */
	public static final String MISFIRE_IGNORE_MISFIRES = "1";

	/** 触发一次执行 */
	public static final String MISFIRE_FIRE_AND_PROCEED = "2";

	/** 不触发立即执行 */
	public static final String MISFIRE_DO_NOTHING = "3";

	public enum Status {
		/**
		 * 正常
		 */
		NORMAL("0"),
		/**
		 * 暂停
		 */
		PAUSE("1");

		private String value;

		private Status(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}
	}
}
