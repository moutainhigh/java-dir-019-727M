<%@ page import="java.time.LocalDateTime" %>

<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/28
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%--page指令的语法--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP入门-展示时间</title>
</head>
<body>
<% LocalDateTime now = LocalDateTime.now(); %>
<div style="color: red">访问该页面的时间是: <%= now.getYear()+"年 "+now.getMonthValue()+"月 "+now.getDayOfMonth()+"日 "
        +now.getHour()+"时 "+now.getMinute()+"分 "+now.getSecond()+"秒" %></div>

<%--<script>
    setInterval(() => {
        location.reload();
    },1000)--%>
</script>
</body>
</html>
