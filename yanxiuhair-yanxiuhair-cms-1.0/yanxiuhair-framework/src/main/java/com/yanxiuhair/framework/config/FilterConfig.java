package com.yanxiuhair.framework.config;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.common.xss.XssFilter;

/**
 * @ClassName:  FilterConfig   
 * @Description: Filter配置   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:33:00   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Configuration
public class FilterConfig {
	@Value("${xss.enabled}")
	private String enabled;

	@Value("${xss.excludes}")
	private String excludes;

	@Value("${xss.urlPatterns}")
	private String urlPatterns;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
	public FilterRegistrationBean xssFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setDispatcherTypes(DispatcherType.REQUEST);
		registration.setFilter(new XssFilter());
		registration.addUrlPatterns(StringUtils.split(urlPatterns, ","));
		registration.setName("xssFilter");
		registration.setOrder(Integer.MAX_VALUE);
		Map<String, String> initParameters = new HashMap<String, String>();
		initParameters.put("excludes", excludes);
		initParameters.put("enabled", enabled);
		registration.setInitParameters(initParameters);
		return registration;
	}
}
