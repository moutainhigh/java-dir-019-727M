package com.yaolong.rbac.jwt.component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yaolong.rbac.commons.response.ResponseCode;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 自定义返回结果：没有权限访问时
 * Created by macro on 2018/4/26.
 */
@Component
public class RestfulAccessDeniedHandler implements AccessDeniedHandler{
    @Override
    public void handle(HttpServletRequest request,
                       HttpServletResponse response,
                       AccessDeniedException e) throws IOException, ServletException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Cache-Control","no-cache");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Map<String, Object> map = new HashMap<String, Object>();
        // 401
        map.put("code", ResponseCode.PERMISSION_NO_ACCESS.code());
        map.put("message", e.getMessage());
        map.put("path", request.getServletPath());
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json");
        response.getWriter().write(mapper.writeValueAsString(map));
        response.getWriter().flush();
    }
}
