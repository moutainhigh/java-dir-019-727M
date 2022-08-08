package shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.MyPage;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;

import java.sql.ResultSet;

/**
 * StudentInfo 持久层接口
 * @author yaojianfeng
 */
public interface StudentInfoDao {
    /**
     * 列表查询
     * @param studentInfo
     * @return
     */
    ResultSet queryStudentInfoList(StudentInfo studentInfo);

    /**
     * 分页查询
     * @param studentInfoMyPage
     * @param submitClassBatch
     * @return
     */
    ResultSet queryStudentInfoByPage(MyPage<StudentInfo> studentInfoMyPage,String submitClassBatch);
}
