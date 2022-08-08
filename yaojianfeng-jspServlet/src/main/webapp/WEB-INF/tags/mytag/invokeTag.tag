<%@ tag language="java" pageEncoding="UTF-8" display-name="invoke" %>
<%@ attribute name="productDetails"  fragment="true"  %>
<!--  因为invoke 是用来调用fragment 的,如果fragment="false" 的话 连续按F5刷新页面会报错 -->
<%@ variable name-given="productName"  %>
<%@ variable name-given="description"  %>
<%@ variable name-given="price"  %>
<%
    jspContext.setAttribute("productName", "某米11");
    jspContext.setAttribute("description","某米手机的描述...");
    jspContext.setAttribute("price",6000);
%>
<jsp:invoke fragment="productDetails" />