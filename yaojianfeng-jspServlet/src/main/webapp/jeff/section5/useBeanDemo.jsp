<%@ page import="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/1
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isThreadSafe="false" %>
<html>
<head>
    <title>useBean-演示文档</title>
</head>
<body>


<div>开始...</div>
<jsp:useBean id="myStudent"  scope="session" class="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student"/>
<div>声明一个学生实例:<%= myStudent.toString()%></div>
<div>设置id值</div>
<jsp:setProperty name="myStudent" property="id" value="<%=myStudent.getId()+1%>"/>
<div>打印id值</div>
<%--<span style="color: red;font-size: 50px">学生id值是:<%=student.getId()%></span>--%>
<span style="color: red;font-size: 50px">学生id值是:<jsp:getProperty name="student" property="id"/></span>
<div>javaBean的作用范围:
<%
    String[] scopeNames = {"no scope","page","request","session","application"};
    int index = pageContext.getAttributesScope("student");
%>
<span style="color:blue;font-size: 50px"><%=scopeNames[index]%></span>
</div>


</body>
</html>
