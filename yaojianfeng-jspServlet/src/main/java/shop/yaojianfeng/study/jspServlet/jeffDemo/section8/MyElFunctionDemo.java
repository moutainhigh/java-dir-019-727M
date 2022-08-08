package shop.yaojianfeng.study.jspServlet.jeffDemo.section8;

/** 自定义 EL 函数
 * @author yaojianfeng
 */

public class MyElFunctionDemo {

    /**
     * 拼接两个字符串
     * @param str1
     * @param str2
     * @return
     */
    public static String joinStr(String str1,String str2){
        return str1+str2;
    }

    /**
     * 小写英文变大写英文
     * @param str
     * @return
     */
    public static String toUpperCase(String str){
        return str.toUpperCase();
    }
}
