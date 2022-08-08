package shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl;

import org.apache.commons.lang3.RandomStringUtils;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao.SysUserDao;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.SysUser;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.utils.MysqlUtil;

import java.sql.*;
import java.util.List;

/**
 * 数据库操作类实现 - 持久层
 * @author yaojianfeng
 */
public class SysUserDaoImpl implements SysUserDao {
    @Override
    public SysUser queryById(String userId) {
        return null;
    }

    @Override
    public SysUser getByInfo(SysUser sysUser) {
        Connection connection = null;
        try {
            connection = MysqlUtil.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Statement statement=null;
        ResultSet resultSet=null;
        String sql = "select * from sys_user where user_name = '"+sysUser.getUserName()+"' and password = '"+sysUser.getPassword()+"'";

        try {
            assert connection != null;
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            if (resultSet.next()){
                //当前需求不需要设置新的属性,所以只用判断resultSet中有数据即可
                return sysUser;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                MysqlUtil.close(connection,statement,null);
//                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public List<SysUser> queryAllByLimit(int offset, int limit) {
        return null;
    }

    @Override
    public List<SysUser> queryAll(SysUser sysUser) {
        return null;
    }

    @Override
    public int insert(SysUser sysUser) {
        //设置主键 32位随机字符串
        sysUser.setUserId(RandomStringUtils.randomAlphabetic(32));
        Connection connection = null;
        try {
            connection = MysqlUtil.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PreparedStatement preparedStatement=null;

        try {
            assert connection != null;
            preparedStatement=  connection.prepareStatement("insert into sys_user (user_id,user_name,password) values (?,?,?)");
            preparedStatement.setString(1,sysUser.getUserId());
            preparedStatement.setString(2,sysUser.getUserName());
            preparedStatement.setString(3,sysUser.getPassword());
            return preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
                MysqlUtil.close(connection,null,null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public int update(SysUser sysUser) {
        return 0;
    }

    @Override
    public int deleteById(String userId) {
        return 0;
    }
}
