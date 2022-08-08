package com.yanxiuhair.common.exception.user;

import com.yanxiuhair.common.exception.base.BaseException;

/**
 * @ClassName:  UserException   
 * @Description: 用户信息异常类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:17:28   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class UserException extends BaseException {
	private static final long serialVersionUID = 1L;

	public UserException(String code, Object[] args) {
		super("user", code, args, null);
	}
}
