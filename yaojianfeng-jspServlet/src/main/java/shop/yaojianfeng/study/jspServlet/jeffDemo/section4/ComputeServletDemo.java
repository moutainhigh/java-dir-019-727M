package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**计算工具类
 * @author yaojianfeng
 */
@WebServlet("/section4/compute")
public class ComputeServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        int a = Integer.parseInt(req.getParameter("a"));
        int b = Integer.parseInt(req.getParameter("b"));

        String computeName = req.getParameter("computeMethod");
        switch (computeName){
            case "+":
                servletContext.setAttribute("result",a+b);
                break;
            case "-":
                servletContext.setAttribute("result",a-b);
                break;
            case "*":
                servletContext.setAttribute("result",a*b);
                break;
            case "/":
                servletContext.setAttribute("result",a/b);
                break;
            default:
                break;
        }
        req.getRequestDispatcher("/section4/display").forward(req,resp);
    }
}
