package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 显示计算结果
 * @author yaojianfeng
 */
@WebServlet("/section4/display")
public class DisplayServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        int result = (int) servletContext.getAttribute("result");

        resp.getWriter().println(
                "<h1>计算结果是:"+result+"</h1>"
        );
        resp.setStatus(HttpServletResponse.SC_OK);
    }
}
