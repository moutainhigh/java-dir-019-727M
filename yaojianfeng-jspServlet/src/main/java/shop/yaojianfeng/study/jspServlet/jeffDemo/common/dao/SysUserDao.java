package shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.SysUser;

import java.util.List;

/**
 * 系统用户表(SysUser)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-12 16:31:20
 */
public interface SysUserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    SysUser queryById(String userId);

    /**
     * 通过用户名和密码,获取实体类数据信息
     * @param sysUser
     * @return
     */
    SysUser getByInfo(SysUser sysUser);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<SysUser> queryAllByLimit( int offset,  int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sysUser 实例对象
     * @return 对象列表
     */
    List<SysUser> queryAll(SysUser sysUser);

    /**
     * 新增数据
     *
     * @param sysUser 实例对象
     * @return 影响行数
     */
    int insert(SysUser sysUser);


    /**
     * 修改数据
     *
     * @param sysUser 实例对象
     * @return 影响行数
     */
    int update(SysUser sysUser);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(String userId);

}

