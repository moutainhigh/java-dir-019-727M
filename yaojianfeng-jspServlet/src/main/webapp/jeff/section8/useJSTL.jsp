<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/4
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>使用JSTL标签库</title>
</head>
<body>
    <div style="color: blue">${fn:length('hello')}</div>
</html>
