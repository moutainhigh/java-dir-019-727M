package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * setStatus 演示文档
 *
 * @author yaojianfeng
 */
@WebServlet("/section3/setStatus")
public class SetStatusServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter writer = null;
        try {
            writer = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        assert writer != null;
        writer.println(
                "当前页面使用setStatus设置了响应码,请查看开发者工具下的网络请求"
        );
    }
}
