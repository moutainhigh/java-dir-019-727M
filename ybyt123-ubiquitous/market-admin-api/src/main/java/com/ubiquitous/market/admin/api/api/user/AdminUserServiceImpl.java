package com.ubiquitous.market.admin.api.api.user;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ubiquitous.market.core.exception.AdminServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.UserDO;
import com.ubiquitous.market.data.mapper.UserMapper;
import com.ubiquitous.market.data.model.Page;
import org.apache.commons.codec.digest.Md5Crypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-11
 * Time: 下午7:57
 */
@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean addUser(Long adminId, UserDO user) throws ServiceException {
        if (user == null) {
            throw new AdminServiceException(ExceptionDefinition.USER_INFORMATION_MISSING);
        }
        if (user.getPhone() == null) {
            throw new AdminServiceException(ExceptionDefinition.USER_INFORMATION_MISSING);
        }
        if (userMapper.selectCount(new EntityWrapper<UserDO>().eq("phone", user.getPhone())) > 0) {
            throw new AdminServiceException(ExceptionDefinition.USER_PHONE_ALREADY_EXIST);
        }
        Date now = new Date();
        user.setId(null);
        user.setPassword(Md5Crypt.md5Crypt(user.getPassword().getBytes(), "$1$" + user.getPhone().substring(0, 7)));
        user.setGmtCreate(now);
        user.setGmtUpdate(now);
        return userMapper.insert(user) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteUser(Long adminId, Long id) throws ServiceException {
        return userMapper.delete(new EntityWrapper<UserDO>()
                .eq("id", id)) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateUser(Long adminId, UserDO user) throws ServiceException {
        if (user == null || user.getId() == null) {
            throw new AdminServiceException(ExceptionDefinition.USER_INFORMATION_MISSING);
        }
        if (user.getPhone() == null) {
            throw new AdminServiceException(ExceptionDefinition.USER_INFORMATION_MISSING);
        }
        if (userMapper.selectCount(new EntityWrapper<UserDO>().eq("phone", user.getPhone()).notIn("id", user.getId())) > 0) {
            throw new AdminServiceException(ExceptionDefinition.USER_PHONE_ALREADY_EXIST);
        }
        Date now = new Date();
        user.setGmtUpdate(now);

        if (user.getPassword() != null) {
            user.setPassword(Md5Crypt.md5Crypt(user.getPassword().getBytes(), "$1$" + user.getPhone().substring(0, 7)));
        }
        return userMapper.updateById(user) > 0;
    }

    @Override
    public Boolean updateStatus(Long adminId, Long userId, Integer status) throws ServiceException {
        if (userId == null || status == null || (status != 0 && status != 1)) {
            throw new AdminServiceException(ExceptionDefinition.USER_INFORMATION_MISSING);
        }
        UserDO userDO = new UserDO();
        userDO.setId(userId);
        userDO.setStatus(status);
        userDO.setGmtUpdate(new Date());
        if (userMapper.updateById(userDO) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Page<UserDO> getUser(Long adminId, String phone, String nickname, Integer level, Integer gender, Integer status, Integer pageNo, Integer limit) throws ServiceException {
        Integer count = userMapper.countUser(phone, nickname, level, gender, status);
        List<UserDO> userDOList = userMapper.getUserList(phone, nickname, level, gender, status, limit * (pageNo - 1), limit);
        Page<UserDO> page = new Page<UserDO>(userDOList, pageNo, limit, count);
        return page;
    }
}
