package com.ubiquitous.market.rider.exception;

import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.core.exception.ServiceExceptionDefinition;

/**
 * Created by admin on 2019/6/30.
 */
public class LauncherServiceException extends ServiceException {

    public LauncherServiceException(ServiceExceptionDefinition exceptionDefinition) {
        super(exceptionDefinition);
    }

}
