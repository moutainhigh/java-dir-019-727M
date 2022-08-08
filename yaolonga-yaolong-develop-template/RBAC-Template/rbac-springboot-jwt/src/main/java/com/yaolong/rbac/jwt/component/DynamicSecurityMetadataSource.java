package com.yaolong.rbac.jwt.component;

import cn.hutool.core.util.URLUtil;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 动态权限数据源，用于获取动态权限规则
 * Created by macro on 2020/2/7.
 */
@Slf4j
public class DynamicSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private static Map<String, ConfigAttribute> configAttributeMap = null;
    @Autowired
    private DynamicSecurityService dynamicSecurityService;

    public void loadDataSource() {
        configAttributeMap = dynamicSecurityService.loadDataSource();
    }

    public void clearDataSource() {
        configAttributeMap.clear();
        configAttributeMap = null;
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
//        if (configAttributeMap == null) this.loadDataSource();

        if(configAttributeMap == null){
            synchronized (DynamicSecurityMetadataSource.class){
                if(configAttributeMap == null) {
                    loadDataSource();
                }
            }
        }
        List<ConfigAttribute>  configAttributes = new ArrayList<>();
        //获取当前访问的路径
        String url = ((FilterInvocation) o).getRequestUrl();
        String path = URLUtil.getPath(url);
        log.info("current url :{}", path);
        PathMatcher pathMatcher = new AntPathMatcher();
        Iterator<String> iterator = configAttributeMap.keySet().iterator();
        boolean isExistDB = false;
        //获取访问该路径所需资源
        while (iterator.hasNext()) {
            String pattern = iterator.next();
            //匹配资源是否存在
            if (pathMatcher.match(pattern, path)) {
                log.info("current url exist databases:{}", path);
                isExistDB = true;
                configAttributes.add(configAttributeMap.get(pattern));
            }
        }

//        if (!isExistDB){
//            throw new AccessDeniedException("当前接口未在数据库配置,禁止访问！");
//        }
        // 未设置操作请求权限，返回空集合
        return configAttributes;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }

}