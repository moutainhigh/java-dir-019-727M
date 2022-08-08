package com.ubiquitous.market.rider.message.handler;

import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.enums.RiderOrderStatusType;
import com.ubiquitous.market.message.bo.OrderMessageBO;

/**
 * @description: 配送订单业务处理接口
 * @author: fy
 * @date: 2020/03/03 21:02
 **/
public interface IRiderOderBusinessSerivce {

    /**
     * 消费订单配送信息
     *
     * @param orderMessageBO 订单配送信息
     * @return 是否成功
     * @throws ServiceException
     */
    Boolean comsumerOderMessageBusiness(OrderMessageBO orderMessageBO) throws ServiceException;


    /**
     * 通知订单的配送信息
     *
     * @param orderNo              订单编号
     * @param riderOrderStatusType 配送状态
     * @param riderId              配送员主键ID
     * @param errorMsg             配送异常【如果有】
     * @return 是否成功
     * @throws ServiceException
     */
    Boolean sendRiderMessageBusiness(String orderNo, RiderOrderStatusType riderOrderStatusType, Long riderId, String errorMsg) throws ServiceException;

}
