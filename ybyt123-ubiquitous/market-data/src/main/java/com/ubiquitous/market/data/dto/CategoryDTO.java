package com.ubiquitous.market.data.dto;

import lombok.Data;

import java.util.List;

/**
 * Created by admin on 2019/7/2.
 */
@Data
public class CategoryDTO extends SuperDTO {

    private Long parentId;

    private String title;

    private String iconUrl;

    private String picUrl;

    private List<CategoryDTO> childrenList;

}
