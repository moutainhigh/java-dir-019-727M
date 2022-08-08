package com.yanxiuhair.common.exception.user;

/**
 * @ClassName:  UserDeleteException   
 * @Description: 用户账号已被删除  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:16:53   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class UserDeleteException extends UserException {
	private static final long serialVersionUID = 1L;

	public UserDeleteException() {
		super("user.password.delete", null);
	}
}
