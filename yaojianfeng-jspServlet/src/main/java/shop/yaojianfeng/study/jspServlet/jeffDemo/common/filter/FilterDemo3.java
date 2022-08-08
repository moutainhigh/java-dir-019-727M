package shop.yaojianfeng.study.jspServlet.jeffDemo.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @author yaojianfeng
 */
@WebFilter(servletNames = {"cookieServlet"})
public class FilterDemo3 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("cookieDemo的请求被过滤了...");
        chain.doFilter(request,response);
        System.out.println("cookieDemo的响应被过滤了...");
    }
}
