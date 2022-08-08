package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

/**
 * HttpSession 演示文档
 * @author yaojianfeng
 */
@WebServlet("/section3/httpSessionDemo")
public class HttpSessionDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(true);

        session.setAttribute("hello","nihao...");
        session.setAttribute("Jeff","xxxx...");
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println(session.getAttribute(attributeNames.nextElement()));
        }
        session.removeAttribute("Jeff");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
