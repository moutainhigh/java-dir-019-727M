package com.ubiquitous.market.rider;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisReactiveAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @description: 骑手服务
 * @author: fy
 * @date: 2020/02/27 22:55
 **/
@EnableEurekaClient
@EnableTransactionManagement
@MapperScan("com.ubiquitous.market.data")
@SpringBootApplication(scanBasePackages = {"com.ubiquitous.market"}, exclude = {RedisAutoConfiguration.class, RedisReactiveAutoConfiguration.class})
public class RiderServiceApplication {

    public static void main(final String[] args) {
        SpringApplication.run(RiderServiceApplication.class, args);
    }

}
