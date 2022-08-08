package com.ubiquitous.market.rider.quartz;

import com.ubiquitous.market.core.exception.BizServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.component.LockComponent;

import com.ubiquitous.market.data.enums.RiderOrderStatusType;
import com.ubiquitous.market.data.mapper.RiderOrderMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;


@Component
@EnableScheduling
public class CheckQuartz {

    private static final Logger logger = LoggerFactory.getLogger(CheckQuartz.class);

    private static final Integer RIDER_ORDER_LOCK_WAITING_TIME = 30;
    private static final String RIDER_ORDER_STATUS_LOCK = "RIDER_ORDER_STATUS_LOCK";
    private static final String RIDER_ORDER_START_LOCK = "RIDER_ORDER_START_LOCK";

    @Autowired
    private LockComponent lockComponent;

    @Autowired
    private RiderOrderMapper riderOrderMapper;

    /**
     * 设定60s跑一次,配送订单得超时时间
     */
    @Scheduled(fixedRate = 60000)
    @Transactional(rollbackFor = Exception.class)
    public void groupShopStart() throws Exception {
        if (lockComponent.tryLock(RIDER_ORDER_START_LOCK, RIDER_ORDER_LOCK_WAITING_TIME)) {
            try {
                Date now = new Date();
                // 配送中状态的订单检验超时
                List<String> dispenseOrderNoList = riderOrderMapper.selectRiderOrderExpireOrderNos(RiderOrderStatusType.DISPENSE.getCode(), now);
                if (dispenseOrderNoList != null && dispenseOrderNoList.size() > 0) {
                    for (String dispenseOrderNo : dispenseOrderNoList) {
                        changeOrderStatusToTimeOut(dispenseOrderNo, RiderOrderStatusType.TIMEOUT.getCode());
                    }
                }
                // 待取货状态的订单检验超时
                List<String> waitingOrderNoList = riderOrderMapper.selectRiderOrderExpireOrderNos(RiderOrderStatusType.WAITING.getCode(), now);
                if (waitingOrderNoList != null && waitingOrderNoList.size() > 0) {
                    for (String waitingOrderNo : waitingOrderNoList) {
                        changeOrderStatusToTimeOut(waitingOrderNo, RiderOrderStatusType.TIMEOUT.getCode());
                    }
                }
            } catch (Exception e) {
                logger.error("[订单配送超时验证 定时任务] 异常", e);
                throw e;
            } finally {
                lockComponent.release(RIDER_ORDER_START_LOCK);
            }
        }
    }

    public boolean changeOrderStatusToTimeOut(String orderNo, Integer status) throws ServiceException {
        try {
            // 防止传入值为空
            if (StringUtils.isEmpty(orderNo) || status == null) {
                throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_CHANGE_FAILED);
            }
            if (lockComponent.tryLock(RIDER_ORDER_STATUS_LOCK + orderNo, RIDER_ORDER_LOCK_WAITING_TIME)) {
                if (riderOrderMapper.updateRiderOrderStatus(orderNo, status, true) > 0) {
                    return true;
                }
                throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_CHANGE_FAILED);
            } else {
                throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_SYSTEM_BUSY);
            }
        } catch (Exception e) {
            logger.error("[订单配送超时验证 定时任务] 异常", e);
            throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_UNKNOWN_EXCEPTION);
        } finally {
            lockComponent.release(RIDER_ORDER_STATUS_LOCK + orderNo);
        }
    }

}
