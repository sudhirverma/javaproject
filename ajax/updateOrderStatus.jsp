<%@ page import="java.io.*" %><%@ page import="phd.*" %><%@ page import="java.sql.*" %><%

 Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");
    
	response.setContentType("text/text");
	response.setHeader("Cache-Control","no-cache");
	
        int oid=Integer.parseInt((String)request.getParameter("oid"));
        String newstatus=(String)request.getParameter("orderStatus");
        
        String sql = "update orders set orderstatus='"+newstatus+"' where oid="+oid;
		
		out.println(sql);
    
    Statement ps = con.createStatement();
	out.println(ps.executeUpdate(sql));
%>