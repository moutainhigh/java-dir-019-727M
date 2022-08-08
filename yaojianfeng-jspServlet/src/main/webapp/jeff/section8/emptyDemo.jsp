<%@ page import="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>使用empty演示文档</title>
</head>
<body>
<jsp:useBean id="str" scope="request" class="java.lang.String"/>
<%
    str = "今天是个好日子";
    pageContext.setAttribute("str",str);
    pageContext.setAttribute("str1","");
    String school = "河南财经政法大学";
    pageContext.setAttribute("school",school);
    Student student = new Student("赵子龙",1);
    pageContext.setAttribute("student",student);
    request.setAttribute("username","亚索");
    session.setAttribute("username","永恩");
    application.setAttribute("username","蔚");
    pageContext.setAttribute("username","爆爆");
%>

<div> str是否为空: <span style="color: red">${empty str?'默认值':str}</span></div>
<div> str是: <span style="color: red">${str}</span></div>
<div> str1是否为空: <span style="color: red"> ${empty str1}</span></div>
<div> 学校信息是否为空: <span style="color: red"> ${empty school}</span></div>
<div> 年级信息是否为空: <span style="color: red"> ${empty student.grade}</span></div>
<div> 名字是否为空: <span style="color: red"> ${empty username}</span></div>
<div> 名字是否为空: <span style="color: red"> ${username}</span></div>

<div>
<%--    ${ "hello" + "world" }--%>
</div>

</body>
</html>
