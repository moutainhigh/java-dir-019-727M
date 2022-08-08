package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *  将异常写入服务器日志文件
 * @author yaojianfeng
 */
@WebServlet("/section3/writeLog")
public class LogServletDemo extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.println(
                "向服务器日志文件中写入异常日志...."
        );
        try{
            int x =9;
            int y = x/0;
        }catch (Exception e){
            e.printStackTrace();
            writer.println(e.getMessage());
            servletContext.log(e.getMessage(),e);
        }


    }
}
