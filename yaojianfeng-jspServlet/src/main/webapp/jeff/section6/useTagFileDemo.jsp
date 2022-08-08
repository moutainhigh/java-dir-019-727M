<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/8
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/mytag" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<div>
    <my:fileModel message="使用的是fileModel标签"/>
</div>
<my:today>
    <div>今天是:${shortDate}</div>
    <div>今天是:${longDate}</div>
</my:today>

<my:includeTag/>
<%--<div>javaBean的作用范围:
<%
    String[] scopeNames = {"no scope","page","request","session","application"};
    int index = pageContext.getAttributesScope("shortDate");
%>
    <span style="color:blue;font-size: 50px"><%=scopeNames[index]%></span>
</div>--%>

Your referer header: <span style="color: red">${header.referer}</span>
<br/>
<%--使用 doBody动作--%>
<my:doBodyTag>
    <%--这个值会传给 doBodyTag.tag 里的 referer 变量--%>
    xyz: ${header.referer}
</my:doBodyTag>
<!-- 打印refere1的值 -->
referer header是 ${sessionScope.referer}
<br>

<%--使用 invoke动作--%>
<my:invokeTag>
    <jsp:attribute name="productDetails" >
<table border="1">
    <tr>
        <td><b>产品名称</b></td>
        <td>${productName}</td>
    </tr>
    <tr>
        <td><b>产品描述</b></td>
        <td>${description}</td>
    </tr>
    <tr>
        <td><b>产品价格</b></td>
        <td>${price}</td>
    </tr>
</table>
</jsp:attribute>
</my:invokeTag>
</body>
</html>
