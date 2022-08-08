<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>section8登录页</title>
</head>
<body>
<h1>${initParam.jspServlet}</h1>
<form action="register.jsp" method="post">
    <label >姓名: <input type="text"></label>
    <label >地址: <input type="text"></label>
     <input type="button" value="注册" onclick="window.open('./register.jsp','_self')">
     <input type="submit" value="登录">
</form>
</body>
</html>
