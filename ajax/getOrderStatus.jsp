<%@ page import="java.io.*" %><%@ page import="phd.*" %><%@ page import="java.sql.*" %><%

 Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");
    
        response.setContentType("text/text");
        response.setHeader("Cache-Control","no-cache");
	
        int oid=Integer.parseInt((String)request.getParameter("oid"));
        String newstatus;
        
        String sql = "select orderstatus from orders where oid="+oid;
		
    Statement ps = con.createStatement();
                ResultSet rs = ps.executeQuery(sql);
                if(rs.next())
                {
                out.print(rs.getString(1));
                }
    
%>