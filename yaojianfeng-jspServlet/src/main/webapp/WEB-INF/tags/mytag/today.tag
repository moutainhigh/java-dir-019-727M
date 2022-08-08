<%@ tag import="java.util.Date" import="java.text.DateFormat" pageEncoding="UTF-8" language="java" %>
<%@ variable name-given="longDate" %>
<%@ variable name-given="shortDate" %>
<%
    DateFormat longDate = DateFormat.getDateInstance(DateFormat.LONG);
    DateFormat shortDate = DateFormat.getDateInstance(DateFormat.SHORT);
    Date now = new Date(System.currentTimeMillis());
//    out.println(longDate.format(now));
//    out.println(shortDate.format(now));
    jspContext.setAttribute("longDate",longDate.format(now));
    jspContext.setAttribute("shortDate",shortDate.format(now));
//    request.setAttribute("longDate",longDate.format(now));
//    request.setAttribute("shortDate",shortDate.format(now));
%>
<jsp:doBody/>