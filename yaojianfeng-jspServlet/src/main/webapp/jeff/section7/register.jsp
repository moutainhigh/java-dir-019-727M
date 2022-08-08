<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/13
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
</head>
<body>
<form style="text-align: center" action="${pageContext.request.contextPath}/section7/registerServlet" method="post">
    <div>
        <label>姓名: <input type="text" name="userName" value="${cookie.username.value}"></label>
    </div>
    <div>
        <label>密码: <input type="text" name="password"></label>
    </div>
    <div>
        <input type="submit" value="注册">

    </div>
</form>
<div style="text-align: center;color: red">${sessionScope.message}</div>
</body>
</html>
