<%@ page import="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL获取数据演示文档</title>
</head>
<body>

<jsp:useBean id="str" scope="request" class="java.lang.String"/>
<%
    str = "今天是个好日子";
    pageContext.setAttribute("strTest",str);
    String school = "河南财经政法大学";
    pageContext.setAttribute("school",school);
    ArrayList<String> strings = new ArrayList<>();
    strings.add("sldkjfl");
    pageContext.setAttribute("strings",strings);

    Student student = new Student("赵子龙",1);
    pageContext.setAttribute("student",student);
    request.setAttribute("username","亚索");
    session.setAttribute("username","永恩");
    application.setAttribute("username","蔚");
    pageContext.setAttribute("username","爆爆");
%>
<%--结论:当不指定域的时候,从小到大寻找,指定则直接去指定的域中去找 --%>
<div> 获取的字符串是: <span style="color: red"> <%=str%></span></div>
<div> 获取的字符串是: <span style="color: red"> ${strTest}</span></div>
<div> 获取的学校信息是: <span style="color: red"> <%=school%></span></div>
<div> 获取的学校信息是: <span style="color: red"> ${school}</span></div>
<div> 获取的学生姓名是: <span style="color: red"> ${student.name}</span></div>

<div> 获取的学生id是: <span style="color: red"> ${student.id}</span></div>
<div> 获取的年级信息是: <span style="color: red"> ${student.grade}</span></div>
<div> 获取的名字是: <span style="color: red"> ${username}</span></div>
<div> 获取的名字是: <span style="color: red"> ${sessionScope.username}</span></div>
JSESSION: ${cookie.JSESSIONID.value}
<br>
studentName: ${cookie.studentName.value}
<br>
test: ${cookie.test.value}
</body>
</html>
