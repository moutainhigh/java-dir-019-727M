package shop.yaojianfeng.study.jspServlet.jeffDemo.section7;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.MyPage;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentInfo;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl.StudentInfoServiceImpl;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.service.StudentInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**查询学生信息分页数据控制器
 * @author yaojianfeng
 */
@WebServlet("/section7/queryPage")
public class QueryStudentInfoPageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String pageSize = req.getParameter("pageSize");
        String total = req.getParameter("total");
        String submitPageNum = req.getParameter("submitPageNum");
        String submitClassBatch = req.getParameter("submitClassBatch");
        int totalNum = Integer.parseInt(total);
        int pageSizeNum = Integer.parseInt(pageSize);
        int pageNum = (int) Float.parseFloat(submitPageNum);
        int  pageTotalNum=0;
        if ( totalNum % pageSizeNum == 0 ){
            pageTotalNum = totalNum/pageSizeNum;
        }else {
            pageTotalNum = totalNum/pageSizeNum +1;
        }
        //重新构建参数
        MyPage<StudentInfo> studentInfoMyPage = new MyPage<>();
        studentInfoMyPage.setPageSize(pageSizeNum);
        studentInfoMyPage.setPageNumber(pageNum);
        studentInfoMyPage.setTotalCount(totalNum);
        //调用service
        StudentInfoService service = new StudentInfoServiceImpl();
        MyPage<StudentInfo> pageList = service.queryStudentInfoByPage(studentInfoMyPage,submitClassBatch);


        //处理结果集
        req.setAttribute("page",pageList);
        req.setAttribute("classBatch",submitClassBatch);
        req.setAttribute("pageTotalNum",pageTotalNum);
        req.getRequestDispatcher(req.getContextPath()+"/jeff/section7/studentInfoByPage.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
