package com.yanxiuhair.common.enums;

/**
 * @ClassName:  OnlineStatus   
 * @Description: 用户会话  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:07:08   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public enum OnlineStatus {
	/** 用户状态 */
	on_line("在线"), off_line("离线");

	private final String info;

	private OnlineStatus(String info) {
		this.info = info;
	}

	public String getInfo() {
		return info;
	}
}
