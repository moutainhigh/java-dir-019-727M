package com.yaolong.rbac.jwt.configuration;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: study-project
 * @description: mybatis分页配置
 * @author: yaolong
 * @create: 2021-05-11 12:57
 **/
@Configuration
public class MybatisPageHelperConfiguration {

    /**
     * MyBatis Plus 分页插件
     * @return {@link PaginationInterceptor}
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
