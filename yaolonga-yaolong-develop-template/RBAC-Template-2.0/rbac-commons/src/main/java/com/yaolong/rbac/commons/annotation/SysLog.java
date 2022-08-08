package com.yaolong.rbac.commons.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template-2.0
 * @description 系统日志注解
 * @create 2021-09-03 12:19
 **/
@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface SysLog {
    /**
     * 接口名称
     */
    String value() default "";

}
