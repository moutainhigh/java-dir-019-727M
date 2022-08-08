package com.ubiquitous.market.app.api.api.config;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.ConfigDTO;

/**
 * Created by admin on 2019/7/21.
 */
@HttpOpenApi(group = "config", description = "商户配置服务")
public interface ConfigService {

    @HttpMethod(description = "获取商户配置")
    public ConfigDTO getMerchantConfig() throws ServiceException;

}
