package com.yanxiuhair.common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @ClassName:  DataScope   
 * @Description: 数据权限过滤注解  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:11:39   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope {
	/**
	 * 部门表的别名
	 */
	public String deptAlias() default "";

	/**
	 * 用户表的别名
	 */
	public String userAlias() default "";
}
