<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/29
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="te" class="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student"/>
the page is : <jsp:getProperty name="te" property="id"></jsp:getProperty>
</body>
</html>
