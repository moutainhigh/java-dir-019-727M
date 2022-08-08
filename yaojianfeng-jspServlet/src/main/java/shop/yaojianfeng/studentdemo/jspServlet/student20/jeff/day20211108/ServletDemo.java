package shop.yaojianfeng.studentdemo.jspServlet.student20.jeff.day20211108;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;

/**
 * 代码提交示例
 * @author yaojianfeng
 */
@WebServlet(name = "JeffServletDemo",value = "/jeffServletDemo")
public class ServletDemo implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("Submit code, follow the project structure specification, and create your own code space! ");
        System.out.println("输出中文可能报错...在VM配置选项中中添加:  -Dfile.encoding=UTF-8 ");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
