<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body style="background-color: gray">
<h1><%= "Hello World!" %>
</h1>
<h2>欢迎 <span style="color: red">${sessionScope.username}</span>来到JSP&Servlet的世界!</h2>
<h3>登录时间是: <span style="color:blue">${sessionScope.loginDate}</span></h3>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br/>
<a href="showHello">hello,请点击我!</a>
<a href="${pageContext.request.contextPath}/my001/index.html">my001</a>
<a href="${pageContext.request.contextPath}/H5DemoCode/index.html">H5DemoCode</a>
<form action="showHello" method="post" name="testForm">
    <label>
        姓名：
        <input type="text" name="myName">
    </label>
    <label>
        住址：
        <input type="text" name="address">
    </label>
    <label>
        爱好：
        <select name="hobby" multiple>
            <option value="banana">香蕉</option>
            <option value="apple">苹果</option>
            <option value="Pineapple">菠萝</option>
            <option value="lemon">柠檬</option>
        </select>
    </label>
    <input type="submit" value="提交到showHello">
    <input type="submit" formaction="servletRequestDemo" value="提交到servletRequestDemo">
</form>
<a href="showImage">字节流显示图片</a>
<a href="showImageByTag">HTML标签加载图片</a>
<a href="servletContextDemo">servletContextDemo演示文档</a>
<a href="httpServletRequestDemo">httpServletRequest演示文档</a>
<a href="servletRequestDemo">servletRequestDemo演示文档</a>
<br>
<div style="border: 1px solid red;display: inline-block">
    <label style="color: deeppink;font-size: 20px"> section3</label>
    <br/>
    <a href="${pageContext.request.contextPath}/jeff/section3/login.html">登录</a>
    <a href="${pageContext.request.contextPath}/jeff/section3/register.html">注册</a>
    <a href="${pageContext.request.contextPath}/section3/reWriteUrl">重写url</a>
    <a href="${pageContext.request.contextPath}/section3/cookie">写入cookie</a>
    <a href="${pageContext.request.contextPath}/section3/httpSessionDemo">演示HttpSession</a>
    <a href="${pageContext.request.contextPath}/section3/sendError">sendError</a>
    <a href="${pageContext.request.contextPath}/section3/setStatus">setStatus</a>
    <a href="${pageContext.request.contextPath}/section3/writeLog">writeLog</a>
</div>
<br/>
<div style="border: 1px solid green;display: inline-block">
    <label style="color: darkblue;font-size: 20px"> section4</label>
    <br/>
    <a href="${pageContext.request.contextPath}/section4/includeServlet">请求分派器-include</a>
    <a href="${pageContext.request.contextPath}/section4/forward?path=">请求分派器-forward</a>
    <a href="${pageContext.request.contextPath}/jeff/section4/compute.html">计算器页面</a>
    <a href="${pageContext.request.contextPath}/section4/randomProject">随机选择项目</a>

</div>
<br/>
<div style="border: 1px solid green;display: inline-block">
    <label style="color: darkblue;font-size: 20px"> section5</label>
    <br/>
    <a href="${pageContext.request.contextPath}/jeff/section5/showTimeDemo.jsp">jsp入门演示文档</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/randomProject.jsp">随机选择项目</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/staticIncludeDemo.jsp">静态引入-include</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/actionDemo.jsp">动作演示文档</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/includeDemo.jsp">JSP动作-include</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/forwardDemo.jsp">JSP动作-forward</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/useBeanDemo.jsp">使用javaBean</a>
    <a href="${pageContext.request.contextPath}/jeff/section5/willException.jsp">发生异常的页面</a>
</div>


<br/>
<div style="border: 1px solid green;display: inline-block">
    <label style="color: darkblue;font-size: 20px"> section6</label>
    <br/>
    <a href="${pageContext.request.contextPath}/jeff/section6/ShowIpTag.jsp">自定义标签入门-无标签体</a>
    <a href="${pageContext.request.contextPath}/jeff/section6/toUpperCaseDemo.jsp">有标签体-demo1</a>
    <a href="${pageContext.request.contextPath}/jeff/section6/ifTest.jsp?flagNum=1">有属性-demo1</a>
    <a href="${pageContext.request.contextPath}/jeff/section6/includeFileDemo.jsp">使用include引入资源文件</a>
    <a href="${pageContext.request.contextPath}/jeff/section6/useTagFileDemo.jsp">使用标签文件</a>

</div>

<br/>
<div style="border: 1px solid green;display: inline-block">
    <label style="color: black;font-size: 20px"> section7</label>
    <br/>
    <a href="${pageContext.request.contextPath}/section7/queryStudentInfoServlet">学生信息列表查询</a>

</div>
<div style="border: 1px solid green;display: inline-block">
    <label style="color: black;font-size: 20px"> section8</label>
    <br/>
    <a href="${pageContext.request.contextPath}/jeff/section8/getDataDemo.jsp">使用EL获取数据</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/emptyDemo.jsp">使用empty判断是否为空</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/visitInternalObj.jsp">使用EL访问隐式对象</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/visitJavabean.jsp">使用EL访问javaBean</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/loginTest.jsp">登录测试</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/myELFunction.jsp">EL自定义函数</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/useJSTL.jsp">使用JSTL</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/coreDemo1.jsp">JSTL核心标签库(了解)</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/coreDemo2.jsp">JSTL核心标签库(重点)</a>
    <a href="${pageContext.request.contextPath}/jeff/section8/redirectDemo3.jsp">JSTL核心标签库(其他)</a>
</div>
</body>
</html>