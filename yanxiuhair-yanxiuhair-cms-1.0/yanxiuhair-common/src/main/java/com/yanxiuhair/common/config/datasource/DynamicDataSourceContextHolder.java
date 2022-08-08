package com.yanxiuhair.common.config.datasource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName:  DynamicDataSourceContextHolder   
 * @Description: 数据源切换处理 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:15:27   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class DynamicDataSourceContextHolder {
	public static final Logger log = LoggerFactory.getLogger(DynamicDataSourceContextHolder.class);

	/**
	 * 使用ThreadLocal维护变量，ThreadLocal为每个使用该变量的线程提供独立的变量副本，
	 * 所以每一个线程都可以独立地改变自己的副本，而不会影响其它线程所对应的副本。
	 */
	private static final ThreadLocal<String> CONTEXT_HOLDER = new ThreadLocal<>();

	/**
	 * 设置数据源的变量
	 */
	public static void setDataSourceType(String dsType) {
		log.info("切换到{}数据源", dsType);
		CONTEXT_HOLDER.set(dsType);
	}

	/**
	 * 获得数据源的变量
	 */
	public static String getDataSourceType() {
		return CONTEXT_HOLDER.get();
	}

	/**
	 * 清空数据源变量
	 */
	public static void clearDataSourceType() {
		CONTEXT_HOLDER.remove();
	}
}
