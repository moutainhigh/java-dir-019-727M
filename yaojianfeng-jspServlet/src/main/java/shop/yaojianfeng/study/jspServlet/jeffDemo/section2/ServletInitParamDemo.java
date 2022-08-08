package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 演示初始化参数
 *
 * @author yaojianfeng
 */
@WebServlet(name = "initParamDemo", urlPatterns = "/servletInitParamDemo",
        initParams = {@WebInitParam(name = "myEmail", value = "yaojianfeng@163.com"),
                @WebInitParam(name = "url", value = "localhost....")},
        loadOnStartup = 5)
public class ServletInitParamDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletConfig servletConfig = this.getServletConfig();
        String myEmail = servletConfig.getInitParameter("myEmail");
        System.out.println(myEmail);
    }
}
