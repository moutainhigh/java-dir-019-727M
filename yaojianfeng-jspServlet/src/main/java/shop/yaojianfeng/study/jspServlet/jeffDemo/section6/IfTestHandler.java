package shop.yaojianfeng.study.jspServlet.jeffDemo.section6;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * 单分支判断标签
 * @author yaojianfeng
 */
public class IfTestHandler extends SimpleTagSupport {

    private boolean test;
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    public void setTest(boolean test) {
        this.test = test;
    }

    @Override
    public void doTag() throws JspException, IOException {
        if (test){

           /* JspFragment jspBody = this.getJspBody();
            JspWriter out = this.getJspContext().getOut();
            jspBody.invoke(out);*/
            //等价于以上代码
            this.getJspBody().invoke(null);

        }
    }
}
