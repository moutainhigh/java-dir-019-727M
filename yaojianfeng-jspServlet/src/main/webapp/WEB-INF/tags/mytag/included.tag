<%@ tag import="java.util.Date" import="java.text.DateFormat" body-content="empty" %>
<%
    DateFormat includeDate = DateFormat.getDateInstance(DateFormat.LONG);
    Date now = new Date(System.currentTimeMillis());
    out.println(includeDate.format(now));
    out.println("date from included.tag");
%>