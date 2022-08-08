package com.ubiquitous.market.app.api.api.groupshop;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.data.dto.goods.GroupShopDTO;
import com.ubiquitous.market.data.model.Page;

import java.rmi.ServerException;

/**
 *
 * Description:
 * User: admin
 * Date: 2019/11/24
 * Time: 15:15
 */
@HttpOpenApi(group = "groupshop", description = "团购服务")
public interface GroupShopService {

    @HttpMethod(description = "获取团购列表")
    public Page<GroupShopDTO> getGroupShopPage(
            @HttpParam(name = "page", type = HttpParamType.COMMON, description = "页码", valueDef = "1") Integer pageNo,
            @HttpParam(name = "pageSize", type = HttpParamType.COMMON, description = "页码长度", valueDef = "10") Integer pageSize) throws ServerException;


}
