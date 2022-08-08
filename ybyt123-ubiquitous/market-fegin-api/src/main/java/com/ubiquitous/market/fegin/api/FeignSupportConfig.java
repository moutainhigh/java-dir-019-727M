package com.ubiquitous.market.fegin.api;

import feign.Logger;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.cloud.openfeign.support.SpringEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;

/**
 * @description:
 * @author: fy
 * @date: 2020/02/28 11:13
 **/
@Configuration
public class FeignSupportConfig {

    @Autowired
    private ObjectFactory<HttpMessageConverters> httpMessageConvertersObject;

    /**
     * feign 传递实体类或者文件时传输转化工具
     */
    @Bean
    @Primary
    @Scope("prototype")
    public Encoder multipartFormEncoder() {
        return new SpringFormEncoder(new SpringEncoder(httpMessageConvertersObject));
    }

    /**
     * feign请求日志级别
     *
     * @return RequestInterceptor
     */
    @Bean
    public Logger.Level feignLoggerLevel() {
        return Logger.Level.HEADERS;
    }
}
