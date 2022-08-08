package com.yaolong.rbac.jwt;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/**
 * @program: study-project
 * @description: springboot整合JWT
 * @author: yaolong
 * @create: 2021-05-10 20:42
 **/
@SpringBootApplication(scanBasePackages = {"com.yaolong.rbac.*"})
@MapperScan(basePackages = "com.yaolong.rbac.jwt.mapper")
public class JwtApplication {
    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        // 配置数据源（注意，我使用的是 HikariCP 连接池），以上注解是指定数据源，否则会有冲突
        return DataSourceBuilder.create().build();
    }

    public static void main(String[] args) {
        SpringApplication.run(JwtApplication.class,args);
    }
}
