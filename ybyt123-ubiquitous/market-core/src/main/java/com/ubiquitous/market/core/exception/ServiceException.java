package com.ubiquitous.market.core.exception;

import java.io.Serializable;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-01-31
 * Time: 下午8:07
 */
public abstract class ServiceException extends Exception implements Serializable {

    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public ServiceException() {
    }

    public ServiceException(String message, int code) {
        super(message);
        this.code = code;
    }

    public ServiceException(ServiceExceptionDefinition definition) {
        super(definition.getMsg());
        this.code = definition.getCode();
    }
}
