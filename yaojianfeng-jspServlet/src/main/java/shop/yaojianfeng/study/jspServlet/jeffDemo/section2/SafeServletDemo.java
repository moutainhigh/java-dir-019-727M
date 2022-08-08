package shop.yaojianfeng.study.jspServlet.jeffDemo.section2;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author yaojianfeng
 */
@WebServlet("/safeServletDemo")
public class SafeServletDemo extends HttpServlet {
    private int count;

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext servletContext = config.getServletContext();
        servletContext.setAttribute("threadPool", Executors.newFixedThreadPool(100));
    }

    private void  setCount() {
        count++;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        ExecutorService threadPool = (ExecutorService) servletContext.getAttribute("threadPool");
        count = 0;
        for (int i = 0; i < 1000; i++) {
//            threadPool.execute(this::setCount);
            new Thread(this::setCount).start();
//            setCount();
        }

       /* try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }*/
        res.getWriter().println(count);

    }
}
