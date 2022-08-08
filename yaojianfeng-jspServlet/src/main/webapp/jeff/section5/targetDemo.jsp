<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/30
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>接收转发的jsp</title>
</head>
<body>

<div>接收到的数据是: <span style="color: red"><%= request.getParameter("param") %></span></div>
</body>
</html>
