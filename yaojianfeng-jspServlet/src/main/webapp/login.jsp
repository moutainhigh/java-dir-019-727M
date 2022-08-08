<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/12
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>网站登录页</title>
</head>
<body>

<h1 style="text-align: center">welcome! </h1>

<form style="text-align: center" action="${pageContext.request.contextPath}/section7/login" method="post">
    <div>
        <label>姓名: <input type="text" name="userName" value="${cookie.username.value}"></label>
    </div>
    <div>
        <label>密码: <input type="text" name="password"></label>
    </div>
    <div>
        <input type="submit" value="登录">
        <a href="${pageContext.request.contextPath}/section7/toRegisterServlet">注册</a>
    </div>
</form>
<div style="text-align: center;color: red">${sessionScope.message}</div>

</body>
</html>
