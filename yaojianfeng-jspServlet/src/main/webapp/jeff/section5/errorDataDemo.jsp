<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/30
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  isErrorPage="true" %>
<html>
<head>
    <title>ErrorData演示文档</title>
</head>
<body>
<%
    ErrorData errorData = pageContext.getErrorData();
%>
<div>URI:<%= errorData.getRequestURI()%></div>
<div>ServletName:<%= errorData.getServletName()%></div>
<div>StatusCode:<%= errorData.getStatusCode()%></div>
<div>Throwable:<%= errorData.getThrowable().getMessage()%></div>
</body>
</html>
