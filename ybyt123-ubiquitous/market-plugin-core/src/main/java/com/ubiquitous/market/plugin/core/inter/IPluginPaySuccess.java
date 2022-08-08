package com.ubiquitous.market.plugin.core.inter;


import com.ubiquitous.market.data.dto.order.OrderDTO;

/**
 *
 * Description:
 * User: admin
 * Date: 2019/10/24
 * Time: 17:25
 */
public interface IPluginPaySuccess {

    public OrderDTO invoke(OrderDTO orderDTO, String prepayId);

}
