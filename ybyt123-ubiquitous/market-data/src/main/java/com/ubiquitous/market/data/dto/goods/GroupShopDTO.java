package com.ubiquitous.market.data.dto.goods;

import com.ubiquitous.market.data.domain.GroupShopSkuDO;
import com.ubiquitous.market.data.dto.SuperDTO;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
@PackageName:com.ubiquitous.ubiquitous.data.dto.goods
@ClassName: GroupShopDTO
@Description:
@author admin
@date 19-11-13下午1:36
*/

@Data
public class GroupShopDTO extends SuperDTO {

    private Long spuId;

    private Integer minPrice;

    private Integer maxPrice;

    private Date gmtStart;

    private Date gmtEnd;

    private Integer minimumNumber;

    private Integer alreadyBuyNumber;

    private Integer automaticRefund;

    /**
     * GroupShopSkuDTO列表
     */
    private List<GroupShopSkuDTO> groupShopSkuDTOList;

    private List<GroupShopSkuDO> groupShopSkuList;

    /**
     * spu属性
     */
    private Integer originalPrice;

    private Integer price;

    private Integer vipPrice;

    private String title;

    private Integer sales;

    private String img;

    private String detail;

    private String description;

    private Long categoryId;

    private Long freightTemplateId;

    private String unit;

    private Integer status;
}
