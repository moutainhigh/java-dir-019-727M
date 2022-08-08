package com.ubiquitous.market.plugin.core.inter;

import com.ubiquitous.market.data.dto.order.OrderRequestDTO;

/**
 *
 * Description:
 * User: admin
 * Date: 2019/10/24
 * Time: 11:22
 */
public interface IPluginPreOrder {

    public OrderRequestDTO invoke(OrderRequestDTO requestDTO);

}
