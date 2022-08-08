package com.yanxiuhair.framework.shiro.service;

import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.PostConstruct;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import com.yanxiuhair.common.constant.Constants;
import com.yanxiuhair.common.constant.ShiroConstants;
import com.yanxiuhair.common.core.domain.entity.SysUser;
import com.yanxiuhair.common.exception.user.UserPasswordNotMatchException;
import com.yanxiuhair.common.exception.user.UserPasswordRetryLimitExceedException;
import com.yanxiuhair.common.utils.MessageUtils;
import com.yanxiuhair.framework.manager.AsyncManager;
import com.yanxiuhair.framework.manager.factory.AsyncFactory;

/**
 * @ClassName:  SysPasswordService   
 * @Description: 登录密码方法 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:41:32   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
public class SysPasswordService {
	@Autowired
	private CacheManager cacheManager;

	private Cache<String, AtomicInteger> loginRecordCache;

	@Value(value = "${user.password.maxRetryCount}")
	private String maxRetryCount;

	@PostConstruct
	public void init() {
		loginRecordCache = cacheManager.getCache(ShiroConstants.LOGINRECORDCACHE);
	}

	public void validate(SysUser user, String password) {
		String loginName = user.getLoginName();

		AtomicInteger retryCount = loginRecordCache.get(loginName);

		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			loginRecordCache.put(loginName, retryCount);
		}
		if (retryCount.incrementAndGet() > Integer.valueOf(maxRetryCount).intValue()) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.retry.limit.exceed", maxRetryCount)));
			throw new UserPasswordRetryLimitExceedException(Integer.valueOf(maxRetryCount).intValue());
		}

		if (!matches(user, password)) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.retry.limit.count", retryCount)));
			loginRecordCache.put(loginName, retryCount);
			throw new UserPasswordNotMatchException();
		} else {
			clearLoginRecordCache(loginName);
		}
	}

	public boolean matches(SysUser user, String newPassword) {
		return user.getPassword().equals(encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
	}

	public void clearLoginRecordCache(String loginName) {
		loginRecordCache.remove(loginName);
	}

	public String encryptPassword(String loginName, String password, String salt) {
		return new Md5Hash(loginName + password + salt).toHex();
	}
}
