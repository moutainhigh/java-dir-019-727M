package com.ubiquitous.market.app.api.quartz;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ubiquitous.market.biz.service.order.OrderBizService;
import com.ubiquitous.market.core.exception.AdminServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.data.component.LockComponent;
import com.ubiquitous.market.data.domain.GroupShopDO;
import com.ubiquitous.market.data.domain.OrderDO;
import com.ubiquitous.market.data.domain.SpuDO;
import com.ubiquitous.market.data.enums.GroupShopAutomaticRefundType;
import com.ubiquitous.market.data.enums.OrderStatusType;
import com.ubiquitous.market.data.enums.StatusType;
import com.ubiquitous.market.data.mapper.GroupShopMapper;
import com.ubiquitous.market.data.mapper.OrderMapper;
import com.ubiquitous.market.data.mapper.SpuMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by admin on 2019/7/21.
 */
@Component
@EnableScheduling
public class CheckQuartz {

    private static final Logger logger = LoggerFactory.getLogger(CheckQuartz.class);
    private static final String ORDER_STATUS_LOCK = "ORDER_STATUS_QUARTZ_LOCK";
    private static final String GROUP_SHOP_START_LOCK = "GROUP_SHOP_START_LOCK";
    private static final String GROUP_SHOP_END_LOCK = "GROUP_SHOP_END_LOCK";
    private static final String GROUP_SHOP_LOCK_LOCK = "GROUP_SHOP_LOCK_LOCK";
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderBizService orderBizService;
    @Autowired
    private GroupShopMapper groupShopMapper;
    @Autowired
    private SpuMapper spuMapper;
    @Autowired
    private LockComponent lockComponent;
    @Autowired
    private TransactionTemplate transactionTemplate;

    /**
     * ????????????????????????
     */
    @Scheduled(cron = "0 * * * * ?")
    public void checkOrderStatus() {
        if (lockComponent.tryLock(ORDER_STATUS_LOCK, 15)) {
            try {
                Date now = new Date();
                List<String> nos = orderMapper.selectExpireOrderNos(OrderStatusType.UNPAY.getCode(), new Date(now.getTime() - 1000l * 60 * 15));
                if (!CollectionUtils.isEmpty(nos)) {
                    nos.forEach(no -> {
                        try {
                            OrderDO updateOrderDO = new OrderDO();
                            updateOrderDO.setStatus(OrderStatusType.CANCELED_SYS.getCode());
                            updateOrderDO.setGmtUpdate(now);
                            orderBizService.changeOrderStatus(no, OrderStatusType.UNPAY.getCode(), updateOrderDO);
                        } catch (Exception e) {
                            logger.error("[???????????????] ??????", e);
                        }
                    });
                }
                //15??????????????????
                long minutes = (now.getTime() / (1000 * 60));
                if (minutes % 15 == 0) {
                    List<String> waitConfirmNos = orderMapper.selectExpireOrderNos(OrderStatusType.WAIT_CONFIRM.getCode(), new Date(now.getTime() - 1000l * 60 * 60 * 24 * 7));
                    waitConfirmNos.forEach(item -> {
                        try {
                            OrderDO updateOrderDO = new OrderDO();
                            updateOrderDO.setStatus(OrderStatusType.WAIT_APPRAISE.getCode());
                            updateOrderDO.setGmtUpdate(now);
                            orderBizService.changeOrderStatus(item, OrderStatusType.WAIT_CONFIRM.getCode(), updateOrderDO);
                        } catch (Exception e) {
                            logger.error("[???????????????] ??????", e);
                        }
                    });
                }
            } catch (Exception e) {
                logger.error("[??????????????????????????????] ??????", e);
            } finally {
                lockComponent.release(ORDER_STATUS_LOCK);
            }
        }
    }

    /**
     * ??????60s?????????,??????????????????????????????,????????????
     */
    @Scheduled(fixedRate = 60000)
    @Transactional(rollbackFor = Exception.class)
    public void groupShopStart() throws Exception {
        if (lockComponent.tryLock(GROUP_SHOP_START_LOCK, 30)) {
            try {
                Date now = new Date();
                /**
                 * 1. ?????? ?????????????????????????????????
                 */
                // 1.1 ?????????????????????,??????????????????????????????
                List<GroupShopDO> groupShopDOList = groupShopMapper.selectList(new EntityWrapper<GroupShopDO>()
                        .le("gmt_start", now).and()
                        .gt("gmt_end", now).and()
                        .eq("status", StatusType.LOCK.getCode()));
                if (groupShopDOList != null) {
                    for (GroupShopDO groupShopDO : groupShopDOList) {
                        groupShopDO.setGmtUpdate(now);
                        groupShopDO.setStatus(StatusType.ACTIVE.getCode());
                        SpuDO spuDO = spuMapper.selectById(groupShopDO.getSpuId());
                        if (spuDO == null) {
                            throw new AdminServiceException(ExceptionDefinition.GROUP_SHOP_SPU_NO_EXITS);
                        }

                        // 1.2 ?????????????????????????????????
                        if (spuDO.getStatus().equals(StatusType.ACTIVE.getCode())) {
                            if (groupShopMapper.updateById(groupShopDO) <= 0) {
                                throw new AdminServiceException(ExceptionDefinition.GROUP_SHOP_SPU_UPDATE_SQL_QUERY_ERROR);
                            }
                        }
                    }
                }
            } catch (Exception e) {
                logger.error("[???????????? ????????????] ??????", e);
                throw e;
            } finally {
                lockComponent.release(GROUP_SHOP_START_LOCK);
            }
        }


    }

