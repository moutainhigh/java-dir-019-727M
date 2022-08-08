package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**隐藏域演示文档
 * @author yaojianfeng
 */
@WebServlet("/section3/hiddenServlet")
public class HiddenServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        String password = (String) servletContext.getAttribute("password");
        resp.setContentType("text/html");
        resp.getWriter().println(
                "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<div style=\"color: red\">注册密码是:"+password+"</div>\n" +
                        "\n" +
                        "</body>\n" +
                        "</html>"
        );
    }
}
