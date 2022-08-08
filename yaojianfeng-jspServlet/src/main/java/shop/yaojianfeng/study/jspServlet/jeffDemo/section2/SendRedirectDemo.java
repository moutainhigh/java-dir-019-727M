package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**重定向演示文档
 * @author yaojianfeng
 */
@WebServlet("/sendRedirectDemo")
public class SendRedirectDemo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendRedirect(req.getContextPath()+"/test.html");
        resp.sendRedirect("http://www.yaojianfeng.shop");
    }
}
