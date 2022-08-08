package com.ubiquitous.market.message.order;

import com.ubiquitous.market.message.bo.OrderMessageBO;
import com.ubiquitous.market.message.channel.OrderMessageDefindedChannel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: fy
 * @date: 2020/03/01 16:36
 **/
@Slf4j
@Component
@EnableBinding(OrderMessageDefindedChannel.class)
public class OrderMessageServiceImpl implements IOrderMessageService {

    @Autowired
    private OrderMessageDefindedChannel orderMessageDefindedChannel;

    @Override
    public Boolean sendOrderMessageToRiderSerivce(OrderMessageBO orderMessageBO) {
        log.info("<< ===== 【开始发送订单消息:{}】 ==== >>", orderMessageBO);
        boolean sendFlag = orderMessageDefindedChannel.orderToRiderOutput().send(MessageBuilder.withPayload(orderMessageBO).build());
        log.info("<< ===== 【结束发送订单消息：{}】 ===== >>", (sendFlag) ? "success" : "fail");
        return sendFlag;
    }

}
