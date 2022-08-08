package shop.yaojianfeng.study.jspServlet.jeffDemo.section1;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet 生命周期方法演示文档
 * 人的 生老病死
 * 佛家 成住坏空
 * 道家 道法自然
 *
 * @author yaojianfeng
 */
@WebServlet(name = "servletMethodDemo", value = "/servletMethodDemo")
public class ServletMethodDemo extends HttpServlet {
    private ServletConfig config;

    /**
     * 初始化方法
     * 在Servlet被创建时执行,而且只会执行一次
     *
     * @param config 配置信息
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
        System.out.println("初始化方法: init()被执行了...");
    }


    /**
     * 获取ServletConfig对象
     * ServletConfig对象: Servlet的配置对象
     * 这个需要自己实现
     *
     * @return
     */
    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    /**
     * 提供服务方法
     * 每一次Servlet被访问时执行,会执行多次
     *
     * @param req 请求对象
     * @param res 响应对象
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("提供服务的方法: service()被执行了...");
        System.out.println(config.getServletName());
        System.out.println(config.getServletContext().getContextPath());
        //在service中调用doGet()方法;
//        doGet(req,res);

    }

    /**
     * 获取Servlet的一些信息,版本,作者等等
     * 了解一下即可
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        return null;
    }

    /**
     * 销毁方法(临终关怀/回光返照)
     * 在服务器正常关闭情况下执行,只会执行一次
     */
    @Override
    public void destroy() {
        System.out.println("服务器关闭,destroy()方法被执行了...");
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("doGet()方法被执行了...");
        //可能会出异常状态码
//        super.doGet(req, resp);
    }
}
