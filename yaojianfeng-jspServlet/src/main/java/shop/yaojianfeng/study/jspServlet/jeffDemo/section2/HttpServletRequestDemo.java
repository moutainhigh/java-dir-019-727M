package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;


/**
 * HttpServletRequest 演示文档
 * @author yaojianfeng
 */
@WebServlet("/httpServletRequestDemo")
public class HttpServletRequestDemo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration<String> headerNames = req.getHeaderNames();
        while (headerNames.hasMoreElements()){
            System.out.println(headerNames.nextElement());
        }
        System.out.println("===============================================================");
        String cacheControl = req.getHeader("Cache-Control");
        String encoding = req.getHeader("Accept-Encoding");
        String acceptLanguage = req.getHeader("Accept-Language");
        System.out.println(encoding);
        System.out.println(cacheControl);
        System.out.println(acceptLanguage);
        System.out.println("===============================================================");
        String header = req.getHeader("user-agent");
        System.out.println(header);
        Enumeration<String> headers = req.getHeaders("user-agent");
        if (headers.hasMoreElements()) {
            System.out.println(headers.nextElement());
        }

    }
}
