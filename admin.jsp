<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="phd.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");

    Order order;

    String sql = "select * from orders where orderstatus!='Order Completed' order by orderdate desc";

    Statement ps = con.createStatement();
    ResultSet rs = ps.executeQuery(sql);
	
        User temp2 = new User();
    if (request.getSession().getAttribute("UserSession") != null) {
        temp2 = (User) request.getSession().getAttribute("UserSession");
		
                if(!temp2.getUsername().equals("pizzaadmin"))
                {
%>
<!DOCTYPE HTML>
<head>
    <title>Manage Pizzas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>
    <div id="container">
        <div id="header">
            <h1>
                Pizza Hut
            </h1>
        </div>
        <div id="navigation">
            <ul>
                <li><a href="veg_pizza.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>

                <% if (request.getSession().getAttribute("UserSession") != null) { %>
                <li><a href="logout.jsp">Logout</a></li>
                    <% } else { %>

                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                    <% } %>
            </ul>
        </div>
        <div id="content-container">
            <div id="content">
                <h2>Manage Orders</h2>
                You are not allowed to access this page.
            </div>

            <div id="footer">
                Sudhir Verma<br/>
            </div>
        </div>
    </div>
</body>
</html>
<%	
}
else
{
			
%>




<!DOCTYPE HTML>
<head>
    <title>Manage Pizzas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <script type="text/javascript"src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        function updateStatus(i)
        {

            var newstatus = document.getElementById("oid" + i).value;
            var url = "ajax/updateOrderStatus.jsp?oid=" + encodeURIComponent(i) + "&orderStatus=" + encodeURIComponent(newstatus);
            var buttonHTML = document.getElementById("button" + i).innerHTML;

            if (window.XMLHttpRequest) // Not IE
            {
                //alert("In if ....");
                xhr = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) // IE
            {
                //alert("In Else ...");
                xhr = new ActiveXObject("Microsoft.XMLHTTP");
            }

            if (xhr)
            {
                xhr.open("GET", url, true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        if (newstatus == "Order Completed")
                        {
                            $("#row" + i).html("<td style='text-align:center;' colspan='6'>Order Completed</td>").fadeOut("slow");
                        }
                        else
                        {
                            $("#button" + i).html("Updated").fadeOut(2000);

                            setTimeout(function () {

                                $("#button" + i).html(buttonHTML).fadeIn("slow");

                            }, 2000);


                        }
                    }
                }
                xhr.send(null);
            }
        }

    </script>
</head>
<body>






    <div id="container">
        <div id="header">
            <h1>
                Pizza Hut
            </h1>
        </div>
        <div id="navigation">
            <ul>
                <li><a href="veg_pizza.jsp">Home</a></li>
                <li><a href="cart.jsp">Cart</a></li>

                <% if (request.getSession().getAttribute("UserSession") != null) { %>
                <li><a href="logout.jsp">Logout</a></li>
                    <% } else { %>

                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                    <% } %>
            </ul>


        </div>
        <div id="content-container">
            <div id="content">
                <h2>Manage Orders</h2>


                <P><div class='order_details'>
                    <form action="checkout.jsp"t method="post">
                        <table class="gridtable" style="width:800px">
                            <tr><th>Order ID</th><th>User ID</th><th>Total Bill Amount</th><th>Order Time</th><th colspan="2">Order Status</th></tr>
                                    <%
                                                                            java.text.SimpleDateFormat sdf
            = new java.text.SimpleDateFormat("hh:mm a");
java.util.Date date=null;
										
                                        while (rs.next()) {
											
                                                                                    Timestamp timestamp = rs.getTimestamp(3);
if (timestamp != null)
date = new java.util.Date(timestamp.getTime());
                                            out.println("");
                                            out.println("<tr id='row" + rs.getString(1) + "'><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td> Rs. " + rs.getString(5) + "</td><td>" + sdf.format(date) + "</td>");
                                            out.println("<td>");
                                    %>
                            <select id="<%= "oid" + rs.getString(1)%>">
                                <option value="Order Placed" <% if (rs.getString(4).equals("Order Placed")) {
                                        out.print("Selected");
                                    } %>> Order Placed </option>
                                <option value="Order Dispatched" <% if (rs.getString(4).equals("Order Dispatched")) {
                                        out.print("Selected");
                                    } %>> Order Dispatched </option>
                                <option value="Order Completed" <% if (rs.getString(4).equals("Order Completed")) {
                                        out.print("Selected");
                                    } %>> Order Completed </option>
                                <%
                                        out.println("</select></td><td id='button" + rs.getString(1) + "'><input type='button' onclick='updateStatus(" + rs.getString(1) + ")' value='Update'></td></tr>");

                                    }
                                %>
                        </table>
                        </P>


                    </form>
                </div>




            </div>

            <div id="footer">
                Sudhir Verma  <br/>
            </div>
        </div>
    </div>



</body>
</html>



<%
			
			
}
        
} else {
String redirectURL = "login.jsp";
response.sendRedirect(redirectURL);
}

%>
