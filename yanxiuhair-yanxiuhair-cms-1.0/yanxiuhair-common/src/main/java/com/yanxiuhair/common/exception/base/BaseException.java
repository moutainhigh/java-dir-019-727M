package com.yanxiuhair.common.exception.base;

import com.yanxiuhair.common.utils.MessageUtils;
import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  BaseException   
 * @Description: 基础异常   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:09:56   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class BaseException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	/**
	 * 所属模块
	 */
	private String module;

	/**
	 * 错误码
	 */
	private String code;

	/**
	 * 错误码对应的参数
	 */
	private Object[] args;

	/**
	 * 错误消息
	 */
	private String defaultMessage;

	public BaseException(String module, String code, Object[] args, String defaultMessage) {
		this.module = module;
		this.code = code;
		this.args = args;
		this.defaultMessage = defaultMessage;
	}

	public BaseException(String module, String code, Object[] args) {
		this(module, code, args, null);
	}

	public BaseException(String module, String defaultMessage) {
		this(module, null, null, defaultMessage);
	}

	public BaseException(String code, Object[] args) {
		this(null, code, args, null);
	}

	public BaseException(String defaultMessage) {
		this(null, null, null, defaultMessage);
	}

	@Override
	public String getMessage() {
		String message = null;
		if (!StringUtils.isEmpty(code)) {
			message = MessageUtils.message(code, args);
		}
		if (message == null) {
			message = defaultMessage;
		}
		return message;
	}

	public String getModule() {
		return module;
	}

	public String getCode() {
		return code;
	}

	public Object[] getArgs() {
		return args;
	}

	public String getDefaultMessage() {
		return defaultMessage;
	}
}
