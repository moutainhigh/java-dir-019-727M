package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/** servlet api 演示文档
 * @author yaojianfeng
 */
@WebServlet("/servletApiDemo")
public class ServletApiDemo implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
