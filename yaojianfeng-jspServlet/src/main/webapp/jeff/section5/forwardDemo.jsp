<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/30
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jsp动作-forward</title>
</head>
<body>


<% String str = "这是第一个页面的数据呵呵呵呵...."; %>

<div><%=str+"哈哈哈哈..."%></div>

<jsp:forward page="targetDemo.jsp">
    <jsp:param name="param" value= "<%=str%>"/>
</jsp:forward>>

</body>
</html>
