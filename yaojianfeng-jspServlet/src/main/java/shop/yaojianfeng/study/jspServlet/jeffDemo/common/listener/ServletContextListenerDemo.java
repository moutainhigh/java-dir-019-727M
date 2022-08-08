package shop.yaojianfeng.study.jspServlet.jeffDemo.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * @author yaojianfeng
 */
@WebListener("这是一个ServletContext的生命周期的监听器")
public class ServletContextListenerDemo implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(sce.getServletContext().getAttribute("username")+"服务启动成功...");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println(sce.getServletContext().getAttribute("username")+"服务正在关闭...");
    }
}
