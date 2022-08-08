<%@ tag description="此处是书写标签描述的地方"  pageEncoding="UTF-8" body-content="empty"%>
<%--可以指定正常或片段属性列表: --%>
<%@ attribute name="message" required="true"  %>
<%-- 可以在此处指定任何内容，例如: --%>
<h2 style="color: red;background-color: blue">${message.toUpperCase()}</h2>
