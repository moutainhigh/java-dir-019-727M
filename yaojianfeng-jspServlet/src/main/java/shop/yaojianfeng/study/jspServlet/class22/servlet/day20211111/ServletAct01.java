package shop.yaojianfeng.study.jspServlet.class22.servlet.day20211111;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author yaojianfeng
 */
public class ServletAct01 implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("hello world!");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
