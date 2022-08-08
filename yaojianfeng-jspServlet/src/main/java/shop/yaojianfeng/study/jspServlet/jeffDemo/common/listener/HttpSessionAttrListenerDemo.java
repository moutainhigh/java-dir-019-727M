package shop.yaojianfeng.study.jspServlet.jeffDemo.common.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.Enumeration;

/**
 * @author yaojianfeng
 */
@WebListener("监听HttpSession的属性变化")
public class HttpSessionAttrListenerDemo implements HttpSessionAttributeListener {
    /**
     * 只有当新的attribute被添加的时候,才会触发
     * @param event
     */
    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println("attributeAdded方法被触发,属性已经添加到会话中...");
        HttpSession session = event.getSession();
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println(session.getAttribute(attributeNames.nextElement()));
        }
    }


    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        System.out.println("attributeReplaced方法被触发,属性已经添加到会话中...");
        HttpSession session = event.getSession();
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println(session.getAttribute(attributeNames.nextElement()));
        }

    }
}
