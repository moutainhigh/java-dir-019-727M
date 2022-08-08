package shop.yaojianfeng.study.jspServlet.jeffDemo.common.utils;

import java.util.List;

/**我的自定义字符串工具类
 * @author yaojianfeng
 */
public class MyStringUtil {

    /**
     * 去除空格和换行符 让字符串紧凑在一块儿
     * @return
     */
    public static String makeTogether(String sourceStr){
        return sourceStr.replaceAll("\\s*|\t|\r|\n", "");
    }

    /**
     * 统计 某个字符串在 字符串集合中出现的次数
     * @param stringList
     * @param target
     * @return
     */
    public static int countStr(List<String> stringList, String target){
        int num = 0;
        for (String s : stringList) {
            if (target.equals(s)){
                num++;
            }
        }
        return num;
    }
}
