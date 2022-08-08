<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/5
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSTL常用核心标签演示文档(重点)</title>
</head>
<body style="background-color: gray">
<div style="border: 2px yellow solid">
    <span style="color: blue">---if 单分支判断标签---</span>
    <c:set var="index" value="3" scope="page"/>
    <c:if test="${index==3}" >
        <h1> hello world! </h1>
    </c:if>
</div>
<br>
<div style="border: 2px yellow solid">
    <span style="color: blue">----choose 多分支选择标签----</span>
    <c:choose>
        <c:when test="${index == 1}"><div>星期一</div></c:when>
        <c:when test="${index == 2}"><div>星期二</div></c:when>
        <c:when test="${index == 3}"><div style="color: red">星期三</div></c:when>
        <c:when test="${index == 4}"><div>星期四</div></c:when>
        <c:when test="${index == 5}"><div>星期五</div></c:when>
        <c:otherwise>假期</c:otherwise>
    </c:choose>
</div>

<br>
<div style="border: 2px yellow solid">
    <span style="color: blue">----forEach 循环标签----</span>
    <%
        ArrayList<String> strings = new ArrayList<>();
        strings.add("Jeff");
        strings.add("张三");
        strings.add("李四");
        strings.add("王五");
        strings.add("马六");
        strings.add("周七");
        strings.add("吴八");
        strings.add("郑九");
        strings.add("王十");
        pageContext.setAttribute("strings",strings);
    %>
    <br>
    <c:forEach var="name" items="${strings}" step="2" begin="2" end="6" varStatus="vs">
         <td> ${vs.step}: ${name}</td>
        <br>
    </c:forEach>
    <hr/>
    ${strings}
    <br>

    <c:forTokens var="token" items="[Jeff, 张三, 李四, 王五, 马六, 周七, 吴八, 郑九, 王十]" begin="0" end="${strings.size()-1}" delims=","  varStatus="vs">
        vs:${vs.index}  name: ${token} <br>
    </c:forTokens>

</div>

<div style="border: 2px yellow solid">
    <span style="color: blue">----fmt DataFormat 格式化标签----</span>
    <%
        Date dateTime = new Date();
        pageContext.setAttribute("dateTime",dateTime);
    %>
    <br>
    <div>时间是:${dateTime}</div>
    <fmt:formatDate value="${dateTime}" pattern="yyyy-MM-dd" var="localDate"/>
    <div>今天是 <span style="color: yellow">${localDate}</span></div>

</div>
</body>
</html>
