package shop.yaojianfeng.initDemo;

import java.io.*;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

/**
 * @author yaojianfeng
 */
@WebServlet(name = "helloServlet", urlPatterns = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    private LocalDateTime dateTime;

    @Override
    public void init() {
        message = "Hello World!";
        dateTime = LocalDateTime.now();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("<div> 现在时间是:" + dateTime + "</div>");
        out.println("</body></html>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post方法被调用了...");
    }

    @Override
    protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("head方法被调用了...");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPut方法被调用了...");
    }

    @Override
    public void destroy() {
        System.out.println("destroy方法被调用了...");
    }
}