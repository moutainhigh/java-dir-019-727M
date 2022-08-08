package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

/**
 * ServletRequest 对象演示文档
 * @author yaojianfeng
 */
@WebServlet("/servletRequestDemo")
public class ServletRequestDemo extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = config.getServletContext();


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决中文乱码问题
//        req.setCharacterEncoding( "utf-8" );
        String myName = req.getParameter("myName");
        System.out.println(myName);
        String[] myNames = req.getParameterValues("hobby");
        String myNamesStr = Arrays.toString(myNames);
        System.out.println(myNamesStr);
        Enumeration<String> parameterNames = req.getParameterNames();
        StringBuilder paramNames = new StringBuilder();
        while (parameterNames.hasMoreElements()){
            paramNames.append(parameterNames.nextElement()).append(">>");
        }

        String remoteHost = req.getRemoteHost();
        System.out.println(remoteHost);
        String remoteAddr = req.getRemoteAddr();
        System.out.println(remoteAddr);
        resp.setContentType("text/html");
//        resp.setContentType("text/plain");
//        resp.setCharacterEncoding("UTF-8");

        resp.getWriter().println(
                "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<div style='color:red'>getParameter:"+myName+"</div>\n" +
                "<div>getParameterValues:"+myNamesStr+"</div>\n" +
                "<div>getParameterNames:"+paramNames.toString()+"</div>\n" +
                "<div>remoteHost:"+remoteHost+"</div>\n" +
                "<div>remoteAddr:"+remoteAddr+"</div>\n" +
                "<div></div>\n" +
                "</body>\n" +
                "</html>");

    }

    /**
     * 获取url
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext servletContext = req.getServletContext();
        Enumeration<String> attributeNames = servletContext.getAttributeNames();
        while (attributeNames.hasMoreElements()){
//            System.out.println(attributeNames.nextElement());
            System.out.println(servletContext.getAttribute(attributeNames.nextElement()));
        }
//        Object url = servletContext.getAttribute("url");
//        System.out.println(url.toString());
    }



}
