package shop.yaojianfeng.study.jspServlet.class22.servlet.day20211112;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

/**
 * 第一章练习题演示文档
 *
 * @author yaojianfeng
 */
@WebServlet("/showHello22")
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
        resp.setCharacterEncoding("utf-8");
        PrintWriter pw = resp.getWriter();

        int hour = LocalDateTime.now().getHour();
        if (hour < 12) {
            pw.println("早上好!");
        } else if (hour < 16) {
            pw.println("下午好!");
        } else if (hour < 20) {
            pw.println("晚上好!");
        } else {
            pw.println("晚安!");
        }
        String contextPath = req.getContextPath();
        pw.println("<br><br><a href= "+contextPath+">首页</a>");
        //关闭流对象
        pw.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost hello world... ");
        String myName = req.getParameter("myName");
        System.out.println(myName);

    }
}
