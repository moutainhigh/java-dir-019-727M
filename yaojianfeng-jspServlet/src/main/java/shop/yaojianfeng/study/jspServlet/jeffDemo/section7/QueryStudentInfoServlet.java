package shop.yaojianfeng.study.jspServlet.jeffDemo.section7;


import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl.StudentInfoServiceImpl;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.service.StudentInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 查询学生信息列表
 *
 * @author yaojianfeng
 */
@WebServlet("/section7/queryStudentInfoServlet")
public class QueryStudentInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String classBatch = req.getParameter("classBatch");
        String chineseName = req.getParameter("chineseName");
        String gender = req.getParameter("gender");

        //构建操作对象
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setClassBatch(classBatch);
        studentInfo.setChineseName(chineseName);
        studentInfo.setGender(gender);
        StudentInfoService service = new StudentInfoServiceImpl();

        //调用service层方法(查询总条数)
        ArrayList<StudentInfo> studentInfoList = service.queryStudentInfoList(studentInfo);

        //处理结果集以及页面转发

        //后台逻辑分页(非物理分页)
        List<StudentInfo> pageList = studentInfoList.stream().filter(item -> studentInfoList.indexOf(item) < 10).collect(Collectors.toList());
        int size = studentInfoList.size();

        req.setAttribute("classBatch",classBatch);
        req.setAttribute("total",size);
        req.setAttribute("pageList",pageList);
        req.setAttribute("pageNum",0);
        req.setAttribute("pageSize",10);
        //重定向后数据不在一次请求中,el无法取到值
//        resp.sendRedirect(req.getContextPath()+"/jeff/section7/selectStudentInfoList.jsp");
        req.getRequestDispatcher(req.getContextPath()+"/jeff/section7/selectStudentInfoList.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
