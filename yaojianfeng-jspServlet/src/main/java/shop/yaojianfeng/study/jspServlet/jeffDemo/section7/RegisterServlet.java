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

/**
 * 注册控制器
 * @author yaojianfeng
 */
@WebServlet("/section7/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        HttpSession session = req.getSession(true);
        if (userName==null||password==null||"".equals(userName.trim())||"".equals(password.trim())){
            session.setAttribute("message","请填写用户名或密码!");
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/jeff/section7/register.jsp");
            return;
        }
        // 创建对象
        SysUser user = new SysUser(userName,password);
        
        //调用service层方法
        SysUserService service = new SysUserServiceImpl();
        int result = service.insertOneSysUser(user);
        //根据方法返回值进行页面跳转,消息封装
        if (result>0) {
            //注册成功,重定向至登录页面
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }else {
            //重定向防止恶意刷新
            resp.sendRedirect(req.getContextPath()+"/jeff/section7/register.jsp");
            return;
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
