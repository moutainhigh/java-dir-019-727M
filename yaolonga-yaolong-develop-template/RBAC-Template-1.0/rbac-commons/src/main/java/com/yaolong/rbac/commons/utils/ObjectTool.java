package com.yaolong.rbac.commons.utils;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.Map;

/**
 * @program: yaolong-blog
 * @description: 对象工具
 * @author: yaolong
 * @create: 2020-08-13 15:34
 **/
@Slf4j
public class ObjectTool {
    /**
     * 检查对象实体字段是否为空
     * @param obj
     * @return
     * @throws IllegalAccessException
     */
    public static boolean checkObjFieldIsNull(Object obj) throws IllegalAccessException {
        for(Field f : obj.getClass().getDeclaredFields()){
            f.setAccessible(true);
            //这里忽略static final 类型的属性，如若不需要可以去掉
            if(Modifier.isFinal(f.getModifiers())&&Modifier.isStatic(f.getModifiers())){
                continue;
            }
            if(!isEmpty(f.get(obj))){
                return false;
            }
            f.setAccessible(false);
        }
        return true;
    }
    //判断是否为空
    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;

        } else if (obj instanceof String && (obj.toString().trim().equals(""))) {
            return true;

        } else if (obj instanceof Number && ((Number) obj).doubleValue() < 0) {
            return true;

        } else if (obj instanceof Collection && ((Collection) obj).isEmpty()) {
            return true;

        } else if (obj instanceof Map && ((Map) obj).isEmpty()) {
            return true;

        } else if (obj instanceof Object[] && ((Object[]) obj).length == 0) {
            return true;

        }
        return false;
    }
}
