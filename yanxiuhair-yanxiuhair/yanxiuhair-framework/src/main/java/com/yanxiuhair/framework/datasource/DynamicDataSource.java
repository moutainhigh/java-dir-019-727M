package com.yanxiuhair.framework.datasource;

import java.util.Map;
import javax.sql.DataSource;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import com.yanxiuhair.common.config.datasource.DynamicDataSourceContextHolder;

/**
 * @ClassName:  DynamicDataSource   
 * @Description: 动态数据源   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:37:50   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class DynamicDataSource extends AbstractRoutingDataSource {
	public DynamicDataSource(DataSource defaultTargetDataSource, Map<Object, Object> targetDataSources) {
		super.setDefaultTargetDataSource(defaultTargetDataSource);
		super.setTargetDataSources(targetDataSources);
		super.afterPropertiesSet();
	}

	@Override
	protected Object determineCurrentLookupKey() {
		return DynamicDataSourceContextHolder.getDataSourceType();
	}
}