package shop.yaojianfeng.study.jspServlet.jeffDemo.section1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Enumeration;

/**
 * 第一章练习题演示文档
 *
 * @author yaojianfeng
 */
@WebServlet("/showHello")
public class ShowHello extends HttpServlet {


    /**
     * 显示欢迎语 并且能跳转到首页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet hello world...");

        resp.setContentType("text/html");
//        resp.setCharacterEncoding("utf-8");
        resp.setDateHeader("Expires",System.currentTimeMillis()+10000);
        PrintWriter pw = resp.getWriter();

        int hour = LocalDateTime.now().getHour();
        if (hour < 12) {
            pw.println("早上好!现在时间是:"+LocalDateTime.now());
        } else if (hour < 16) {
            pw.println("下午好!现在时间是:"+LocalDateTime.now());
        } else if (hour < 20) {
            pw.println("晚上好!现在时间是:"+LocalDateTime.now());
        } else {
            pw.println("晚安!现在时间是:"+LocalDateTime.now());
        }
        String contextPath = req.getContextPath();
        pw.println("<br><br><a href= /"+contextPath+">首页</a>");

        //关闭流对象
        pw.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost hello world... ");
        String myName = req.getParameter("myName");
        String[] values = req.getParameterValues("hobby");
        System.out.println(myName);
        System.out.println(values.toString());
        Enumeration<String> parameterNames = req.getParameterNames();
        while (parameterNames.hasMoreElements()){
            System.out.println(parameterNames.nextElement());
        }



    }
}
