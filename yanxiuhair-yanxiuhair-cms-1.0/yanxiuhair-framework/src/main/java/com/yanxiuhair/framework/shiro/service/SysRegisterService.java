package com.yanxiuhair.framework.shiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import com.yanxiuhair.common.constant.Constants;
import com.yanxiuhair.common.constant.ShiroConstants;
import com.yanxiuhair.common.constant.UserConstants;
import com.yanxiuhair.common.core.domain.entity.SysUser;
import com.yanxiuhair.common.utils.DateUtils;
import com.yanxiuhair.common.utils.MessageUtils;
import com.yanxiuhair.common.utils.ServletUtils;
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.framework.manager.AsyncManager;
import com.yanxiuhair.framework.manager.factory.AsyncFactory;
import com.yanxiuhair.system.service.ISysUserService;

/**
 * @ClassName:  SysRegisterService   
 * @Description: 注册校验方法 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:41:53   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
public class SysRegisterService {
	@Autowired
	private ISysUserService userService;

	@Autowired
	private SysPasswordService passwordService;

	/**
	 * 注册
	 */
	public String register(SysUser user) {
		String msg = "", loginName = user.getLoginName(), password = user.getPassword();

		if (!StringUtils.isEmpty(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
			msg = "验证码错误";
		} else if (StringUtils.isEmpty(loginName)) {
			msg = "用户名不能为空";
		} else if (StringUtils.isEmpty(password)) {
			msg = "用户密码不能为空";
		} else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
				|| password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
			msg = "密码长度必须在5到20个字符之间";
		} else if (loginName.length() < UserConstants.USERNAME_MIN_LENGTH
				|| loginName.length() > UserConstants.USERNAME_MAX_LENGTH) {
			msg = "账户长度必须在2到20个字符之间";
		} else if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(loginName))) {
			msg = "保存用户'" + loginName + "'失败，注册账号已存在";
		} else {
			user.setPwdUpdateDate(DateUtils.getNowDate());
			user.setUserName(loginName);
			user.setSalt(ShiroUtils.randomSalt());
			user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
			boolean regFlag = userService.registerUser(user);
			if (!regFlag) {
				msg = "注册失败,请联系系统管理人员";
			} else {
				AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.REGISTER,
						MessageUtils.message("user.register.success")));
			}
		}
		return msg;
	}
}
