package com.ubiquitous.market.app.api.api.category;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.CategoryDTO;

import java.util.List;

/**
 * Created by admin on 2019/7/2.
 */
@HttpOpenApi(group = "category", description = "类目服务")
public interface CategoryService {

    @HttpMethod(description = "获取类目列表")
    public List<CategoryDTO> categoryList() throws ServiceException;

    @HttpMethod(description = "获取分类父节点")
    public List<Long> getCategoryFamily(
            @NotNull @HttpParam(name = "categoryId", type = HttpParamType.COMMON, description = "类目Id") Long categoryId) throws ServiceException;

}
