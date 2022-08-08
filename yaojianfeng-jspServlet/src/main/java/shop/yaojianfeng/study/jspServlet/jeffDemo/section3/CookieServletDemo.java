package shop.yaojianfeng.study.jspServlet.jeffDemo.section3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** Cookie使用演示文档
 * @author yaojianfeng
 */
@WebServlet(name = "cookieServlet",urlPatterns = "/section3/cookie")
public class CookieServletDemo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取Cookie
        Cookie[] cookies = req.getCookies();

        for (Cookie cookie : cookies) {
            System.out.println(cookie.getName() + "===" + cookie.getValue());
        }
        //写入cookie


        resp.addCookie(new Cookie("hello","123456"));
        resp.addCookie(new Cookie("Jeff","zhenshuai"));
        resp.addCookie(new Cookie("Jeff","feichangshuai"));
        resp.addCookie(new Cookie("Jeff","帅!"));
        resp.addCookie(new Cookie("Jeff","zhenshuai-feichangshuai-帅!"));

        Cookie cookie = new Cookie("studentName", "张三");
        cookie.setPath("/");
        resp.addCookie(cookie);


        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().write("<h1 style='color:red'>请查看开发者工具中的application下的<span style='color:blue'>cookie</span></h1>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
