package com.ubiquitous.market.app.api.api.advertisement;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.AdvertisementDO;

import java.util.List;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-08
 * Time: 下午8:22
 */

@HttpOpenApi(group = "advertisement",description = "广告推销")
public interface AdvertisementService {

    @HttpMethod(description = "取得活跃广告")
    public List<AdvertisementDO> getActiveAd(
            @HttpParam(name = "adType",type = HttpParamType.COMMON,description = "广告类型")Integer adType)throws ServiceException;

}
