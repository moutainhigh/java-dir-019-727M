package shop.yaojianfeng.study.jspServlet.class22.servlet.day20211112;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 通过html标签 加载图像
 * @author yaojianfeng
 */
@WebServlet("/showImageByTag22")
public class ShowImageByTag extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.println(
             "<!DOCTYPE html>\n" +
                     "<html lang=\"en\">\n" +
                     "<head>\n" +
                     "    <meta charset=\"UTF-8\">\n" +
                     "    <title>Title</title>\n" +
                     "</head>\n" +
                     "<body>\n" +
                     "<img src=\""+req.getContextPath()+"/image/edgOne.jpeg\" alt=\"\">\n" +
                     "</body>\n" +
                     "</html>"
        );
    }
}
