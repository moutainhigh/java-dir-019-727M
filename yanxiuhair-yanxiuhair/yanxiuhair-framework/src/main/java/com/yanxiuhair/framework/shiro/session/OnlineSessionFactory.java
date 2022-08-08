package com.yanxiuhair.framework.shiro.session;

import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.web.session.mgt.WebSessionContext;
import org.springframework.stereotype.Component;
import com.yanxiuhair.common.utils.IpUtils;
import com.yanxiuhair.common.utils.ServletUtils;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * @ClassName:  OnlineSessionFactory   
 * @Description: 自定义sessionFactory会话   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:43:17   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
public class OnlineSessionFactory implements SessionFactory {
	@Override
	public Session createSession(SessionContext initData) {
		OnlineSession session = new OnlineSession();
		if (initData != null && initData instanceof WebSessionContext) {
			WebSessionContext sessionContext = (WebSessionContext) initData;
			HttpServletRequest request = (HttpServletRequest) sessionContext.getServletRequest();
			if (request != null) {
				UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
				// 获取客户端操作系统
				String os = userAgent.getOperatingSystem().getName();
				// 获取客户端浏览器
				String browser = userAgent.getBrowser().getName();
				session.setHost(IpUtils.getIpAddr(request));
				session.setBrowser(browser);
				session.setOs(os);
			}
		}
		return session;
	}
}
