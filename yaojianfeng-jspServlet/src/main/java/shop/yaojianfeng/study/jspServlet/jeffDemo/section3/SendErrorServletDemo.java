package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 发送状态码 演示文档
 * @author yaojianfeng
 */
@WebServlet("/section3/sendError")
public class SendErrorServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  {
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter writer = null;
        try {
            writer = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.println("当前页面正在响应一个错误");
        try {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,"谢谢谢谢谢.......");
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } catch (IOException e) {
            writer.println(e.getMessage());
        }
    }
}
