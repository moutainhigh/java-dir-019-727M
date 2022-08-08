package com.yanxiuhair.framework.shiro.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import com.yanxiuhair.framework.shiro.realm.UserRealm;

/**
 * @ClassName:  AuthorizationUtils   
 * @Description: 用户授权信息
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:44:04   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class AuthorizationUtils {
	/**
	 * 清理所有用户授权信息缓存
	 */
	public static void clearAllCachedAuthorizationInfo() {
		getUserRealm().clearAllCachedAuthorizationInfo();
	}

	/**
	 * 获取自定义Realm
	 */
	public static UserRealm getUserRealm() {
		RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
		return (UserRealm) rsm.getRealms().iterator().next();
	}
}
