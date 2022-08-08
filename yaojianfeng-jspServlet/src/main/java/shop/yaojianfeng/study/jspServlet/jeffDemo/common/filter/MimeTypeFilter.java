package shop.yaojianfeng.study.jspServlet.jeffDemo.common.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 针对第四章案例增加统一mime类型的设置
 * @author yaojianfeng
 */
@WebFilter("/section4/*")
public class MimeTypeFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        res.setContentType("text/html");
        chain.doFilter(req,res);
    }
}
