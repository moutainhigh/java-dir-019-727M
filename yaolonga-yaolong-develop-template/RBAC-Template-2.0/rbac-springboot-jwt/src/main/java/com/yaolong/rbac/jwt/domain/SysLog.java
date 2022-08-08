package com.yaolong.rbac.jwt.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yaolong.rbac.commons.base.BaseDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统日志
 * </p>
 *
 * @author yaolong
 * @since 2021-08-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_log")
public class SysLog extends BaseDomain {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名
     */
    private String username;

    /**
     * 用户操作
     */
    private String operation;

    /**
     * 请求接口地址
     */
    private String url;

    /**
     * 请求是否成功
     */
    private Boolean isSuccess;

    /**
     * 请求类型
     */
    private String requestType;

    /**
     * 请求方法
     */
    private String method;

    /**
     * 请求参数
     */
    private String params;

    /**
     * 请求参数类型
     */
    private String paramsType;


    /**
     * 执行时长(毫秒)
     */
    private Long optime;

    /**
     * 修改时间
     */
    @TableField(exist = false)
    private LocalDateTime updateTime;

    /**
     * IP地址
     */
    private String clientIp;

    /**
     * 扩展字段
     */
    private String extvalue1;

    /**
     * 扩展字段
     */
    private String extvalue2;

    /**
     * 扩展字段
     */
    private String extvalue3;



}
