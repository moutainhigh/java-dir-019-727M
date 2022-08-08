package com.ubiquitous.market.rider.app.api.task;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ubiquitous.market.core.exception.AppServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.component.LockComponent;
import com.ubiquitous.market.data.domain.RiderOrderDO;
import com.ubiquitous.market.data.domain.RiderSpuDO;
import com.ubiquitous.market.data.dto.rider.RiderOrderDTO;
import com.ubiquitous.market.data.dto.rider.RiderOrderStatisticalDTO;
import com.ubiquitous.market.data.dto.rider.RiderStatisticalDTO;
import com.ubiquitous.market.data.enums.RiderOrderStatusType;
import com.ubiquitous.market.data.mapper.RiderOrderMapper;
import com.ubiquitous.market.data.mapper.RiderSpuMapper;
import com.ubiquitous.market.data.model.Page;
import com.ubiquitous.market.rider.message.handler.IRiderOderBusinessSerivce;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @description: 配送中心业务接口
 * @author: fy
 * @date: 2020/03/01 19:34
 **/
@Service
public class TaskCenterServiceImpl implements TaskCenterService {

    @Autowired
    private LockComponent lockComponent;

    @Autowired
    private RiderSpuMapper riderSpuMapper;

    @Autowired
    private RiderOrderMapper riderOrderMapper;

    @Autowired
    private IRiderOderBusinessSerivce riderOderBusinessSerivce;

    private static final Logger logger = LoggerFactory.getLogger(TaskCenterServiceImpl.class);

    private static final Integer RIDER_ORDER_LOCK_WAITING_TIME = 30;
    private static final String RIDER_ORDER_STATUS_LOCK = "RIDER_ORDER_STATUS_LOCK";

