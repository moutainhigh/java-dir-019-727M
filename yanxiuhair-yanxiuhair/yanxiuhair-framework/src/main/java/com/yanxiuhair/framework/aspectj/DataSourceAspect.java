package com.yanxiuhair.framework.aspectj;

import java.util.Objects;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import com.yanxiuhair.common.annotation.DataSource;
import com.yanxiuhair.common.config.datasource.DynamicDataSourceContextHolder;
import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  DataSourceAspect   
 * @Description: 多数据源处理
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:26:03   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Aspect
@Order(1)
@Component
public class DataSourceAspect {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Pointcut("@annotation(com.yanxiuhair.common.annotation.DataSource)"
			+ "|| @within(com.yanxiuhair.common.annotation.DataSource)")
	public void dsPointCut() {

	}

	@Around("dsPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		DataSource dataSource = getDataSource(point);

		if (StringUtils.isNotNull(dataSource)) {
			DynamicDataSourceContextHolder.setDataSourceType(dataSource.value().name());
		}

		try {
			return point.proceed();
		} finally {
			// 销毁数据源 在执行方法之后
			DynamicDataSourceContextHolder.clearDataSourceType();
		}
	}

	/**
	 * 获取需要切换的数据源
	 */
	public DataSource getDataSource(ProceedingJoinPoint point) {
		MethodSignature signature = (MethodSignature) point.getSignature();
		DataSource dataSource = AnnotationUtils.findAnnotation(signature.getMethod(), DataSource.class);
		if (Objects.nonNull(dataSource)) {
			return dataSource;
		}

		return AnnotationUtils.findAnnotation(signature.getDeclaringType(), DataSource.class);
	}
}
