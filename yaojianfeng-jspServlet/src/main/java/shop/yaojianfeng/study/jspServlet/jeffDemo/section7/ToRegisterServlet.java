package shop.yaojianfeng.study.jspServlet.jeffDemo.section7;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 注册控制器
 * @author yaojianfeng
 */
@WebServlet("/section7/toRegisterServlet")
public class ToRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.sendRedirect(req.getContextPath()+"/jeff/section7/register.jsp");
    }
}
