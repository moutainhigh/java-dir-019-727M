package com.ubiquitous.market.data.dto;

import lombok.Data;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-20
 * Time: 上午11:46
 */

@Data
public class ConfigDTO extends SuperDTO {
    private String title;
    private String logoUrl;
    private String description;
    private String address;
    private Integer showType;
    private Integer status;
}
