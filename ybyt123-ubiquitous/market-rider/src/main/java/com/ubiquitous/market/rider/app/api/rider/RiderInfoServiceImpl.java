package com.ubiquitous.market.rider.app.api.rider;

import com.alibaba.fastjson.JSONObject;
import com.ubiquitous.market.core.Const;
import com.ubiquitous.market.core.exception.AppServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.core.util.GeneratorUtil;
import com.ubiquitous.market.data.domain.RiderDO;
import com.ubiquitous.market.data.dto.rider.RiderLoginDTO;
import com.ubiquitous.market.data.enums.RiderStatusType;
import com.ubiquitous.market.data.enums.RiderWorkStateType;
import com.ubiquitous.market.data.mapper.RiderMapper;
import com.ubiquitous.market.rider.exception.LauncherExceptionDefinition;
import com.ubiquitous.market.rider.exception.LauncherServiceException;
import org.apache.commons.codec.digest.Md5Crypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @author: fy
 * @date: 2020/02/28 11:29
 **/
@Service
public class RiderInfoServiceImpl implements RiderInfoService {

    @Autowired
    private RiderMapper riderMapper;

    @Autowired
    private StringRedisTemplate userRedisTemplate;

    @Override
    public RiderLoginDTO loginRider(String phone, String password, String ip) throws ServiceException {
        String cryptPassword = Md5Crypt.md5Crypt(password.getBytes(), "$1$" + phone.substring(0, 7));
        RiderDO riderDO = new RiderDO();
        riderDO.setPhone(phone);
        riderDO.setPassword(cryptPassword);
        RiderDO riderDOPo = riderMapper.selectOne(riderDO);
        if (riderDOPo == null) {
            throw new LauncherServiceException(LauncherExceptionDefinition.USER_PHONE_OR_PASSWORD_NOT_CORRECT);
        }
        if (riderDOPo.getState() == RiderStatusType.ABORT.getCode()) {
            throw new LauncherServiceException(LauncherExceptionDefinition.RIDER_CAN_NOT_ACTICE);
        }
        RiderLoginDTO riderLoginDTO = new RiderLoginDTO();
        BeanUtils.copyProperties(riderDOPo, riderLoginDTO);
        String accessToken = GeneratorUtil.genSessionId();
        userRedisTemplate.opsForValue().set(Const.RIDER_REDIS_PREFIX + accessToken, JSONObject.toJSONString(riderLoginDTO));
        riderLoginDTO.setAccessToken(accessToken);
        return riderLoginDTO;
    }

    @Override
    public RiderLoginDTO fixPass(String oldPassword, String newPassword, String ip, Long riderId) throws ServiceException {
        return null;
    }

    @Override
    public String toWorking(Long riderId) throws ServiceException {
        RiderDO riderDO = new RiderDO();
        riderDO.setId(riderId);
        riderDO.setWorkState(RiderWorkStateType.WORKING.getCode());
        if (riderMapper.updateById(riderDO) > 0) {
            return "ok";
        }
        throw new AppServiceException(ExceptionDefinition.RIDER_UPDATE_ERROR);
    }

    @Override
    public String toRest(Long riderId) throws ServiceException {
        RiderDO riderDO = new RiderDO();
        riderDO.setId(riderId);
        riderDO.setWorkState(RiderWorkStateType.REST.getCode());
        if (riderMapper.updateById(riderDO) > 0) {
            return "ok";
        }
        throw new AppServiceException(ExceptionDefinition.RIDER_UPDATE_ERROR);
    }

    @Override
    public RiderLoginDTO getWorkingState(Long riderId) throws ServiceException {
        RiderDO riderDO = riderMapper.selectById(riderId);
        if (riderDO != null) {
            RiderLoginDTO riderLoginDTO = new RiderLoginDTO();
            BeanUtils.copyProperties(riderDO, riderLoginDTO);
            return riderLoginDTO;
        }
        throw new AppServiceException(ExceptionDefinition.RIDER_NOT_EXIST);
    }

}
