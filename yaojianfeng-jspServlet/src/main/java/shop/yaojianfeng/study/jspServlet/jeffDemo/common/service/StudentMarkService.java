package shop.yaojianfeng.study.jspServlet.jeffDemo.common.service;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.StudentMarkInfo;

/** 计算学生分数
 * @author yaojianfeng
 */
public interface StudentMarkService {
    /**
     * 获取分数
     * @param markInfo
     * @return
     */
    int getMark(StudentMarkInfo markInfo);
}
