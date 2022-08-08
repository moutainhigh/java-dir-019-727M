package com.ubiquitous.market.app.api.api.newtimes;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.NewTimesDO;

import java.util.List;

@HttpOpenApi(group = "newtimes",description = "新鲜时报")
public interface newtimesService {

    @HttpMethod(description = "查询所有仓库的新鲜时报")
    public List<NewTimesDO> getNewTimes() throws ServiceException;
}
