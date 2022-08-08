<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/30
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="errorDataDemo.jsp" %>
<html>
<head>
    <title>该页面会发生异常</title>
</head>
<body>
<% int a = 5/0; %>
<div>结果是: <%=a%></div>
</body>
</html>
