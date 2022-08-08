package com.yanxiuhair.common.exception.user;

/**
 * @ClassName:  UserPasswordRetryLimitCountException   
 * @Description: 用户错误记数异常类 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:18:45   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class UserPasswordRetryLimitCountException extends UserException {
	private static final long serialVersionUID = 1L;

	public UserPasswordRetryLimitCountException(int retryLimitCount) {
		super("user.password.retry.limit.count", new Object[] { retryLimitCount });
	}
}
