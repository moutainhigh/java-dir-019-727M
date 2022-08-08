package com.ubiquitous.market.message.rider;

import com.ubiquitous.market.message.bo.RiderMessageBO;

/**
 * @description:
 * @author: fy
 * @date: 2020/03/01 20:27
 **/
public interface IRiderMessageService {

    /**
     * 发送订单配送信息
     *
     * @param riderMessageBO 订单配送信息
     * @return 消息发送结果
     */
    Boolean sendRiderMessageToOrderService(RiderMessageBO riderMessageBO);

}
