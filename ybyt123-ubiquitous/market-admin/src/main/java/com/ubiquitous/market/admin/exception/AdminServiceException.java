package com.ubiquitous.market.admin.exception;

import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.core.exception.ServiceExceptionDefinition;

/**
 *
 * @author admin
 * @date 2019/6/30
 */
public class AdminServiceException extends ServiceException {

    public AdminServiceException(ServiceExceptionDefinition exceptionDefinition) {
        super(exceptionDefinition);
    }

}
