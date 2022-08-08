package shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl;


import shop.yaojianfeng.study.jspServlet.jeffDemo.common.dao.StudentInfoDao;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.MyPage;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.service.StudentInfoService;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

/**
 * StudentInfo 业务层实现类
 *
 * @author yaojianfeng
 */
public class StudentInfoServiceImpl implements StudentInfoService {
    private final StudentInfoDao dao;

    public StudentInfoServiceImpl() {
        this.dao = new StudentInfoDaoImpl();
    }

    @Override
    public ArrayList<StudentInfo> queryStudentInfoList(StudentInfo studentInfo) {
        ResultSet resultSet = dao.queryStudentInfoList(studentInfo);

        //构建传输数据模型
        return getStudentInfoList(resultSet);
    }

    @Override
    public MyPage<StudentInfo> queryStudentInfoByPage(MyPage<StudentInfo> studentInfoMyPage,String submitClassBatch) {
        ResultSet resultSet = dao.queryStudentInfoByPage(studentInfoMyPage,submitClassBatch);

        ArrayList<StudentInfo> studentInfoList = getStudentInfoList(resultSet);
        studentInfoMyPage.setPageDataList(studentInfoList);

        return studentInfoMyPage;
    }



    private ArrayList<StudentInfo> getStudentInfoList(ResultSet resultSet){
        ArrayList<StudentInfo> studentInfos = new ArrayList<>();
        //构建传输数据模型
        try {
            while (resultSet.next()) {
                //创建学生信息对象实体类
                StudentInfo studentInfoTemp = new StudentInfo();
                //封装对象
                studentInfoTemp.setStudentId(resultSet.getString("student_id"));
                studentInfoTemp.setChineseName(resultSet.getString("chinese_name"));
                studentInfoTemp.setClassBatch(resultSet.getString("class_batch"));
                studentInfoTemp.setGender(resultSet.getString("gender"));
                studentInfoTemp.setEnglishName(resultSet.getString("english_name"));
                studentInfoTemp.setPhoneNum(resultSet.getString("phone_num"));
                studentInfoTemp.setEmail(resultSet.getString("email"));
                //添加到集合中去
                studentInfos.add(studentInfoTemp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentInfos;
    }

}
