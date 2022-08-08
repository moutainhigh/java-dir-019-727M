<%@ page import="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>使用EL访问javaBean</title>
</head>
<body>
<%
    Student student1 = new Student();
//    student1.setId(10);
    student1.setName("爆爆");
    pageContext.setAttribute("student1",student1);
//    pageContext.setAttribute("num","10");
%>
<jsp:useBean id="student" scope="session" class="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student"/>
<jsp:setProperty name="student" property="name" value="yaojianfeng"/>
<div>已声明学生实例的名字为: ${student.name}</div>
<div>已声明学生实例的名字为: ${student1.name}</div>
<div>已声明学生实例的grade为: ${student1.grade}</div>
       <div>num是: ${"10" + "10"}</div>
是否为空: ${empty num?"默认值": num }
</body>
</html>
