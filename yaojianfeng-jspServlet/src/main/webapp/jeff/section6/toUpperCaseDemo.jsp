<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/7
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/basePage.jsp" %>
<%@taglib prefix="myTag" uri="http://shop.yaojianfeng.jstlOwnDefined" %>
<html>
<head>
    <title>自定义具有标签体的标签</title>
</head>
<body>

<%
    String str = "hello world, hello JSTL! ";
    pageContext.setAttribute("str",str);
%>

    <myTag:toUpperCase>
        <span style="color: red">${str}</span>
    </myTag:toUpperCase>


</body>
</html>
