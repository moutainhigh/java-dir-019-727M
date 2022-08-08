<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>访问隐式对象</title>
</head>
<body>
<div>hello <span style="color: red">${applicationScope.username}</span></div>
<div>Cookie-JSESSIONID: <span>${cookie.JSESSIONID.value}</span></div>
<%--手动模拟添加一个cookie--%>
<div>Cookie-hello: <span style="color: blue">${cookie.hello.value}</span></div>

<%--访问section3中的写入cookie--%>
<div>studentName: <span style="color: blue">${cookie.studentName.value}</span></div>


</body>
</html>
