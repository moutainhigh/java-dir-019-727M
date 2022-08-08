package com.yaolong.rbac.jwt.component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yaolong.rbac.commons.response.ResponseCode;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 自定义返回结果：未登录或登录过期
 * Created by macro on 2018/5/14.
 */
@Component
public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Cache-Control","no-cache");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", ResponseCode.USER_NOT_LOGGED_IN.code());
        map.put("message", ResponseCode.USER_NOT_LOGGED_IN.message());
        map.put("data", authException.getMessage());
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(response.getOutputStream(), map);
        }
        catch (Exception e) {
            throw new ServletException();
        }
        response.getWriter().flush();
    }
}
