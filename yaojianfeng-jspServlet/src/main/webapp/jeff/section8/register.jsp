<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/3
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>section8注册页</title>
</head>
<body>
<form action="" method="post">
   <div> <label >姓名: <input type="text" name="username"></label></div>
    <div><label >密码: <input type="password" name="password"></label></div>
   <div> 爱好:
       <label>苹果 <input type="checkbox" name="hobby" value="apple"></label>
       <label>香蕉 <input type="checkbox" name="hobby" value="banana"></label>
       <label>橘子 <input type="checkbox" name="hobby" value="orange"></label>
       <label>柠檬 <input type="checkbox" name="hobby" value="lemon"></label>
   </div>
<%--    <input type="submit" value="注册">--%>
    <input type="submit" value="注册" formaction="./registerResult.jsp">
</form>
</body>
</html>
