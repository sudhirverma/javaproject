<%@ page import="phd.User" %>
<br/><br/>
<b>Registration Failed</b><br/><br/>
<% 
 String message=(String)request.getAttribute("message"); 
%>
<%= message %>