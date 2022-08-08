package shop.yaojianfeng.study.jspServlet.jeffDemo.section6;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * 显示IP
 * @author yaojianfeng
 */
public class ShowIpTagHandler extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        //获取PageContext对象
        PageContext pageContext = (PageContext) this.getJspContext();
        //获取远程的IP地址
        String remoteAddr = pageContext.getRequest().getRemoteAddr();

        //获取输出流
        JspWriter out = pageContext.getOut();

        //将数据写入输出流中
        out.print(remoteAddr);

    }
}
