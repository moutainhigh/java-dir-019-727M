package com.ubiquitous.market.message.order;

import com.ubiquitous.market.message.bo.OrderMessageBO;

/**
 * @description:
 * @author: fy
 * @date: 2020/03/01 16:36
 **/
public interface IOrderMessageService {

    /**
     * 发送订单消息到配送服务
     *
     * @param orderMessageBO 订单业务实体
     * @return 是否成功
     */
    Boolean sendOrderMessageToRiderSerivce(OrderMessageBO orderMessageBO);
}
