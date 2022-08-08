package com.ubiquitous.market.register.config;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * 新版的security默认启用了csrf检验，如果不关闭该检验，eureka client端向eureka server注册时，
 * 会报如下异常：com.netflix.discovery.shared.transport.TransportException: Cannot execute request on any known server，
 *
 * @author : fangyi
 * @date : 2020/2/27
 */
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        super.configure(http);
    }

}
