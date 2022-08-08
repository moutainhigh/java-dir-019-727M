package shop.yaojianfeng.study.jspServlet.class22.servlet;

import javax.servlet.*;
import java.io.IOException;

/**
 * 在控制台打印 'Hello World!'
 * @author yaojianfeng
 */
public class ServletDemo01 implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("Hello World!");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
