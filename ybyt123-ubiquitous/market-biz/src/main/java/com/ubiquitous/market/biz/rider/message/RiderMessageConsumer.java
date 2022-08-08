package com.ubiquitous.market.biz.rider.message;

import com.ubiquitous.market.biz.service.order.OrderBizService;
import com.ubiquitous.market.core.exception.AppServiceException;
import com.ubiquitous.market.data.domain.OrderDO;
import com.ubiquitous.market.data.enums.OrderStatusType;
import com.ubiquitous.market.data.enums.RiderOrderStatusType;
import com.ubiquitous.market.data.mapper.OrderMapper;
import com.ubiquitous.market.message.bo.RiderMessageBO;
import com.ubiquitous.market.message.channel.RiderMessageDefindedChannel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;


/**
 * @description: 结束配送订单信息
 * @author: fy
 * @date: 2020/03/03 19:08
 **/
@Component
@SuppressWarnings("all")
@EnableBinding(RiderMessageDefindedChannel.class)
public class RiderMessageConsumer {

    private static final Logger logger = LoggerFactory.getLogger(RiderMessageConsumer.class);

    @Autowired
    private OrderBizService orderBizService;

    private OrderMapper orderMapper;

    @StreamListener(RiderMessageDefindedChannel.RIDER_ORDER_INPUT)
    public synchronized void orderRiderMeaageInPut(Message<RiderMessageBO> message) throws AppServiceException {
        logger.info("【*** 订单配送消息接收:{} ***】", message.getPayload());
        RiderMessageBO riderMessageBO = message.getPayload();
        try {
            if (riderMessageBO != null) {
                switch (RiderOrderStatusType.getBycode(riderMessageBO.getOrderRiderStatus())) {
                    case DISPENSE:
                        // 1.订单配送
                        orderBizService.updateOrderStatus(riderMessageBO.getOrderNo(), OrderStatusType.WAIT_CONFIRM.getCode());
                        break;
                    case TIMEOUT:
                        // 2.订单配送超时
                        orderBizService.updateOrderStatus(riderMessageBO.getOrderNo(), OrderStatusType.TIME_OUT.getCode());
                        break;
                    case ABNORMAL:
                        // 3.订单配送异常
                        OrderDO updateOrderDO = new OrderDO();
                        updateOrderDO.setExceptionReason(riderMessageBO.getErrorMsg());
                        updateOrderDO.setStatus(OrderStatusType.TRANS_ABNORMAL.getCode());
                        orderBizService.updateOrder(riderMessageBO.getOrderNo(), updateOrderDO);
                        break;
                    case COMPLETED:
                        // 4.订单配送完成 -- 进入待评价
                        orderBizService.updateOrderStatus(riderMessageBO.getOrderNo(), OrderStatusType.WAIT_APPRAISE.getCode());
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.info(e.getMessage());
        }
        logger.info("【*** 订单配送消息结束,状态：{} ***】", (riderMessageBO != null) ? "success" : "fail");
    }

    /**
     * 消息消费失败的降级处理逻辑
     *
     * @param message
     */
    @ServiceActivator(inputChannel = "my.queue.rider.to.order.messages.riderToOderMessageConsumers.errors")
    public void error(Message<?> message) {
        //TODO
        logger.error("Message consumer failed, call fallback!" + message.toString());
    }

}
