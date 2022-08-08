package com.ubiquitous.market.rider.message.order;


import com.ubiquitous.market.message.bo.OrderMessageBO;
import com.ubiquitous.market.message.channel.OrderMessageDefindedChannel;
import com.ubiquitous.market.rider.message.handler.IRiderOderBusinessSerivce;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;


/**
 * @description: 订单信息消费
 * @author: fy
 * @date: 2020/03/03 19:08
 **/
@Component
@EnableBinding(OrderMessageDefindedChannel.class)
public class OrderMessageConsumer {

    private static final Logger logger = LoggerFactory.getLogger(OrderMessageConsumer.class);

    @Autowired
    private IRiderOderBusinessSerivce riderOderBusinessSerivce;

    @StreamListener(OrderMessageDefindedChannel.ORDER_RIDER_INPUT)
    public void orderRiderMeaageInPut(Message<OrderMessageBO> message) {
        logger.info("【*** 订单消息接收:{} ***】", message.getPayload());
        Boolean comsumerFlag = null;
        try {
            comsumerFlag = riderOderBusinessSerivce.comsumerOderMessageBusiness(message.getPayload());
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("【*** 订单消息结束,状态：{} ***】", (comsumerFlag) ? "success" : "fail");
    }

    /**
     * 消息消费失败的降级处理逻辑
     *
     * @param message
     */
    @ServiceActivator(inputChannel = "my.queue.order.to.rider.messages.orderToRiderMessageConsumers.errors")
    public void error(Message<?> message) {
        //TODO
        logger.error("Message consumer failed, call fallback!" + message.toString());
    }

}
