package com.ubiquitous.market.rider.exception;

import com.ubiquitous.market.core.exception.ServiceExceptionDefinition;

/**
 * Created by admin on 2019/6/30.
 */
public class LauncherExceptionDefinition {

    public static final ServiceExceptionDefinition LAUNCHER_API_REGISTER_FAILED =
            new ServiceExceptionDefinition(9999, "api注册失败");

    public static final ServiceExceptionDefinition LAUNCHER_UNKNOWN_EXCEPTION =
            new ServiceExceptionDefinition(10000, "系统未知异常");

    public static final ServiceExceptionDefinition LAUNCHER_USER_NOT_LOGIN =
            new ServiceExceptionDefinition(10001, "用户尚未登录");

    public static final ServiceExceptionDefinition LAUNCHER_PARAM_CHECK_FAILED =
            new ServiceExceptionDefinition(10002, "参数校验失败");

    public static final ServiceExceptionDefinition LAUNCHER_API_NOT_EXISTS =
            new ServiceExceptionDefinition(10003, "API不存在");

    public static final ServiceExceptionDefinition LAUNCHER_DATA_NOT_CONSISTENT =
            new ServiceExceptionDefinition(10004, "attention please！系统内部数据不一致 注意！！");

    public static final ServiceExceptionDefinition LAUNCHER_API_NOT_SUPPORT =
            new ServiceExceptionDefinition(10005, "Api 不再支持调用");

    public static final ServiceExceptionDefinition LAUNCHER_ADMIN_NOT_LOGIN =
            new ServiceExceptionDefinition(10006, " 管理员尚未登录");

    public static final ServiceExceptionDefinition LAUNCHER_SYSTEM_BUSY =
            new ServiceExceptionDefinition(10007, "系统繁忙～");

    public static final ServiceExceptionDefinition LAUNCHER_ADMIN_PERMISSION_DENY =
            new ServiceExceptionDefinition(10008, "管理员权限不足");

    public static final ServiceExceptionDefinition USER_PHONE_OR_PASSWORD_NOT_CORRECT =
            new ServiceExceptionDefinition(10009, "密码错误!");

    public static final ServiceExceptionDefinition RIDER_CAN_NOT_ACTICE =
            new ServiceExceptionDefinition(10010, "骑手处于禁用状态，请联系管理员");

    public static final ServiceExceptionDefinition RIDER_ACCOUNT_REQISTERED =
            new ServiceExceptionDefinition(10011, "账号已经注册过了");
}
