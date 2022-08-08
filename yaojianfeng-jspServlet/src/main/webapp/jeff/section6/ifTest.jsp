<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/8
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="myTag" uri="http://shop.yaojianfeng.jstlOwnDefined" %>
<html>
<head>
    <title>自定义标签-有标签体,有属性</title>
</head>
<body>

<%
    int i = Integer.parseInt(request.getParameter("flagNum"));
    pageContext.setAttribute("flag",i % 2 == 0);
%>

<myTag:if test="${flag}">男</myTag:if>
<myTag:if test="${not flag}">女</myTag:if>

</body>
</html>
