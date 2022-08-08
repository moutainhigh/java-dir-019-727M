package com.itheima.elastic;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class ApplicationApp {
    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(ApplicationApp.class, args);
        RestHighLevelClient bean = run.getBean(RestHighLevelClient.class);
        System.out.println(bean);


    }
}
