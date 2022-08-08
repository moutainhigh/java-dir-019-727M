<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/4
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--prefix可以与shortname一样 也可以自定义 建议保持一致--%>
<%@ taglib uri="http://www.yaojianfeng.shop" prefix="myElFunction" %>

<%--<%@ taglib prefix="my" uri="http://www.yaojianfeng.shop" %>--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common/basePage.jsp"%>
<html>
<head>
    <title>EL自定义函数演示文档</title>
</head>

<body>

    <div>使用自定义函数进行大写转换: <span style="color: red">${myElFunction:toUpperCase('hello')}</span></div>
    <div>拼接字符串sd: ${myElFunction:function1('你好','hello')}</div>
    <div>拼接字符串sd: ${myElFunction:joinStr("永恩","暴打了亚索" )}</div>
    <div>拼接字符串sx: ${myElFunction:joinStr("hello","world" )}</div>
    <hr>
    <div>使用EL函数标签库: <span style="color: yellow">${fn:toLowerCase("WORLD")}</span></div>


</body>
</html>
