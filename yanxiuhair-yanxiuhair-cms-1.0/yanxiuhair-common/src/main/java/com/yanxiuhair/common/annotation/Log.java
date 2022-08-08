package com.yanxiuhair.common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.enums.OperatorType;

/**
 * @ClassName:  Log   
 * @Description: 自定义操作日志记录注解  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:13:35   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
	/**
	 * 模块
	 */
	public String title() default "";

	/**
	 * 功能
	 */
	public BusinessType businessType() default BusinessType.OTHER;

	/**
	 * 操作人类别
	 */
	public OperatorType operatorType() default OperatorType.MANAGE;

	/**
	 * 是否保存请求的参数
	 */
	public boolean isSaveRequestData() default true;
}
