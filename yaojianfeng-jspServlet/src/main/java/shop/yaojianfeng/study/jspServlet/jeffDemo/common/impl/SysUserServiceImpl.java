package shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao.SysUserDao;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.SysUser;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.service.SysUserService;

/** 实现类
 * @author yaojianfeng
 */
public class SysUserServiceImpl implements SysUserService {
    private final SysUserDao dao;

    public SysUserServiceImpl(){
        dao = new SysUserDaoImpl() ;
    }

    @Override
    public boolean checkSysUser(SysUser user) {
        SysUser byInfo = dao.getByInfo(user);
        return byInfo!=null;
    }

    @Override
    public int insertOneSysUser(SysUser user) {
        return dao.insert(user);
    }
}