    @Override
    public Page<RiderOrderDO> list(Integer status, Integer page, Integer limit, Long riderId) throws ServiceException {
        if (ObjectUtils.isEmpty(status)) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_NOT_EXIST);
        }
        Wrapper<RiderOrderDO> wrapper = new EntityWrapper<>();
        wrapper.eq("status", status);
        wrapper.eq("rider_id", riderId);
        if (RiderOrderStatusType.ABNORMAL.getCode().equals(status) || RiderOrderStatusType.COMPLETED.getCode().equals(status)) {
            wrapper.orderBy("gmt_update", false);
        } else {
            // 越先分配的越排在前面
            wrapper.orderBy("predict_time", true);
        }
        List<RiderOrderDO> riderOrderDOList = riderOrderMapper.selectPage(new RowBounds((page - 1) * limit, limit), wrapper);
        Integer count = riderOrderMapper.selectCount(wrapper);
        return new Page<>(riderOrderDOList, page, limit, count);
    }

    @Override
    public RiderOrderDTO detail(Long riderOrderId, Long riderId) throws ServiceException {
        RiderOrderDO riderOrderDO = riderOrderMapper.selectById(riderOrderId);
        if (riderOrderDO == null) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_NOT_EXIST);
        }
        Wrapper<RiderSpuDO> wrapper = new EntityWrapper<>();
        wrapper.eq("rider_order_id", riderOrderId);
        List<RiderSpuDO> riderSpuDOS = riderSpuMapper.selectList(wrapper);
        if (riderSpuDOS == null || riderSpuDOS.size() == 0) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_SPU_NOT_EXIST);
        }
        RiderOrderDTO riderOrderDTO = new RiderOrderDTO();
        BeanUtils.copyProperties(riderOrderDO, riderOrderDTO);
        riderOrderDTO.setRiderSpuDOList(riderSpuDOS);
        return riderOrderDTO;
    }


    @Override
    public String begin(Long riderOrderId, BigDecimal lng, BigDecimal lat, Long riderId) throws ServiceException {
        RiderOrderDO riderOrderDO = riderOrderMapper.selectById(riderOrderId);
        if (riderOrderDO == null) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_NOT_EXIST);
        }
        if (!((RiderOrderStatusType.WAITING.getCode()).equals(riderOrderDO.getStatus()) || (RiderOrderStatusType.ABNORMAL.getCode()).equals(riderOrderDO.getStatus()))) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_NOT_MATCH);
        }
        String orderNo = riderOrderDO.getOrderNo();
        try {
            if (lockComponent.tryLock(RIDER_ORDER_STATUS_LOCK + orderNo, RIDER_ORDER_LOCK_WAITING_TIME)) {
                riderOrderDO.setStatus(RiderOrderStatusType.DISPENSE.getCode());
                riderOrderDO.setGmtUpdate(new Date());
                if (riderOrderMapper.updateById(riderOrderDO) > 0) {
                    riderOderBusinessSerivce.sendRiderMessageBusiness(riderOrderDO.getOrderNo(), RiderOrderStatusType.DISPENSE, riderOrderDO.getRiderId(), null);
                    return "ok";
                }
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UPDATE_FAIL);
            } else {
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_SYSTEM_BUSY);
            }
        } catch (Exception e) {
            logger.error("[订单配送状态变更] 异常", e);
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UNKNOWN_EXCEPTION);
        } finally {
            lockComponent.release(RIDER_ORDER_STATUS_LOCK + orderNo);
        }
    }

    @Override
    public String abnormal(Long riderOrderId, String reason, BigDecimal lng, BigDecimal lat, Long riderId) throws ServiceException {
        RiderOrderDO riderOrderDO = riderOrderMapper.selectById(riderOrderId);
        if (riderOrderDO == null) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_NOT_EXIST);
        }
        if (!((RiderOrderStatusType.DISPENSE.getCode()).equals(riderOrderDO.getStatus()))) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_NOT_MATCH);
        }
        String orderNo = riderOrderDO.getOrderNo();
        try {
            if (lockComponent.tryLock(RIDER_ORDER_STATUS_LOCK + orderNo, RIDER_ORDER_LOCK_WAITING_TIME)) {
                riderOrderDO.setStatus(RiderOrderStatusType.ABNORMAL.getCode());
                riderOrderDO.setAbnormal(RiderOrderStatusType.ABNORMAL.getCode());
                riderOrderDO.setGmtUpdate(new Date());
                riderOrderDO.setReason(reason);
                if (riderOrderMapper.updateById(riderOrderDO) > 0) {
                    riderOderBusinessSerivce.sendRiderMessageBusiness(riderOrderDO.getOrderNo(), RiderOrderStatusType.ABNORMAL, riderOrderDO.getRiderId(), reason);
                    return "ok";
                }
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UPDATE_FAIL);
            } else {
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_SYSTEM_BUSY);
            }
        } catch (Exception e) {
            logger.error("[订单配送状态变更] 异常", e);
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UNKNOWN_EXCEPTION);
        } finally {
            lockComponent.release(RIDER_ORDER_STATUS_LOCK + orderNo);
        }
    }

    @Override
    public String complete(Long riderOrderId, BigDecimal lng, BigDecimal lat, Long riderId) throws ServiceException {
        RiderOrderDO riderOrderDO = riderOrderMapper.selectById(riderOrderId);
        if (riderOrderDO == null) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_NOT_EXIST);
        }
        if (!((RiderOrderStatusType.DISPENSE.getCode()).equals(riderOrderDO.getStatus())
                || (RiderOrderStatusType.TIMEOUT.getCode()).equals(riderOrderDO.getStatus())
                || (RiderOrderStatusType.ABNORMAL.getCode()).equals(riderOrderDO.getStatus()))) {
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_STATUS_NOT_MATCH);
        }
        String orderNo = riderOrderDO.getOrderNo();
        try {
            if (lockComponent.tryLock(RIDER_ORDER_STATUS_LOCK + orderNo, RIDER_ORDER_LOCK_WAITING_TIME)) {
                riderOrderDO.setStatus(RiderOrderStatusType.COMPLETED.getCode());
                riderOrderDO.setGmtUpdate(new Date());
                if (riderOrderMapper.updateById(riderOrderDO) > 0) {
                    riderOderBusinessSerivce.sendRiderMessageBusiness(riderOrderDO.getOrderNo(), RiderOrderStatusType.COMPLETED, riderOrderDO.getRiderId(), null);
                    return "ok";
                }
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UPDATE_FAIL);
            } else {
                throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_SYSTEM_BUSY);
            }
        } catch (Exception e) {
            logger.error("[订单配送状态变更] 异常", e);
            throw new AppServiceException(ExceptionDefinition.RIDER_ORDER_UNKNOWN_EXCEPTION);
        } finally {
            lockComponent.release(RIDER_ORDER_STATUS_LOCK + orderNo);
        }
    }


    @Override
    public RiderOrderStatisticalDTO statistical(Long riderId) throws ServiceException {
        if (riderId != null) {
            List<RiderStatisticalDTO> riderStatisticalDTOList = riderOrderMapper.statisticalCount(riderId);
            if (riderStatisticalDTOList != null && riderStatisticalDTOList.size() > 0) {
                RiderOrderStatisticalDTO riderOrderStatisticalDTO = new RiderOrderStatisticalDTO();
                for (RiderStatisticalDTO riderStatisticalDTO : riderStatisticalDTOList) {
                    if (RiderOrderStatusType.WAITING.getCode().equals(riderStatisticalDTO.getStatus())) {
                        riderOrderStatisticalDTO.setWaitingCount(riderStatisticalDTO.getCount());
                    } else if (RiderOrderStatusType.TIMEOUT.getCode().equals(riderStatisticalDTO.getStatus())) {
                        riderOrderStatisticalDTO.setTimeoutCount(riderStatisticalDTO.getCount());
                    } else if (RiderOrderStatusType.ABNORMAL.getCode().equals(riderStatisticalDTO.getStatus())) {
                        riderOrderStatisticalDTO.setAbnormalCount(riderStatisticalDTO.getCount());
                    } else if (RiderOrderStatusType.COMPLETED.getCode().equals(riderStatisticalDTO.getStatus())) {
                        riderOrderStatisticalDTO.setCompletedCount(riderStatisticalDTO.getCount());
                    } else if (RiderOrderStatusType.DISPENSE.getCode().equals(riderStatisticalDTO.getStatus())) {
                        riderOrderStatisticalDTO.setDispenseCount(riderStatisticalDTO.getCount());
                    }
                }
                return riderOrderStatisticalDTO;
            }
        }
        return null;
    }
}
