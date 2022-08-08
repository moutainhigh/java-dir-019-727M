package com.ubiquitous.market.app.api.api.share;


import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;

/**
 * 活动分享链接
 *
 * @author kaixin
 * @date 2020/03/01
 */
@HttpOpenApi(group = "share", description = "活动分享链接")
public interface ShareService {

    @HttpMethod(description = "邀请新用户分享链接")
    public String inviteNewPeople(
            @NotNull @HttpParam(name = "userId", type = HttpParamType.USER_ID, description = "用户Id") Long userId) throws ServiceException;


}
