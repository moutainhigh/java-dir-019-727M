package shop.yaojianfeng.study.jspServlet.jeffDemo.common.utils;

import java.sql.*;
import java.util.ResourceBundle;

/**
 * mysql数据库操作辅助类
 *
 *
 * @author yaojianfeng
 */
public class MysqlUtil {

    private static final String URL;
    private static final String DRIVER_NAME;
    private static final String USERNAME;
    private static final String PASSWORD;

    static {
        ResourceBundle bundle = ResourceBundle.getBundle("jdbc");
        URL = bundle.getString("url");
        DRIVER_NAME = bundle.getString("driverName");
        USERNAME = bundle.getString("username");
        PASSWORD = bundle.getString("password");

        //注册Mysql数据库驱动
        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    /**
     * 获取连接对象
     * 不在工具类中进行try...catch 而是抛出异常给调用者 方便问题定位
     * @return
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    /**
     * 关闭资源 遵循从小到大依次关闭
     * 该方法要在finally语句块中调用
     * 不在工具类中进行try...catch 而是抛出异常给调用者 方便问题定位
     */
    public static void close(Connection connection, Statement stmt,PreparedStatement pstmt ) throws SQLException {
        /*if (resultSet != null && !resultSet.isClosed()) {
            resultSet.close();
        }*/

        if (stmt != null && !stmt.isClosed()) {
            stmt.close();
        }
        if (pstmt != null && !pstmt.isClosed()) {
            pstmt.close();
        }

        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}



