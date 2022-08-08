package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  重写 URL
 * @author yaojianfeng
 */
@WebServlet("/section3/reWriteUrl")
public class ReWriteUrlDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        String username = (String) servletContext.getAttribute("username");
        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().println(
                "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<h1>URL已经被重写,<span style=\"color: red\"><a href=\"/jeff/section3/login.html"+
                        "?"+"username="+username+"\">点击我!</a></span></h1>\n" +
                        "\n" +
                        "</body>\n" +
                        "</html>"
        );


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
