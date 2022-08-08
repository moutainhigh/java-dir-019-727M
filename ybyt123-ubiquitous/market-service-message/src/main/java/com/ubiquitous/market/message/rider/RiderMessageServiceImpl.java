package com.ubiquitous.market.message.rider;

import com.ubiquitous.market.message.bo.RiderMessageBO;
import com.ubiquitous.market.message.channel.RiderMessageDefindedChannel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: fy
 * @date: 2020/03/01 20:27
 **/
@Slf4j
@Component
@EnableBinding(RiderMessageDefindedChannel.class)
public class RiderMessageServiceImpl implements IRiderMessageService {

    @Autowired
    private RiderMessageDefindedChannel riderMessageDefindedChannel;

    @Override
    public Boolean sendRiderMessageToOrderService(RiderMessageBO riderMessageBO) {
        log.info("<< ===== 【开始发送订单配送状态消息:{}】 ==== >>", riderMessageBO);
        boolean sendFlag = riderMessageDefindedChannel.riderToOrderOutput().send(MessageBuilder.withPayload(riderMessageBO).build());
        log.info("<< ===== 【结束发送订单配送状态消息：{}】 ===== >>", (sendFlag) ? "success" : "fail");
        return sendFlag;
    }
}
