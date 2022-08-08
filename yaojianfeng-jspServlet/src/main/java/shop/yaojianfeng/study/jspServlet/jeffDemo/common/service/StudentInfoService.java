package shop.yaojianfeng.study.jspServlet.jeffDemo.common.service;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.MyPage;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;

import java.util.ArrayList;
import java.util.Map;

/**
 * StudentInfo 业务层接口
 * @author yaojianfeng
 */
public interface StudentInfoService {
    /**
     * 查询学生信息 并封装在一个ArrayList中
     * @param studentInfo
     * @return
     */
    ArrayList<StudentInfo> queryStudentInfoList(StudentInfo studentInfo);


    /**
     * 分页查询学生信息
     * @param studentInfoMyPage
     * @param submitClassBatch
     * @return
     */
    MyPage<StudentInfo> queryStudentInfoByPage(MyPage<StudentInfo> studentInfoMyPage,String submitClassBatch);



}
