package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

/**
 * 随机选择项目
 * @author yaojianfeng
 */
@WebServlet("/section4/randomProject")
public class RandomProjectDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int result = new Random().nextInt(7)+1;
        System.out.println(result);

        resp.getWriter().println(
                "<div style=\"position: relative;top: 250px\"><h1 style=\"display: flex;justify-content: center\">" +
                        "<span style=\"color: red;font-size: 100px\">"+result+ "</span></h1></div>\n"
       );

    }
}
