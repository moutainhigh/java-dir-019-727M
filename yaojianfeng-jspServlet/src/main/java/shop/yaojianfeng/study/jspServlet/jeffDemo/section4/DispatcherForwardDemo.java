package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** 请求转发演示文档
 * @author yaojianfeng
 */
@WebServlet("/section4/forward")
public class DispatcherForwardDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");
        RequestDispatcher requestDispatcher = req.getServletContext().getRequestDispatcher("/"+path);
        requestDispatcher.forward(req,resp);
    }
}
