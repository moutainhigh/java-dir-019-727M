package com.yanxiuhair.common.config;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import com.yanxiuhair.common.utils.ServletUtils;

/**
 * @ClassName:  ServerConfig   
 * @Description: 服务相关配置 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:22:07   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
public class ServerConfig {
	/**
	 * 获取完整的请求路径，包括：域名，端口，上下文访问路径
	 * 
	 * @return 服务地址
	 */
	public String getUrl() {
		HttpServletRequest request = ServletUtils.getRequest();
		return getDomain(request);
	}

	public static String getDomain(HttpServletRequest request) {
		StringBuffer url = request.getRequestURL();
		String contextPath = request.getServletContext().getContextPath();
		return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
	}
}
