package com.yanxiuhair.generator.util;

import java.util.Properties;
import org.apache.velocity.app.Velocity;
import com.yanxiuhair.common.constant.Constants;

/**
 * @ClassName:  VelocityInitializer   
 * @Description: VelocityEngine工厂   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:56:06   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class VelocityInitializer {
	/**
	 * 初始化vm方法
	 */
	public static void initVelocity() {
		Properties p = new Properties();
		try {
			// 加载classpath目录下的vm文件
			p.setProperty("file.resource.loader.class",
					"org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
			// 定义字符集
			p.setProperty(Velocity.INPUT_ENCODING, Constants.UTF8);
			p.setProperty(Velocity.OUTPUT_ENCODING, Constants.UTF8);
			// 初始化Velocity引擎，指定配置Properties
			Velocity.init(p);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
