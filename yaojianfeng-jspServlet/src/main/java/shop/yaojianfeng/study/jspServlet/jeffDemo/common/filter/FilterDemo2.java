package shop.yaojianfeng.study.jspServlet.jeffDemo.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * 过滤器1
 * @author yaojianfeng
 */
@WebFilter("/*")
public class FilterDemo2 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("请求被过滤2222222....");
        //放行
        chain.doFilter(request,response);
        System.out.println("响应被过滤2222222.....");
    }

    @Override
    public void destroy() {

    }
}
