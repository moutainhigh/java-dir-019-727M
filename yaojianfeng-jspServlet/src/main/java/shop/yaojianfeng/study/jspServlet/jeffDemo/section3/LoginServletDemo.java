package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录页servlet
 *
 * @author yaojianfeng
 */
@WebServlet(urlPatterns = "/section3/login",loadOnStartup = 1)
public class LoginServletDemo extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext servletContext = config.getServletContext();
        //模拟数据库 匹配账户密码
        servletContext.setAttribute("username", "Jeff");
        servletContext.setAttribute("password", "123456");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        ServletContext servletContext = req.getServletContext();
        //模拟从数据库获取账户密码
        String dbUsername = (String) servletContext.getAttribute("username");
        String dbPassword = (String) servletContext.getAttribute("password");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter writer = resp.getWriter();
        //首先匹配用户名
        if (dbUsername.equals(username)) {
            //匹配密码
            if (dbPassword.equals(password)) {
                //匹配成功显示登录成功页面
                writer.println(
                        "<!DOCTYPE html>\n" +
                                "<html lang=\"en\">\n" +
                                "<head>\n" +
                                "    <meta charset=\"UTF-8\">\n" +
                                "    <title>登录成功页面</title>\n" +
                                "</head>\n" +
                                "<body>\n" +
                                "\n" +
                                "<input id=\"username\" type=\"hidden\" value=\"" + username + "\">\n" +
                                "<button type=\"button\" onclick=\"showName()\">点击此处</button>\n" +
                                "<script>\n" +
                                "    function showName() {\n" +
                                "        var elementById = document.getElementById(\"username\");\n" +
                                "        document.write('<h1 style=\"color: red\">'+'Hello '+elementById.value+'</h1>')\n" +
                                "    }\n" +
                                "</script>\n" +
                                "</body>\n" +
                                "</html>"
                );
            } else {
                //匹配失败显示找回密码界面
                resp.sendRedirect(req.getContextPath()+"/jeff/section3/loginFail.html");
            }
        } else {
            //账号匹配失败 则显示注册页面
            writer.println(
                    "<!DOCTYPE html>\n" +
                            "<html lang=\"en\">\n" +
                            "<head>\n" +
                            "    <meta charset=\"UTF-8\">\n" +
                            "</head>\n" +
                            "<body>\n" +
                            "<h1>此账号没有注册,请 <a href=\"/jeff/section3/register.html\">注册</a></h1>\n" +
                            "</body>\n" +
                            "</html>"
            );
        }
    }
}
