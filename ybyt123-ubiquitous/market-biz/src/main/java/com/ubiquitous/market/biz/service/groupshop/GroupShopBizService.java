package com.ubiquitous.market.biz.service.groupshop;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ubiquitous.market.data.domain.GroupShopSkuDO;
import com.ubiquitous.market.data.dto.goods.GroupShopDTO;
import com.ubiquitous.market.data.enums.StatusType;
import com.ubiquitous.market.data.mapper.GroupShopMapper;
import com.ubiquitous.market.data.mapper.GroupShopSkuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * Description:
 * User: admin
 * Date: 2019/11/25
 * Time: 11:30
 */
@Service
public class GroupShopBizService {

    @Autowired
    private GroupShopMapper groupShopMapper;

    @Autowired
    private GroupShopSkuMapper groupShopSkuMapper;

    public GroupShopDTO getGroupShopById(Long id) {
        GroupShopDTO detail = groupShopMapper.detail(id);
        if (detail == null || detail.getStatus() == StatusType.LOCK.getCode()) {
            return null;
        }
        List<GroupShopSkuDO> groupShopSkuList = groupShopSkuMapper.selectList(new EntityWrapper<GroupShopSkuDO>().eq("group_shop_id", id));
        detail.setGroupShopSkuList(groupShopSkuList);
        return detail;
    }

}
