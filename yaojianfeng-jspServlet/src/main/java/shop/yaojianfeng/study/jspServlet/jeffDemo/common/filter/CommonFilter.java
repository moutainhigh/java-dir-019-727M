package shop.yaojianfeng.study.jspServlet.jeffDemo.common.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/** 统计请求花费时间
 * @author yaojianfeng
 */
@WebFilter("/*")
public class CommonFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 设置请求参数编码解析规则
        request.setCharacterEncoding("utf-8");
        long startTime = System.currentTimeMillis();
        chain.doFilter(request,response);
        long stopTime = System.currentTimeMillis();
        long totalTime = stopTime - startTime;
        System.out.println(request.getServerName()+"处理并响应该请求共花费了"+totalTime+"毫秒");
    }

}
