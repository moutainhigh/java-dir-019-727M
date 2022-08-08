package shop.yaojianfeng.study.jspServlet.jeffDemo.section6;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;

/**
 * 小写转大写标签处理程序
 * @author yaojianfeng
 */
public class ToUpperCaseTagHandler extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        //获取标签体对象
        JspFragment jspBody = this.getJspBody();
        //获取标准输出流
        JspWriter out = this.getJspContext().getOut();
        //获取暂存输出流
        StringWriter dataWriter = new StringWriter();
        //执行片段并将所有输出定向到给定的 Writer,也就是说将标签体内容写入到输出流
        jspBody.invoke(dataWriter);
        //从输出流中获取内容
        String content = dataWriter.toString();
//        String content = dataWriter.getBuffer().toString();
        String result = content.toUpperCase();
        out.print(result);
    }
}
