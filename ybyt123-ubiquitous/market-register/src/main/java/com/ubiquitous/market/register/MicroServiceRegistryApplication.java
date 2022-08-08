package com.ubiquitous.market.register;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * 服务注册中心
 *
 * @author : fangyi
 * @date : 2018/12/4 15:12
 */
@SpringBootApplication
@EnableEurekaServer
public class MicroServiceRegistryApplication {

    public static void main(String[] args) {
        SpringApplication.run(MicroServiceRegistryApplication.class, args);
    }

}
