package com.yanxiuhair.common.exception.job;

/**
 * @ClassName:  TaskException   
 * @Description: 计划策略异常  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:14:28   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class TaskException extends Exception {
	private static final long serialVersionUID = 1L;

	private Code code;

	public TaskException(String msg, Code code) {
		this(msg, code, null);
	}

	public TaskException(String msg, Code code, Exception nestedEx) {
		super(msg, nestedEx);
		this.code = code;
	}

	public Code getCode() {
		return code;
	}

	public enum Code {
		TASK_EXISTS, NO_TASK_EXISTS, TASK_ALREADY_STARTED, UNKNOWN, CONFIG_ERROR, TASK_NODE_NOT_AVAILABLE
	}
}