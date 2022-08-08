package com.ubiquitous.market.data.dto.goods;

import lombok.Data;

/**
@PackageName:com.ubiquitous.ubiquitous.data.dto.goods
@ClassName: GroupShopSkuDTO
@Description:
@author admin
@date 19-11-13下午3:16
*/
@Data
public class GroupShopSkuDTO extends SpuDTO {

    private Integer skuGroupShopPrice;

    private Integer groupShopId;

    private Long skuId;

    /**
     * sku属性
     */
    private Long spuId;

    private String barCode;

    private String title;

    private String img;

    private Integer original_price;

    private Integer vipPrice;

    private Integer stock;

    private Integer freezeStock;

}
