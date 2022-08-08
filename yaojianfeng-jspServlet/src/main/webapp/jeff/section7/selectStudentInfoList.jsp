<%--
  Created by IntelliJ IDEA.
  User: yaojianfeng
  Date: 2021/12/13
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>列表查询页面</title>
</head>
<body>
<form style="text-align: center" action="${pageContext.request.contextPath}/section7/queryStudentInfoServlet"
      method="post">
    <div>
        <label>班级: <select type="text" name="classBatch">
            <option value="">--请选择班级--</option>
            <option value="200720">200720</option>
            <option value="200721">200721</option>
            <option value="200722">200722</option>
        </select></label>
        <label>姓名: <input type="text" name="chineseName" placeholder="请输入姓名"></label>
        <label>性别: <select type="text" name="gender">
            <option value="">--请选择性别--</option>
            <option value="女">女生</option>
            <option value="男">男生</option>
        </select></label>
        <input type="submit" value="查询">
    </div>
</form>
<div style="display: flex;justify-content: center">
    <table border="1" style="text-align: center; ">
        <tr>
            <td>学生ID</td>
            <td>中文名字</td>
            <td>英文名字</td>
            <td>性别</td>
            <td>班级</td>
            <td>电话号码</td>
            <td>邮箱地址</td>
        </tr>
        <c:forEach var="student" items="${requestScope.pageList}">
            <tr>
                <td title="${student.studentId}">${student.studentId}</td>
                <td>${student.chineseName}</td>
                <td>${student.englishName}</td>
                <td>${student.gender}</td>
                <td>${student.classBatch}</td>
                <td>${student.phoneNum}</td>
                <td>${student.email}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div style="display: flex;justify-content: center">
    <form action="${pageContext.request.contextPath}/section7/queryPage" method="post">
        <div>
            当前是第 <input type="number" name="pageNum" readonly value="${requestScope.pageNum+1}">页,
            每页<input type="number" value="${requestScope.pageSize}" name="pageSize">条,
            共 <input type="number" name="total" value="${requestScope.total}" readonly>条数据
            <%--使用隐藏域提交数据--%>
            <input type="hidden" name="submitPageNum" id="submitPageNum">
            <input type="hidden" name="submitClassBatch" value="${requestScope.classBatch}">
        </div>
        <div style="display: flex;justify-content: center">
            <input type="submit" value="首页" onclick="setSubmitPageNum(0)">
            <input type="submit" value="上一页" onclick="setSubmitPageNum(${requestScope.pageNum-1<0?0:requestScope.pageNum-1})">
            <input type="submit" value="下一页" onclick="setSubmitPageNum(${requestScope.pageNum+1>(requestScope.total/requestScope.pageSize)?requestScope.total/requestScope.pageSize:requestScope.pageNum+1})">
            <input type="submit" value="尾页" onclick="setSubmitPageNum(${requestScope.total/requestScope.pageSize})">
        </div>
    </form>
</div>
<script>
    function setSubmitPageNum(flag) {
        document.getElementById("submitPageNum").value=flag;
    }
</script>
</body>
</html>
