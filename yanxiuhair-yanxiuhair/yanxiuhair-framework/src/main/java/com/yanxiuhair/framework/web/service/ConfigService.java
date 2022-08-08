package com.yanxiuhair.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yanxiuhair.system.service.ISysConfigService;

/**
 * @ClassName:  ConfigService   
 * @Description: 首创 html调用 thymeleaf 实现参数管理
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:49:04   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service("config")
public class ConfigService {
	@Autowired
	private ISysConfigService configService;

	/**
	 * 根据键名查询参数配置信息
	 * 
	 * @param configKey
	 *            参数键名
	 * @return 参数键值
	 */
	public String getKey(String configKey) {
		return configService.selectConfigByKey(configKey);
	}
	
	public String getSysCodeByKey(String configKey) {
		return configService.selectSysCodeConfigByKey(configKey);
	}
}
