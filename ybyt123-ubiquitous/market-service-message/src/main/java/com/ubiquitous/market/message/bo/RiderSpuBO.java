package com.ubiquitous.market.message.bo;

import lombok.Data;

import java.io.Serializable;

/**
 * @description:
 * @author: fy
 * @date: 2020/03/03 16:18
 **/
@Data
public class RiderSpuBO implements Serializable {

    // 商品名称
    private String spuName;

    // 数量
    private String amount;

    // 商品URL
    private String url;

    // 单价
    private Double unitPrice;

    // 优惠单价格
    private Double preferentialPrice;

}
