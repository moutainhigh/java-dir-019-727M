package shop.yaojianfeng.study.jspServlet.jeffDemo.section7;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.SysUser;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.impl.SysUserServiceImpl;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.service.SysUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;

/**
 * 登录业务 控制器
 * @author yaojianfeng
 */
@WebServlet("/section7/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.接收请求参数,设置响应信息
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        HttpSession session = req.getSession(true);
        if (userName==null||password==null||"".equals(userName.trim())||"".equals(password.trim())){
            session.setAttribute("message","请填写用户名或密码!");
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }
        //2.构建参数对象
        SysUser user = new SysUser();
        user.setUserName(userName);
        user.setPassword(password);
        //3.创建Service对象
        SysUserService service = new SysUserServiceImpl();
        //4.调用Service对象的一些业务方法进行业务处理
        boolean loginFlag = service.checkSysUser(user);
        //5.根据业务处理结果跳转不同的页面
        if (loginFlag) {
            session.setAttribute("username",userName);
            session.setAttribute("loginDate", LocalDateTime.now().toLocalTime());
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        }else {
            session.setAttribute("message","用户名或密码错误!");
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }

    }

}
