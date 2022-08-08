package shop.yaojianfeng.study.jspServlet.class22.servlet.day20211111;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

/**
 * @author yaojianfeng
 */
public class ServletAct02 implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        //设置头信息要放在getWriter方法操作之前 可以解决页面中文乱码
        res.setContentType("text/html");
        res.setCharacterEncoding("UTF-8");

        LocalDateTime now = LocalDateTime.now();
        PrintWriter writer = res.getWriter();

        writer.println(
                "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "    <title>时间显示</title>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<div>当前时间是:"+ now+" </div>\n" +
                        "</body>\n" +
                        "</html>"
        );
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
