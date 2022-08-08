package com.ubiquitous.market.app.api.api.freight;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.order.OrderRequestDTO;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-07
 * Time: 下午7:40
 */
@HttpOpenApi(group = "freight", description = "运费计算api")
public interface FreightTemplateService {

    @HttpMethod(description = "得到订单的运费")
    public Integer getFreightMoney(
            @NotNull @HttpParam(name = "userId", type = HttpParamType.USER_ID, description = "用户ID") Long userId,
            @NotNull @HttpParam(name = "orderRequestDTO", type = HttpParamType.COMMON, description = "订单传回数据") OrderRequestDTO orderRequestDTO) throws ServiceException;
}
