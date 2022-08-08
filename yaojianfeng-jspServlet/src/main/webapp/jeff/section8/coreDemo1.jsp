<%--
  Created by IntelliJ IDEA.
  此页面所使用的标签 了解即可
  User: yaojianfeng
  Date: 2021/12/5
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html >
<head>
    <title>JSTL核心标签库演示文档(了解)</title>
</head>
<body style="background-color: gray">
<%--set:
设置JSP作用域中的EL变量值,你可以使用EL访问JavaBean组件中存储的应用程序数据.
--%>
<div style="border: 2px solid blue">
    <span style="color: deeppink">----c:set 将变量存放到指定域中----</span>
    <c:set var="myName" value="Jeff" scope="page"/>
    <c:set var="innerValue" scope="page">
       html标签: <span style="color: red">${myName}</span>
    </c:set>
    <div>myName: ${myName}</div>
    <div> ${innerValue}</div>

</div>
<br>
<div style="border: 2px solid black">
    <span style="color: deeppink">----c:set 为Bean的属性赋值----</span>
    <jsp:useBean id="student" class="shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Student" scope="page"/>
    <jsp:setProperty name="student" property="name" value="李四"/>
    <div>声明的student实例: ${student} </div>
    <c:set target="${student}" property="name" value="张三"/>
    <div>设置的名字是: ${student.name}</div>
</div>
<br>
<div style="border: 2px solid black">
    <span style="color: #4775d2">---- catch 捕获异常 ----</span>
    <br>
    <c:catch var="exception">
        <%
            int i =8/0;
        %>
<%--        ${8 / 0}--%>
<%--        ${8 and 0}--%>
    </c:catch>


    <div>捕获的异常是: ${exception.localizedMessage}</div>
</div>
<br>
<div style="border: 2px solid black">
    <span style="color: #0A9676"> ----out 计算输出 (了解)----</span>
    <br>
    <span style="color: yellow">c:out 若EL中的变量没有定义,则使用default指定的值</span>
    <br>
<%--    <c:set var="collage" value="河南财经政法大学" scope="page"/>--%>
    <div>collage-out: <c:out value="${collage}" default="郑东校区"/> </div>
    <div>collage-EL: ${empty collage ? '郑东校区':collage}</div>
    <br>
    <span style="color: yellow">c:out 默认忽略xml语法标记  通过escapeXml属性控制 </span>
    <div>innerValue: <c:out value="${innerValue}"/> </div>
    <div>innerValue: ${innerValue} </div>

</div>
</body>
</html>
