package com.yanxiuhair.common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import com.yanxiuhair.common.enums.DataSourceType;

/**
 * @ClassName:  DataSource   
 * @Description: 自定义多数据源切换注解
 * 优先级：先方法，后类，如果方法覆盖了类上的数据源类型，以方法的为准，否则以类上的为准 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:12:10   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource {
	/**
	 * 切换数据源名称
	 */
	public DataSourceType value() default DataSourceType.MASTER;
}
