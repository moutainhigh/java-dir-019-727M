package com.ubiquitous.market.biz.config.notify;

import com.ubiquitous.market.biz.service.notify.AdminNotifyBizService;
import com.ubiquitous.market.biz.service.notify.UniNotifyAdminNotifyBizServiceImpl;
import com.ubiquitous.market.biz.service.notify.MockAdminNotifyBizServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *
 * Description:
 * User: admin
 * Date: 2019/12/27
 * Time: 20:15
 */
@Configuration
public class AdminNotifyConfig {

    @Value("uninotify")
    private String enable;

    @Bean
    public AdminNotifyBizService adminNotifyBizService() {
        if ("mock".equalsIgnoreCase(enable)) {
            return new MockAdminNotifyBizServiceImpl();
        } else if ("uninotify".equalsIgnoreCase(enable)) {
            return new UniNotifyAdminNotifyBizServiceImpl();
        } else {
            return null;
        }
    }

}
