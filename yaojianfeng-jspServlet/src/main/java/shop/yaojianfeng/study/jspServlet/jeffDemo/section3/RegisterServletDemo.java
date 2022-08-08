package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 注册
 *
 * @author yaojianfeng
 */
@WebServlet("/section3/register")
public class RegisterServletDemo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        //模拟数据库注册
        servletContext.setAttribute("username", username);
        servletContext.setAttribute("password", password);
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        resp.getWriter().println(
                "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<h1>注册信息</h1>\n" +
                        "<div>用户名:" + username + "</div>\n" +
                        "<div>密码:" + password + "</div>\n" +
                        "<a href=\"/jeff/section3/login.html\">登录</a>\n" +
                        "</body>\n" +
                        "</html>"
        );

    }
}
