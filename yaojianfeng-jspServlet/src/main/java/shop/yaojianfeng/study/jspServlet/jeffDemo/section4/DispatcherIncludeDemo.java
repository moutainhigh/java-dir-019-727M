package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 请求分派器 include演示文档
 *
 * @author yaojianfeng
 */
@WebServlet("/section4/includeServlet")
public class DispatcherIncludeDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*RequestDispatcher requestDispatcher = req.getServletContext()
                .getRequestDispatcher("/section4/copyright");*/
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/section4/copyright");

        resp.getWriter().println(
                "<b> 包含的版权信息来自于:\n" +
                        "版权Servlet:</b><br>"
        );
        requestDispatcher.include(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
