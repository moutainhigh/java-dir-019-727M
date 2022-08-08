package shop.yaojianfeng.study.jspServlet.jeffDemo.common.service;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.SysUser;

/**
 * 业务层接口
 *
 * @author yaojianfeng
 */
public interface SysUserService {

    /**
     * 登录校验方法
     *
     * @param user
     * @return
     */
    boolean checkSysUser(SysUser user);

    /**
     * 向系统用户表中插入数据
     *
     * @param user
     * @return
     */
    int insertOneSysUser(SysUser user);
}
