package com.yaolong.rbac.jwt.aspect;

import cn.hutool.json.JSONUtil;
import com.yaolong.rbac.commons.annotation.SysLog;
import com.yaolong.rbac.commons.utils.ObjectTool;
import com.yaolong.rbac.jwt.service.ISysLogService;
import com.yaolong.rbac.jwt.utils.LoginContext;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template-2.0
 * @description 系统日志切面
 * @create 2021-09-03 12:22
 **/

@Component
@Slf4j
@Aspect
public class SysLogAspect {

    @Resource
    private ISysLogService sysLogService;

    @Resource
    protected HttpServletRequest request;

    @Pointcut("@annotation(com.yaolong.rbac.commons.annotation.SysLog) || @annotation(io.swagger.annotations.ApiOperation)")
    private void pointCut() {
    }

    /**
     * @return java.lang.Object
     * @description 打印请求报文和应答报文
     * @params [joinPoint]
     */
    @Around("pointCut()")
    public Object saveLog(ProceedingJoinPoint joinPoint) throws Throwable {
        // 获取当前时间
        long reqTime = System.currentTimeMillis();
        LocalDateTime time = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String createTime = time.format(formatter);
        // 获取请求ip
        String ip = request.getRemoteAddr();
        // 获取调用方法和参数
        String method = joinPoint.getSignature().getDeclaringType() + "." + joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        MethodSignature ms = (MethodSignature) joinPoint.getSignature();
        Method mt = ms.getMethod();

        SysLog sLog = mt.getAnnotation(SysLog.class);
        //swagger注解
        ApiOperation apiOperation = mt.getAnnotation(ApiOperation.class);
        //注解值 如果方法没有sysLog就获取ApiOperation如果没有ApiOperation 那么就为空
        String value = ObjectUtils.isEmpty(sLog) ? (ObjectUtils.isEmpty(apiOperation) ? "" : apiOperation.value()) : sLog.value();

        //请求地址
        String url = request.getRequestURI();
        //参数类型
        String paramsType = ObjectUtils.isEmpty(request.getContentType()) ? "" : request.getContentType();
        //请求类型
        String requestType = request.getMethod();
        log.info("请求地址：{}，请求参数类型：{} 请求类型：{}", url, paramsType, requestType);
        // 打印请求报文
        log.info("请求报文：# 请求描述:{} # 时间:{} # ip:{} # 调用方法:{} # 请求参数:>>>>>>>>>>{} url=>{}", value, createTime, ip, method, args, url);
        // 获取应答结果
        Object result = null;
        boolean isSuccess = true;
        //将日志存入数据库
        com.yaolong.rbac.jwt.domain.SysLog sysLog = new com.yaolong.rbac.jwt.domain.SysLog();
        try {
            result = joinPoint.proceed();
        } catch (Exception e) {
            isSuccess = false;
            result = joinPoint.proceed();

        }finally {
            // 获取处理时间
            long respTime = System.currentTimeMillis() - reqTime;
            // 打印应答报文
            log.info("应答报文：# 请求描述:{} # 时间:{} # 响应时间:{}ms # 返回参数:<<<<<<<<<<{}", value, createTime, respTime, result);

            sysLog.setClientIp(ip)
                    .setMethod(method)
                    .setOptime(respTime)
                    .setParams(JSONUtil.toJsonStr(args))
                    .setOperation(value)
                    .setIsSuccess(isSuccess)
                    .setUsername(LoginContext.getContentName())
                    .setUrl(url)
                    .setRequestType(requestType)
                    .setParamsType(paramsType)
                    .setCreateTime(time);
            sysLogService.create(sysLog);
        }
        return result;
    }
}
