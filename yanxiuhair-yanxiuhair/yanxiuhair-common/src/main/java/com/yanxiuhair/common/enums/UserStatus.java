package com.yanxiuhair.common.enums;

/**
 * @ClassName:  UserStatus   
 * @Description: 用户状态   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:07:40   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public enum UserStatus {
	OK("0", "正常"), DISABLE("1", "停用"), DELETED("2", "删除");

	private final String code;
	private final String info;

	UserStatus(String code, String info) {
		this.code = code;
		this.info = info;
	}

	public String getCode() {
		return code;
	}

	public String getInfo() {
		return info;
	}
}
