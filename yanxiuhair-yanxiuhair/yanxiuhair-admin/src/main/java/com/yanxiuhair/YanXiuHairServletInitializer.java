package com.yanxiuhair;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @ClassName:  YanXiuHairServletInitializer   
 * @Description: web容器中进行部署  
 * @author: gaoxiaochuang   
 * @date:   2020年5月19日 下午1:56:17   
 *     
 * @Copyright: 2020 http://www.yanxiuhair.com Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class YanXiuHairServletInitializer extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(YanXiuHairApplication.class);
	}
}
