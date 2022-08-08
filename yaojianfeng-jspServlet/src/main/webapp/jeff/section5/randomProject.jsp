<%@ page import="java.util.Random" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/11/29
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>随机分配项目</title>
</head>
<body>
<%! int i = 0;%>

<%
    //java注释 单行注释
    /*多行注释
    多行注释*/
    Random random = new Random();
    i = random.nextInt(10) + 1;
%>
<div>
<ol>
    <li>项目一: 班费收支管理系统 </li>
    <li>项目二: 学生信息管理系统</li>
    <li>项目三: 图书管理系统</li>
    <li>项目四: 在线影院订票系统</li>
    <li>项目五: 停车场系统</li>
    <li>项目六: 通讯录管理系统</li>
    <li>项目七: 在线点餐系统</li>
    <li>项目八: 校内易物平台系统</li>
    <li>项目九: 网吧会员管理系统</li>
    <li>项目十: 家庭财务管理系统</li>
</ol>
</div>

<div style="position: relative;top: 120px">
    <div style="display: flex;justify-content: center">
        <span style="color: #ff0000;font-size: 100px">随机分配第 <span style="color: blue"><%= i%></span> 个项目</span>
    </div>

    <div style="display: flex;justify-content: center">
        <button type="button" onclick="reSelect()">重新分配</button>
    </div>
</div>
<script>
    function reSelect() {
        location.reload();
    }
</script>
</body>
</html>
