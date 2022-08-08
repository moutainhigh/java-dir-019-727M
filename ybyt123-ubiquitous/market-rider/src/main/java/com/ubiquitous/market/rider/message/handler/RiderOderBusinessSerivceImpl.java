package com.ubiquitous.market.rider.message.handler;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ubiquitous.market.core.exception.AdminServiceException;
import com.ubiquitous.market.core.exception.BizServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.component.LockComponent;
import com.ubiquitous.market.data.domain.RiderOrderDO;
import com.ubiquitous.market.data.domain.RiderSpuDO;
import com.ubiquitous.market.data.enums.RiderOrderStatusType;
import com.ubiquitous.market.data.mapper.RiderOrderMapper;
import com.ubiquitous.market.data.mapper.RiderSpuMapper;
import com.ubiquitous.market.message.bo.OrderMessageBO;
import com.ubiquitous.market.message.bo.RiderMessageBO;
import com.ubiquitous.market.message.bo.RiderSpuBO;
import com.ubiquitous.market.message.rider.IRiderMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description: 订单消息处理业务实现
 * @author: fy
 * @date: 2020/03/03 21:02
 **/
@Service
@Transactional(rollbackFor = Exception.class)
public class RiderOderBusinessSerivceImpl implements IRiderOderBusinessSerivce {

    private static final Logger logger = LoggerFactory.getLogger(RiderOderBusinessSerivceImpl.class);

    private static final Integer RIDER_ORDER_LOCK_WAITING_TIME = 30;

    private static final String RIDER_ORDER_STATUS_LOCK = "RIDER_ORDER_STATUS_LOCK";

    @Autowired
    private LockComponent lockComponent;

    @Autowired
    private RiderSpuMapper riderSpuMapper;

    @Autowired
    private RiderOrderMapper riderOrderMapper;

    @Autowired
    private IRiderMessageService riderMessageService;

    @Override
    @Transactional
    public Boolean comsumerOderMessageBusiness(OrderMessageBO orderMessageBO) throws ServiceException {
        if (orderMessageBO != null) {
            String orderNo = orderMessageBO.getOrderNo();
            try {
                if (StringUtils.isEmpty(orderNo)) {
                    throw new BizServiceException(ExceptionDefinition.ORDER_RIDER_INFO_REDUCE);
                }
                if (lockComponent.tryLock(RIDER_ORDER_STATUS_LOCK + orderNo, RIDER_ORDER_LOCK_WAITING_TIME)) {
                    // 检查订单是否已经被分配过，如果已经分配，这个改变已分配的状态为‘已经被更改配送’
                    Wrapper<RiderOrderDO> wrapper = new EntityWrapper<>();
                    wrapper.eq("order_no", orderNo);
                    wrapper.notIn("status", RiderOrderStatusType.COMPLETED.getCode(), RiderOrderStatusType.RIDERERROR.getCode());
                    List<RiderOrderDO> riderOrderDOList = riderOrderMapper.selectList(wrapper);
                    if (riderOrderDOList != null && riderOrderDOList.size() > 0 && !riderOrderDOList.get(0).getRiderId().equals(orderMessageBO.getRiderId())) {
                        // 订单重新分配了配送员，修改就得订单状态；
                        RiderOrderDO riderOrderDO = riderOrderDOList.get(0);
                        riderOrderDO.setGmtUpdate(new Date());
                        riderOrderDO.setStatus(RiderOrderStatusType.RIDERERROR.getCode());
                        riderOrderMapper.updateById(riderOrderDO);
                        // 重新分配的记录
                        return persistenceOrderRiderMessage(orderMessageBO);
                    } else if (riderOrderDOList != null && riderOrderDOList.size() > 0 && riderOrderDOList.get(0).getRiderId().equals(orderMessageBO.getRiderId())) {
                        // 还是原来的订单消息，不做处理
                        // TODO 可能修改了订单信息也要更新
                        return true;
                    } else {
                        // 新的订单配送
                        return persistenceOrderRiderMessage(orderMessageBO);
                    }
                } else {
                    throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_SYSTEM_BUSY);
                }
            } catch (Exception e) {
                logger.error("[配送订单信息] 异常", e);
                throw new BizServiceException(ExceptionDefinition.RIDER_ORDER_UNKNOWN_EXCEPTION);
            } finally {
                lockComponent.release(RIDER_ORDER_STATUS_LOCK + orderNo);
            }
        }
        return false;
    }

    private Boolean persistenceOrderRiderMessage(OrderMessageBO orderMessageBO) throws AdminServiceException {
        RiderOrderDO riderOrderDO = new RiderOrderDO();
        BeanUtils.copyProperties(orderMessageBO, riderOrderDO);
        String payChannel = orderMessageBO.getPayChannel();
        riderOrderDO.setPayChannel(("WX".equals(payChannel) ? "微信" : payChannel));
        Date nowDate = new Date();
        riderOrderDO.setGmtCreate(nowDate);
        riderOrderDO.setGmtUpdate(nowDate);
        riderOrderDO.setStatus(RiderOrderStatusType.WAITING.getCode());
        if (riderOrderMapper.insert(riderOrderDO) > 0) {
            List<RiderSpuBO> riderSpuBOList = orderMessageBO.getRiderSpuBOList();
            if (riderSpuBOList != null && riderSpuBOList.size() > 0) {
                RiderSpuDO riderSpuDO;
                Long riderOrderDOId = riderOrderDO.getId();
                List<RiderSpuDO> riderSpuDOList = new ArrayList<>();
                for (RiderSpuBO riderSpuBO : riderSpuBOList) {
                    riderSpuDO = new RiderSpuDO();
                    BeanUtils.copyProperties(riderSpuBO, riderSpuDO);
                    riderSpuDO.setRiderOrderId(riderOrderDOId);
                    riderSpuDOList.add(riderSpuDO);
                }
                riderSpuMapper.insertBatch(riderSpuDOList);
            }
            return true;
        }
        throw new AdminServiceException(ExceptionDefinition.RIDER_ORDER_MESSAGE_SAVE_ERROR);
    }

    /**
     * 通知订单的配送信息
     *
     * @param orderNo              订单编号
     * @param riderOrderStatusType 配送状态
     * @param riderId              配送员主键ID
     * @param errorMsg             配送异常【如果有】
     * @return 是否成功
     * @throws ServiceException
     */
    @Override
    public Boolean sendRiderMessageBusiness(String orderNo, RiderOrderStatusType riderOrderStatusType, Long riderId, String errorMsg) throws ServiceException {
        if (!StringUtils.isEmpty(orderNo) && riderOrderStatusType != null) {
            RiderMessageBO riderMessageBO = new RiderMessageBO();
            riderMessageBO.setOrderNo(orderNo);
            riderMessageBO.setRiderId(riderId);
            riderMessageBO.setErrorMsg(errorMsg);
            riderMessageBO.setOrderRiderStatus(riderOrderStatusType.getCode());
            return riderMessageService.sendRiderMessageToOrderService(riderMessageBO);
        }
        return false;
    }
}
