package com.ubiquitous.market.app.api.api.config;

import com.ubiquitous.market.biz.service.config.ConfigBizService;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.ConfigDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by admin on 2019/7/21.
 */
@Service
public class ConfigServiceImpl implements ConfigService{

    @Autowired
    private ConfigBizService configBizService;

    @Override
    public ConfigDTO getMerchantConfig() throws ServiceException {
        return configBizService.getMerchantConfig();
    }
}
