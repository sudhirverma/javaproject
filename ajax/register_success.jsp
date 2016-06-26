<%@ page import="phd.User" %>

<br><br>
<b>Success</b>
<br/><br/>
Please use your new username and password to login and order your favorites pizza online.
<br/><br/>
<%
User user=(User)request.getAttribute("UserData");
out.println("<label>Username - "+user.getUsername()+"</label><br>\n");
out.println("<label>E-Mail - "+user.getEmail()+"</label>");
%>
