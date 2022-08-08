package shop.yaojianfeng.study.jspServlet.jeffDemo.common.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 注意: tomcat需要更换为9.0及以上版本 否则无法正确启动
 * HttpFilter 的使用 设置统一编码格式
 *
 * @author yaojianfeng
 */
@WebFilter("/*")
public class HttpFilterDemo extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

        //设置编码统一格式
//        res.setContentType("text/html");  设置这个不太好,响应可能不一定都是html文档 造成bootstrap项目无法渲染
        res.setCharacterEncoding("utf-8");
        chain.doFilter(req, res);

    }

}
