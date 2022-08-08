package com.ubiquitous.market.data.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/*
@author admin
@date  2019/7/6 - 10:14
*/
@TableName("ubiquitous_appraise")
@Data
public class AppraiseDO extends SuperDO{

    @TableField("spu_id")
    private Long spuId;
    @TableField("sku_id")
    private Long skuId;
    @TableField("order_id")
    private Long orderId;
    @TableField("user_id")
    private Long userId;

    //评论内容
    private String content;
    //评论星数
    private Integer score;

    // 通过状态 1为通过
    @TableField("state")
    private Integer state;

}
