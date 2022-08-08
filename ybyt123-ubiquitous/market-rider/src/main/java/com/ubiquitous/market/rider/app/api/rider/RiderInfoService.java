package com.ubiquitous.market.rider.app.api.rider;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.rider.RiderLoginDTO;


/**
 * @description: 配送员
 * @author: fy
 * @date: 2020/02/28 11:26
 **/
@HttpOpenApi(group = "app.rider", description = "配送员中心")
public interface RiderInfoService {

    @HttpMethod(description = "骑手用户名登录")
    public RiderLoginDTO loginRider(@NotNull @HttpParam(name = "phone", type = HttpParamType.COMMON, description = "配送员手机号") String phone,
                                    @NotNull @HttpParam(name = "password", type = HttpParamType.COMMON, description = "用户密码") String password,
                                    @NotNull @HttpParam(name = "ip", type = HttpParamType.IP, description = "ip地址") String ip) throws ServiceException;

    @HttpMethod(description = "骑手用户名修改密码")
    public RiderLoginDTO fixPass(@NotNull @HttpParam(name = "oldPassword", type = HttpParamType.COMMON, description = "用户旧密码") String oldPassword,
                                 @NotNull @HttpParam(name = "newPassword", type = HttpParamType.COMMON, description = "用户新密码") String newPassword,
                                 @NotNull @HttpParam(name = "ip", type = HttpParamType.IP, description = "ip地址") String ip,
                                 @NotNull @HttpParam(name = "riderId", type = HttpParamType.RIDER_ID, description = "骑手主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "配送员开工")
    public String toWorking(@NotNull @HttpParam(name = "riderId", type = HttpParamType.RIDER_ID, description = "骑手主键Id") Long riderId) throws ServiceException;


    @HttpMethod(description = "配送员休息")
    public String toRest(@NotNull @HttpParam(name = "riderId", type = HttpParamType.RIDER_ID, description = "骑手主键Id") Long riderId) throws ServiceException;

    @HttpMethod(description = "获取配送员开工状态")
    public RiderLoginDTO getWorkingState(@NotNull @HttpParam(name = "riderId", type = HttpParamType.RIDER_ID, description = "骑手主键Id") Long riderId) throws ServiceException;
}