    @Scheduled(fixedRate = 60000)
    @Transactional(rollbackFor = Exception.class)
    public void groupShopEnd() throws Exception {
        if (lockComponent.tryLock(GROUP_SHOP_END_LOCK, 30)) {
            try {
                Date now = new Date();
                /**
                 * 2. ?????? ?????????????????????????????????,?????????????????????????????????
                 */
                Wrapper<GroupShopDO> wrapper = new EntityWrapper<GroupShopDO>()
                        .eq("status", StatusType.ACTIVE.getCode())
                        .andNew()
                        .gt("gmt_start", now)
                        .or()
                        .le("gmt_end", now);
                List<GroupShopDO> lockGroupShopDOList = groupShopMapper.selectList(wrapper);
                // 2.2 ???????????????????????????????????????????????????????????????,?????????????????????????????????????????????????????????,????????????????????????????????????????????????????????????
                if (!CollectionUtils.isEmpty(lockGroupShopDOList)) {
                    // 2.1 ???????????????????????????.
                    GroupShopDO lockGroupShopDO = new GroupShopDO();
                    lockGroupShopDO.setStatus(StatusType.LOCK.getCode());
                    lockGroupShopDO.setGmtUpdate(now);
                    groupShopMapper.update(lockGroupShopDO, wrapper);
                    for (GroupShopDO groupShopDO : lockGroupShopDOList) {
                        // 2.2.1???????????????????????????
                        List<OrderDO> lockOrderList = orderMapper.selectList(
                                new EntityWrapper<OrderDO>()
                                        .eq("group_shop_id", groupShopDO.getId())
                                        .eq("status", OrderStatusType.GROUP_SHOP_WAIT.getCode()));

                        if (CollectionUtils.isEmpty(lockOrderList)) {
                            continue;
                        }

                        if (groupShopDO.getAutomaticRefund() == GroupShopAutomaticRefundType.YES.getCode() && groupShopDO.getAlreadyBuyNumber().compareTo(groupShopDO.getMinimumNumber()) < 0) {
                            // 2.2.2.1.??????
                            logger.info("[????????????] ???????????? groupShopId:" + groupShopDO.getId());
                            for (OrderDO orderDO : lockOrderList) {
                                transactionTemplate.execute(new TransactionCallbackWithoutResult() {
                                    @Override
                                    protected void doInTransactionWithoutResult(TransactionStatus transactionStatus) {
                                        try {
                                            //????????????????????????????????????????????????????????????????????????
                                            orderBizService.groupShopStatusRefund(orderDO.getOrderNo());
                                            logger.info("[??????????????????] ?????? orderNo:" + orderDO.getOrderNo());
                                        } catch (Exception e) {
                                            logger.error("[??????????????????] ?????? orderNo:" + orderDO.getOrderNo() + "; errmsg:" + e.getMessage());
                                            transactionStatus.setRollbackOnly();
                                        }
                                    }
                                });
                            }
                        } else {
                            logger.info("[????????????] ???????????? groupShopId:" + groupShopDO.getId());
                            // 2.2.2.2 ?????????????????????????????? (?????????????????????)
                            List<Long> collect = lockOrderList.stream().map(s -> s.getId()).collect(Collectors.toList());
                            OrderDO orderDO = new OrderDO();
                            orderDO.setStatus(OrderStatusType.WAIT_STOCK.getCode());
                            orderMapper.update(orderDO, (
                                    new EntityWrapper<OrderDO>()
                                            .in("id", collect)
                                            .eq("status", OrderStatusType.GROUP_SHOP_WAIT.getCode())));
                        }

                    }
                }
            } catch (Exception e) {
                logger.error("[???????????? ????????????] ??????", e);
                throw e;
            } finally {
                lockComponent.release(GROUP_SHOP_END_LOCK);
            }
        }

    }

    @Scheduled(fixedRate = 60000)
    @Transactional(rollbackFor = Exception.class)
    public void groupShopLock() throws Exception {
        if (lockComponent.tryLock(GROUP_SHOP_LOCK_LOCK, 30)) {
            try {
                Date now = new Date();
                /**
                 * 3 ?????? ???????????????????????????????????????
                 */
                EntityWrapper<GroupShopDO> groupShopDOEntityWrapper = new EntityWrapper<>();

                // 3.1 ???????????????????????????????????????
                groupShopDOEntityWrapper.eq("status", StatusType.ACTIVE.getCode())
                        .and()
                        .le("gmt_start", now)
                        .and()
                        .gt("gmt_end", now);
                List<GroupShopDO> groupShopDOS = groupShopMapper.selectList(groupShopDOEntityWrapper);
                if (!CollectionUtils.isEmpty(groupShopDOS)) {
                    List<Long> spuIdList = groupShopDOS.stream().map(t -> t.getSpuId()).collect(Collectors.toList());

                    // 3.2 ????????????????????????spuID,???????????????????????????
                    List<SpuDO> spuDOS = spuMapper.selectList(new EntityWrapper<SpuDO>().in("id", spuIdList).eq("status", StatusType.LOCK.getCode()));
                    if (!CollectionUtils.isEmpty(spuDOS)) {
                        List<Long> collect = spuDOS.stream().map(t -> t.getId()).collect(Collectors.toList());
                        GroupShopDO groupShopDO = new GroupShopDO();
                        groupShopDO.setStatus(StatusType.LOCK.getCode());
                        groupShopDO.setGmtUpdate(now);
                        groupShopMapper.update(groupShopDO, (new EntityWrapper<GroupShopDO>().in("spu_id", collect)));
                    }
                }
            } catch (Exception e) {
                logger.error("[???????????? ????????????] ??????", e);
                throw e;
            } finally {
                lockComponent.release(GROUP_SHOP_LOCK_LOCK);
            }
        }

    }

}
