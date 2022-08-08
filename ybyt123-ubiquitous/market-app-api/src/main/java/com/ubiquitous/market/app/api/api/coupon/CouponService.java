package com.ubiquitous.market.app.api.api.coupon;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.CouponDTO;
import com.ubiquitous.market.data.dto.UserCouponDTO;

import java.util.List;

/**
 * APP优惠券
 *
 * @author kaixin
 * @date 2020/3/10
 */
@HttpOpenApi(group = "coupon", description = "优惠券服务")
public interface CouponService {

    @HttpMethod(description = "领取优惠券")
    public String obtainCoupon(
            @NotNull @HttpParam(name = "activityId", type = HttpParamType.COMMON, description = "活动Id") Long activityId,
            @NotNull @HttpParam(name = "couponId", type = HttpParamType.COMMON, description = "优惠券Id") Long couponId,
            @NotNull @HttpParam(name = "userId", type = HttpParamType.USER_ID, description = "用户Id") Long userId) throws ServiceException;

    @HttpMethod(description = "获取用户可领取优惠券")
    public List<CouponDTO> getObtainableCoupon(
            @NotNull @HttpParam(name = "userId", type = HttpParamType.USER_ID, description = "用户Id") Long userId) throws ServiceException;

    @HttpMethod(description = "获取用户优惠券")
    public List<UserCouponDTO> getUserCoupons(
            @NotNull @HttpParam(name = "userId", type = HttpParamType.USER_ID, description = "用户Id") Long userId,
            @NotNull @HttpParam(name = "couponType", type = HttpParamType.COMMON, description = "优惠券类型[1优惠券2抢购券]") Integer couponType,
            @HttpParam(name = "status", type = HttpParamType.COMMON, description = "优惠券状态[1未使用2已使用3已过期]") Integer status) throws ServiceException;

}
