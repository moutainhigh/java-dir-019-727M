package shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl;


import shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao.StudentInfoDao;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.MyPage;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.utils.MysqlUtil;

import java.sql.*;

/**
 * StudentInfo 持久层实现类 (单线程低并发)
 *
 * @author yaojianfeng
 */
public class StudentInfoDaoImpl implements StudentInfoDao {
    private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;


    @Override
    public ResultSet queryStudentInfoList(StudentInfo studentInfo) {
        try {
            connection  = MysqlUtil.getConnection();
            statement = connection.createStatement();
            //模拟动态sql
            String sql = "select * from student_info_20 where 1 = 1 ";
            if (null!=studentInfo.getClassBatch()&&!studentInfo.getClassBatch().isEmpty()){
                sql = sql + "and class_batch = '"+studentInfo.getClassBatch()+"'";
            }
            if (null!=studentInfo.getChineseName()&&!studentInfo.getChineseName().isEmpty()){
                sql = sql + "and chinese_name = '"+studentInfo.getChineseName()+"'";
            }
            if (null!=studentInfo.getGender()&&!studentInfo.getGender().isEmpty()){
                sql = sql + "and gender = '"+studentInfo.getGender()+"'";
            }
            ResultSet resultSet = statement.executeQuery(sql);
            return resultSet;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ResultSet queryStudentInfoByPage(MyPage<StudentInfo> studentInfoMyPage,String submitClassBatch) {
        //构建sql
        String sql = "select * from student_info_20 where 1=1 ";
        int startNum = studentInfoMyPage.getPageNumber() * studentInfoMyPage.getPageSize();
        int endNum = studentInfoMyPage.getPageSize();
        if (null!=submitClassBatch&&!submitClassBatch.isEmpty()){
            sql = sql + " and class_batch = '"+submitClassBatch +"'";
        }
        sql = sql + " limit "+startNum+", "+endNum ;


        ResultSet resultSet=null;
        try {
            Connection connection = MysqlUtil.getConnection();
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //执行sql
        return resultSet;
    }

    public void close(){
        try {
            MysqlUtil.close(connection,statement,preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
