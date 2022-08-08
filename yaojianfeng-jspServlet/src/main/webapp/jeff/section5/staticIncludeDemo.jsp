<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>include指令演示文档</title>
</head>
<body>
<div>这里是staticDemo当前文档的内容...</div>

  <div>staticDemo页接收的数据是: <%= request.getParameter("hello")%> </div>
<div>这里是include指令的内容: <%@ include file="directiveDemo.jsp"%></div>
</body>
</html>
