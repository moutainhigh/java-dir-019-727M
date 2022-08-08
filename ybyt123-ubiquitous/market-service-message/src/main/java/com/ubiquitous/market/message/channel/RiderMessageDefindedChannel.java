package com.ubiquitous.market.message.channel;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

/**
 * @description: 定义配送信息消息通道
 * @author: fy
 * @date: 2020/03/01 20:25
 **/
public interface RiderMessageDefindedChannel {

    /**
     * 配送订单输出通道
     */
    String RIDER_ORDER_OUTPUT = "rider_order_output";

    /**
     * 配送订单输入通道
     */
    String RIDER_ORDER_INPUT = "rider_order_input";

    /**
     * 配送订单状态输出通道
     *
     * @return MessageChannel
     * @author fangyi
     * @date 2020/03/01 20:20
     */
    @Output(RiderMessageDefindedChannel.RIDER_ORDER_OUTPUT)
    public MessageChannel riderToOrderOutput();

    /**
     * 配送订单状态通道
     *
     * @return SubscribableChannel
     * @author fangyi
     * @date 2020/03/01 20:20
     */
    @Input(RiderMessageDefindedChannel.RIDER_ORDER_INPUT)
    public SubscribableChannel riderToOrderInput();

}
