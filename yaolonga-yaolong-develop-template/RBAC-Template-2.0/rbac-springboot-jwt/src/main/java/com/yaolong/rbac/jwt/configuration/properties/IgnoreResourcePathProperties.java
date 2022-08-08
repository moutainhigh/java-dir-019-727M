package com.yaolong.rbac.jwt.configuration.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * @program: yaolong-blog
 * @description: 默认放行的资源路径
 * @author: yaolong
 * @create: 2020-10-25 21:41
 **/

@Configuration
@ConfigurationProperties(prefix = "secure.ignore")
@Data
public class IgnoreResourcePathProperties {

    /**
     * 资源集合
     */
    List<String> paths;
}
