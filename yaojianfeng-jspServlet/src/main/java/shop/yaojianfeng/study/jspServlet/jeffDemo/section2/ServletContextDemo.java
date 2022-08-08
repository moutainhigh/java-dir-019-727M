package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

/**
 * ServletContext对象演示文档
 * @author yaojianfeng
 */
@WebServlet(name = "servletContextDemo",urlPatterns = "/servletContextDemo")
public class ServletContextDemo extends HttpServlet {
    private ServletContext ctx;




    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("init()方法执行了.在ServletContext中设置了url属性");
//        ctx = config.getServletContext();
        ctx = config.getServletContext();
        ctx.setAttribute("url","mysql......");
        ctx.setAttribute("myName","Jeff......");


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object url = ctx.getAttribute("url");
        Object myName = ctx.getAttribute("myName");

        System.out.println(url.toString()+"===="+myName.toString());
        Enumeration<String> attributeNames = ctx.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println(attributeNames.nextElement());
        }


    }
}
