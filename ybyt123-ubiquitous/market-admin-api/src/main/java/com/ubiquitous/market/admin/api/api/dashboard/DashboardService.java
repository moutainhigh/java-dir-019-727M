package com.ubiquitous.market.admin.api.api.dashboard;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.SalesStatementDTO;
import com.ubiquitous.market.data.dto.UserStatementDTO;

import java.util.List;

/**
 *
 * @author admin
 * @date 2019/7/15
 */
@HttpOpenApi(group = "admin.dashboard" , description = "首页数据服务")
public interface DashboardService {

    @HttpMethod(description = "聚合数据")
    public Object integral(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员Id") Long adminId) throws ServiceException;

    @HttpMethod(description = "用户数量统计")
    List<UserStatementDTO> countUser(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员Id") Long adminId) throws ServiceException;

    @HttpMethod(description = "销售统计")
    List<SalesStatementDTO> getSalesStatement(
            @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库ID") Long storageId,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员Id") Long adminId) throws ServiceException;

    @HttpMethod(description = "近两日销售统计")
    List<SalesStatementDTO> getTodayAndYesterdaySales(
            @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库ID") Long storageId,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员Id") Long adminId) throws ServiceException;

    @HttpMethod(description = "按小时统计销量")
        List<SalesStatementDTO> getSalesByHour(
                @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库ID") Long storageId,
                @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员Id") Long adminId) throws ServiceException;

}
