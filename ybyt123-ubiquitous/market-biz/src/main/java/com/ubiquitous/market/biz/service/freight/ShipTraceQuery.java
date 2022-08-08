package com.ubiquitous.market.biz.service.freight;

import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.freight.ShipTraceDTO;

/**
 * Created by admin on 2019/7/10.
 */
public interface ShipTraceQuery {

    public ShipTraceDTO query(String shipNo, String shipCode) throws ServiceException;

}
