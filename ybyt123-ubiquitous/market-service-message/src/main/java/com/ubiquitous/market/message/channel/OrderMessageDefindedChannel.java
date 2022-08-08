package com.ubiquitous.market.message.channel;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

/**
 * @description: 订单消息通道
 * @author: fy
 * @date: 2020/03/01 20:20
 **/
public interface OrderMessageDefindedChannel {


    /**
     * 订单输出通道
     */
    String ORDER_RIDER_OUTPUT = "order_rider_output";

    /**
     * 订单输入通道
     */
    String ORDER_RIDER_INPUT = "order_rider_input";

    /**
     * 订单输出通道
     *
     * @return MessageChannel
     * @author fangyi
     * @date 2020/03/01 20:20
     */
    @Output(OrderMessageDefindedChannel.ORDER_RIDER_OUTPUT)
    public MessageChannel orderToRiderOutput();

    /**
     * 订单输入通道
     *
     * @return SubscribableChannel
     * @author fangyi
     * @date 2020/03/01 20:20
     */
    @Input(OrderMessageDefindedChannel.ORDER_RIDER_INPUT)
    public SubscribableChannel orderToRiderInput();

}
