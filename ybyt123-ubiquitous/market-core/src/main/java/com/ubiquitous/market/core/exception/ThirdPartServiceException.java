package com.ubiquitous.market.core.exception;

/**
 * 第三方接口服务异常
 * Created by admin on 2019/7/3.
 */
public class ThirdPartServiceException extends ServiceException {

    public ThirdPartServiceException(ServiceExceptionDefinition definition) {
        super(definition);
    }

    public ThirdPartServiceException(String message, int code) {
        super(message, code);
    }

}
