<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/4
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册结果页</title>
</head>
<body>
<%--使用参数对象获取接收的的特定值--%>
<div>用户名: ${param.username}</div>
<div>密码: ${param.password}</div>
<div>爱好: ${paramValues.hobby[0]} ${paramValues.hobby[1]} ${paramValues.hobby[2]} ${paramValues.hobby[3]}</div>

</body>
</html>
