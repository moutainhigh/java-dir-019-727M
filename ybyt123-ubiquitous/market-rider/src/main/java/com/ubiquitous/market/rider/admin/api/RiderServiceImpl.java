package com.ubiquitous.market.rider.admin.api;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ubiquitous.market.core.exception.AdminServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.RiderCycleDO;
import com.ubiquitous.market.data.domain.RiderDO;
import com.ubiquitous.market.data.dto.RiderCycleDTO;
import com.ubiquitous.market.data.dto.rider.RiderDTO;
import com.ubiquitous.market.data.dto.rider.RiderMapDTO;
import com.ubiquitous.market.data.enums.RiderStatusType;
import com.ubiquitous.market.data.enums.RiderWeekStatusType;
import com.ubiquitous.market.data.mapper.RiderCycleMapper;
import com.ubiquitous.market.data.mapper.RiderMapper;
import com.ubiquitous.market.data.model.Page;
import org.apache.commons.codec.digest.Md5Crypt;
import org.apache.commons.collections.CollectionUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class RiderServiceImpl implements RiderService {

    @Autowired
    private RiderMapper riderMapper;

    @Autowired
    private RiderCycleMapper riderCycleMapper;

    // 初始密码
    private static final String ININT_PASSWORD = "123456";

    @Override
    public Page<RiderDO> list(Integer state, Integer workState, String name, String phone, Long storageId, Integer page, Integer limit, Long adminId) throws ServiceException {
        Wrapper<RiderDO> wrapper = new EntityWrapper<>();
        if (state != null) {
            wrapper.eq("state", state);
        }
        if (workState != null) {
            wrapper.eq("work_state", workState);
        }
        if (!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(phone)) {
            wrapper.like("phone", phone);
        }
        if (!StringUtils.isEmpty(storageId)) {
            wrapper.eq("storage_id", storageId);
        }
        List<RiderDO> riderDOS = riderMapper.selectPage(new RowBounds((page - 1) * limit, limit), wrapper);
        Integer count = riderMapper.selectCount(wrapper);
        return new Page<>(riderDOS, page, limit, count);
    }

    @Override
    public List<RiderDO> getRiderByStorageId(Long storageId, Long adminId) {
        Wrapper<RiderDO> wrapper = new EntityWrapper<>();
        if (storageId != null) {
            wrapper.eq("storage_id", storageId);
        }
        wrapper.eq("state", RiderStatusType.NOMRAL.getCode());
        wrapper.eq("work_state", RiderWeekStatusType.BUSINESS.getCode());
        return riderMapper.selectList(wrapper);
    }

    @Override
    public RiderDTO getDetailById(Long id, Long adminId) throws ServiceException {
        RiderDO riderDO = riderMapper.selectById(id);
        if (riderDO != null) {
            RiderDTO riderDTO = new RiderDTO();
            BeanUtils.copyProperties(riderDO, riderDTO);
            Wrapper<RiderCycleDO> wrapper = new EntityWrapper<>();
            wrapper.eq("rider_id", riderDO.getId());
            List<RiderCycleDO> riderCycleDOS = riderCycleMapper.selectList(wrapper);
            if (riderCycleDOS != null && riderCycleDOS.size() > 0) {
                riderDTO.setWeekNumberIds(riderCycleDOS.stream().map(RiderCycleDO::getWeekNumber).collect(Collectors.toList()));
            }
            return riderDTO;
        }
        throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
    }

    @Override
    @Transactional
    public RiderDO create(RiderCycleDTO riderCycleDTO, Long adminId) throws ServiceException {
        String riderCycleDTOPhone = riderCycleDTO.getPhone();
        if (StringUtils.isEmpty(riderCycleDTOPhone)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_PHONE_MUST_INOUT);
        }
        EntityWrapper<RiderDO> wrapper = new EntityWrapper<>();
        wrapper.eq("phone", riderCycleDTOPhone);
        Integer phoneCount = riderMapper.selectCount(wrapper);
        if (phoneCount > 0) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_PHONE_HAVED_EXIST);
        }
        RiderDO riderDO = new RiderDO();
        BeanUtils.copyProperties(riderCycleDTO, riderDO);
        String cryptPassword = Md5Crypt.md5Crypt(ININT_PASSWORD.getBytes(), "$1$" + riderCycleDTO.getPhone().substring(0, 7));
        riderDO.setPassword(cryptPassword);
        riderDO.setState(RiderStatusType.NOMRAL.getCode());
        riderDO.setWorkState(RiderWeekStatusType.REST.getCode());
        riderDO.setGmtCreateUserId(adminId);
        riderDO.setGmtUpdateUserId(adminId);
        Date now = new Date();
        riderDO.setGmtCreate(now);
        riderDO.setGmtUpdate(now);
        if (riderMapper.insert(riderDO) > 0) {
            List<Integer> weekNumberIds = riderCycleDTO.getWeekNumberIds();
            if (weekNumberIds != null && weekNumberIds.size() > 0) {
                Long riderDOId = riderDO.getId();
                RiderCycleDO riderCycleDO;
                List<RiderCycleDO> riderCycleDOList = new ArrayList<>();
                for (Integer weekNumber : weekNumberIds) {
                    riderCycleDO = new RiderCycleDO();
                    riderCycleDO.setRiderId(riderDOId);
                    riderCycleDO.setWeekNumber(weekNumber);
                    riderCycleDOList.add(riderCycleDO);
                }
                riderCycleMapper.insertBatch(riderCycleDOList);
            }
            riderDO.setPassword(null);
            return riderDO;
        }
        throw new AdminServiceException(ExceptionDefinition.ADMIN_UNKNOWN_EXCEPTION);
    }

    @Override
    @Transactional
    public RiderDO update(RiderCycleDTO riderCycleDTO, Long adminId) throws ServiceException {
        String riderCycleDTOPhone = riderCycleDTO.getPhone();
        if (StringUtils.isEmpty(riderCycleDTOPhone)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_PHONE_MUST_INOUT);
        }
        EntityWrapper<RiderDO> wrapperPhone = new EntityWrapper<>();
        wrapperPhone.eq("phone", riderCycleDTO.getPhone());
        List<RiderDO> riderDOS = riderMapper.selectList(wrapperPhone);
        if (riderDOS != null && riderDOS.size() > 1) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_PHONE_HAVED_EXIST);
        } else if (riderDOS != null && riderDOS.size() == 1 && !riderDOS.get(0).getId().equals(riderCycleDTO.getId())) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_PHONE_HAVED_EXIST);
        }
        RiderDO riderDO = new RiderDO();
        BeanUtils.copyProperties(riderCycleDTO, riderDO);
        riderDO.setGmtUpdate(new Date());
        riderDO.setGmtUpdateUserId(adminId);
        if (riderMapper.updateById(riderDO) > 0) {
            Long riderDOId = riderCycleDTO.getId();
            EntityWrapper<RiderCycleDO> wrapper = new EntityWrapper<>();
            wrapper.eq("rider_id", riderDOId);
            riderCycleMapper.delete(wrapper);
            List<Integer> weekNumberIds = riderCycleDTO.getWeekNumberIds();
            if (weekNumberIds != null && weekNumberIds.size() > 0) {
                RiderCycleDO riderCycleDO;
                List<RiderCycleDO> riderCycleDOList = new ArrayList<>();
                for (Integer weekNumber : weekNumberIds) {
                    riderCycleDO = new RiderCycleDO();
                    riderCycleDO.setRiderId(riderDOId);
                    riderCycleDO.setWeekNumber(weekNumber);
                    riderCycleDOList.add(riderCycleDO);
                }
                riderCycleMapper.insertBatch(riderCycleDOList);
            }
            return riderDO;
        }
        throw new AdminServiceException(ExceptionDefinition.ADMIN_UNKNOWN_EXCEPTION);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String updateStateToNomral(Long adminId, String idsJson) throws ServiceException {
        List<Long> ids = JSONObject.parseArray(idsJson, Long.class);
        if (CollectionUtils.isEmpty(ids)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        if (riderMapper.batchUpdateState(ids, RiderStatusType.NOMRAL.getCode()) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        return "ok";
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String updateStateToAbort(Long adminId, String idsJson) throws ServiceException {
        List<Long> ids = JSONObject.parseArray(idsJson, Long.class);
        if (CollectionUtils.isEmpty(ids)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        if (riderMapper.batchUpdateState(ids, RiderStatusType.ABORT.getCode()) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        return "ok";
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String updateBusinessWorkState(Long adminId, String idsJson) throws ServiceException {
        List<Long> ids = JSONObject.parseArray(idsJson, Long.class);
        if (CollectionUtils.isEmpty(ids)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        if (riderMapper.batchUpdateWeekState(ids, RiderWeekStatusType.BUSINESS.getCode()) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        return "ok";
    }

    @Override
    public String updateBusinessStateToRest(Long adminId, String idsJson) throws ServiceException {
        List<Long> ids = JSONObject.parseArray(idsJson, Long.class);
        if (CollectionUtils.isEmpty(ids)) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        if (riderMapper.batchUpdateWeekState(ids, RiderWeekStatusType.REST.getCode()) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
        }
        return "ok";
    }

    @Override
    public List<RiderMapDTO> options(Long storageId, Long adminId) {
        Wrapper<RiderDO> wrapper = new EntityWrapper<>();
        if (storageId != null) {
            wrapper.eq("storage_id", storageId);
        }
        List<RiderDO> riderDOS = riderMapper.selectList(wrapper);
        if (riderDOS != null && riderDOS.size() > 0) {
            RiderMapDTO riderMapDTO;
            List<RiderMapDTO> riderMapDTOList = new ArrayList<>();
            for (RiderDO riderDO : riderDOS) {
                riderMapDTO = new RiderMapDTO();
                BeanUtils.copyProperties(riderDO, riderMapDTO);
                riderMapDTOList.add(riderMapDTO);
            }
            return riderMapDTOList;
        }
        return null;
    }


}
