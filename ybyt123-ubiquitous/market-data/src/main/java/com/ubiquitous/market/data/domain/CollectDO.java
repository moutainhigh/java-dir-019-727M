package com.ubiquitous.market.data.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
@author admin
@date  2019/7/5 - 10:03
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("ubiquitous_collect")
public class CollectDO extends SuperDO{
    @TableField("user_id")
    private Long userId;

    @TableField("spu_id")
    private Long spuId;

}
