package com.yanxiuhair.framework.shiro.service;

import java.io.Serializable;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.framework.shiro.session.OnlineSession;
import com.yanxiuhair.system.domain.SysUserOnline;
import com.yanxiuhair.system.service.ISysUserOnlineService;

/**
 * @ClassName:  SysShiroService   
 * @Description: 会话db操作处理   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:42:06   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
public class SysShiroService {
	@Autowired
	private ISysUserOnlineService onlineService;

	/**
	 * 删除会话
	 *
	 * @param onlineSession
	 *            会话信息
	 */
	public void deleteSession(OnlineSession onlineSession) {
		onlineService.deleteOnlineById(String.valueOf(onlineSession.getId()));
	}

	/**
	 * 获取会话信息
	 *
	 * @param sessionId
	 * @return
	 */
	public Session getSession(Serializable sessionId) {
		SysUserOnline userOnline = onlineService.selectOnlineById(String.valueOf(sessionId));
		return StringUtils.isNull(userOnline) ? null : createSession(userOnline);
	}

	public Session createSession(SysUserOnline userOnline) {
		OnlineSession onlineSession = new OnlineSession();
		if (StringUtils.isNotNull(userOnline)) {
			onlineSession.setId(userOnline.getSessionId());
			onlineSession.setHost(userOnline.getIpaddr());
			onlineSession.setBrowser(userOnline.getBrowser());
			onlineSession.setOs(userOnline.getOs());
			onlineSession.setDeptName(userOnline.getDeptName());
			onlineSession.setLoginName(userOnline.getLoginName());
			onlineSession.setStartTimestamp(userOnline.getStartTimestamp());
			onlineSession.setLastAccessTime(userOnline.getLastAccessTime());
			onlineSession.setTimeout(userOnline.getExpireTime());
		}
		return onlineSession;
	}
}
