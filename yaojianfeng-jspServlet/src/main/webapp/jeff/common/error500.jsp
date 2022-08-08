<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的程序肯定没有问题...</title>
</head>
<body>
<h1><%= "我的程序肯定没有问题,一切都是幻觉..." %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/my001/index.html">my001</a>
<br>
<div style="border: 1px solid red;display: inline-block">
    <label style="color: deeppink;font-size: 20px"> section3</label>
    <br/>
    <a href="${pageContext.request.contextPath}/jeff/section3/login.html">登录</a>
    <a href="${pageContext.request.contextPath}/jeff/section3/register.html">注册</a>
    <a href="${pageContext.request.contextPath}/section3/reWriteUrl">重写url</a>
    <a href="${pageContext.request.contextPath}/section3/cookie">写入cookie</a>
    <a href="${pageContext.request.contextPath}/section3/httpSessionDemo">演示HttpSession</a>
    <a href="${pageContext.request.contextPath}/section3/sendError">sendError</a>
    <a href="${pageContext.request.contextPath}/section3/setStatus">setStatus</a>
</div>
</body>
</html>