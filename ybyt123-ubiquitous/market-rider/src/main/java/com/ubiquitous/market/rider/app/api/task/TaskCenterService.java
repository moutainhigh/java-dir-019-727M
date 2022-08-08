package com.ubiquitous.market.rider.app.api.task;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.RiderOrderDO;
import com.ubiquitous.market.data.dto.rider.RiderOrderDTO;
import com.ubiquitous.market.data.dto.rider.RiderOrderStatisticalDTO;
import com.ubiquitous.market.data.model.Page;

import java.math.BigDecimal;

/**
 * @description: 任务中心
 * @author: fy
 * @date: 2020/02/28 11:23
 **/
@HttpOpenApi(group = "app.task", description = "任务中心")
public interface TaskCenterService {

    @HttpMethod(description = "根据配送状态获取订单信息列表")
    public Page<RiderOrderDO> list(
            @HttpParam(name = "status", type = HttpParamType.COMMON, description = "配送订单状态[0:待取货,1:配送中,2:超时,3:配送异常,4:已完成]") Integer status,
            @HttpParam(name = "page", type = HttpParamType.COMMON, description = "页码", valueDef = "1") Integer page,
            @HttpParam(name = "limit", type = HttpParamType.COMMON, description = "页码长度", valueDef = "20") Integer limit,
            @NotNull @HttpParam(name = "riderId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "订单详情")
    public RiderOrderDTO detail(@NotNull @HttpParam(name = "riderOrderId", type = HttpParamType.COMMON, description = "配送订单主键ID") Long riderOrderId,
                                @NotNull @HttpParam(name = "userId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "开始配送")
    public String begin(@NotNull @HttpParam(name = "riderOrderId", type = HttpParamType.COMMON, description = "配送订单主键ID") Long riderOrderId,
                        @HttpParam(name = "lng", type = HttpParamType.COMMON, description = "经度") BigDecimal lng,
                        @HttpParam(name = "lat", type = HttpParamType.COMMON, description = "纬度") BigDecimal lat,
                        @NotNull @HttpParam(name = "userId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "异常配送")
    public String abnormal(@NotNull @HttpParam(name = "riderOrderId", type = HttpParamType.COMMON, description = "配送订单主键ID") Long riderOrderId,
                           @NotNull @HttpParam(name = "reason", type = HttpParamType.COMMON, description = "异常配送原因") String reason,
                           @HttpParam(name = "lng", type = HttpParamType.COMMON, description = "经度") BigDecimal lng,
                           @HttpParam(name = "lat", type = HttpParamType.COMMON, description = "纬度") BigDecimal lat,
                           @NotNull @HttpParam(name = "userId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "完成配送")
    public String complete(@NotNull @HttpParam(name = "riderOrderId", type = HttpParamType.COMMON, description = "配送订单主键ID") Long riderOrderId,
                           @HttpParam(name = "lng", type = HttpParamType.COMMON, description = "经度") BigDecimal lng,
                           @HttpParam(name = "lat", type = HttpParamType.COMMON, description = "纬度") BigDecimal lat,
                           @NotNull @HttpParam(name = "userId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "列表统计")
    public RiderOrderStatisticalDTO statistical(@NotNull @HttpParam(name = "userId", type = HttpParamType.RIDER_ID, description = "配送员主键Id") Long riderId) throws ServiceException;
}
