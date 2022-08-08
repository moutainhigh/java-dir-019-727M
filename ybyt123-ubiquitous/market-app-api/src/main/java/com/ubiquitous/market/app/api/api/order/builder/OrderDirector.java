package com.ubiquitous.market.app.api.api.order.builder;

import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.OrderDO;
import com.ubiquitous.market.data.dto.order.OrderPriceDTO;
import com.ubiquitous.market.data.dto.order.OrderRequestDTO;

/**
 * @description: 指挥者
 * @author: fy
 * @date: 2020/03/13 13:05
 **/
public class OrderDirector {

    private OrderBuilder builder;

    public OrderDirector(OrderBuilder builder) {
        this.builder = builder;
    }

    //构建与组装方法
    public void constructOrder(OrderDO orderDO, final OrderRequestDTO orderRequest, String channel, Long userId) throws ServiceException {
        builder.buildOrderCheckHandlePart(orderRequest, userId);
        OrderPriceDTO orderPriceDTO = builder.buildOrderPriceHandlePart(orderDO, orderRequest, userId);
        builder.buildOrderHandlePart(orderDO, orderPriceDTO, orderRequest, channel, userId);
        builder.buildCoupontHandlePart(orderDO);
        builder.buildOrderSkuHandlePart(orderDO, orderPriceDTO, orderRequest);
        builder.buildCartHandlePart(orderRequest, userId);
        builder.buildNotifyHandlePart(orderDO);
    }

}
