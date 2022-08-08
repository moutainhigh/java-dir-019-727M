package shop.yaojianfeng.study.jspServlet.jeffDemo.section4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 版权信息 (工具人)
 *
 * @author yaojianfeng
 */
@WebServlet("/section4/copyright")
public class CopyrightServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().println(
                "<b><i style='background-color:green'>版权所有 2020-2030 ABC, Inc. 保留所有权利</i></b>"
        );
    }
}
