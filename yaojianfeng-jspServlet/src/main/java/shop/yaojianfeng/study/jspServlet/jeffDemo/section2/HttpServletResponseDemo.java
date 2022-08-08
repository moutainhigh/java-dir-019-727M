package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * HttpServletResponse 演示文档
 *
 * @author yaojianfeng
 */
@WebServlet("/httpServletResponseDemo")
public class HttpServletResponseDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
//        resp.setCharacterEncoding("utf-8");
        resp.setHeader("hello", "world");
        resp.getWriter().println(
                "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "    <title>HttpServletResponse演示文档</title>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<h1> 这个是响应页面,请查看http请求...</h1>\n" +
                        "</body>\n" +
                        "</html>"
        );
    }
}
