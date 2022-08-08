package com.ubiquitous.market.data.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ubiquitous.market.data.domain.GroupShopSkuDO;
import com.ubiquitous.market.data.dto.goods.GroupShopSkuDTO;

import java.util.List;

/*
@PackageName:com.ubiquitous.ubiquitous.data.mapper
@ClassName: GroupShopSkuMapper
@Description:
@author admin
@date 19-11-13下午4:28
*/
public interface GroupShopSkuMapper extends BaseMapper<GroupShopSkuDO>{

    public List<GroupShopSkuDTO> getSkuList(Long groupShopId);

}
