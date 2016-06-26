<%@ page import="java.sql.*" %><%@ page import="java.util.*" %><%@ page import="phd.*" %><%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");


String name=request.getParameter("name");
String email=request.getParameter("email");
String phoneno=request.getParameter("phoneno");
String address=request.getParameter("address");


    Order order;
	
	if (request.getSession().getAttribute("UserOrder") != null) {
            order = (Order) request.getSession().getAttribute("UserOrder");
            order.calcTotal();
        } else {
		order=new Order();
            String redirectURL = "veg_pizza.jsp";
        response.sendRedirect(redirectURL);
        }

    User temp2 = new User();
    if (request.getSession().getAttribute("UserSession") != null) {
        temp2 = (User) request.getSession().getAttribute("UserSession");
        
    } else {
        String redirectURL = "login.jsp";
        response.sendRedirect(redirectURL);
    }




%>


<!DOCTYPE HTML>
<head>
    <title>Order Status</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <script type="text/javascript"src="js/jquery-1.11.2.min.js"></script>
   
   
       <script type="text/javascript">

	   var myVar=setInterval(function(){updateOrderStatus()},60000);
	   
        function updateOrderStatus()
        {


            var url = "ajax/getOrderStatus.jsp?oid=" + encodeURIComponent(<%=order.getOrder_id()%>);

            if (window.XMLHttpRequest) // Not IE
            {
                xhr = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) // IE
            {
                xhr = new ActiveXObject("Microsoft.XMLHTTP");
            }

            if (xhr)
            {
                xhr.open("GET", url, true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        document.getElementById("orderstatus").innerHTML=xhr.responseText;
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
			<h2>Your Order has been Placed</h2>
			

			
			

                    <P><div class='order_details'>
                            <table class="gridtable" style="width:800px">
                                <tr><th>Your Pizza</th><th>Size</th><th>Quantity</th><th>Amount</th></tr>
                                         <%                   int i = 1;
                                        for (PizzaOrdered pizza : order.getPizzasX()) {
                                            out.println("");
                                            out.println("<tr><td width='400'> " + pizza.getPizza().getName() + " </td><td> " + pizza.getSize() + "</td><td>" + pizza.getQuantity() + "</td><td> " + pizza.getPizzaTotal() + "</td> ");
                                            out.println("</tr>");
                                            i++;
                                        }
                                    %>
                                <tr><th colspan="3">Total Bill Amount</th><th id="totalBill">Rs. <%=order.getTotalAmount()%></th></tr>

                            </table>
                            </P>

                            
                            <label><b>NAME</b> : <%= temp2.getName()%></label><br/>
                            
                            <label><b>E-MAIL </b>: <%= temp2.getEmail()%></label><br/>


                            <label><b>PHONE NO </b>: <%= temp2.getPhoneno()%></label><br/>
                            

                            <label><b>ADDRESS </b>: <%= temp2.getAddress()%></label><br/>
							
							<label><b>ORDER TIME </b>: <%

java.text.SimpleDateFormat sdf
                = new java.text.SimpleDateFormat("hh:mm a");

        String orderTime = sdf.format(order.getOrderDate());
		out.print(orderTime);
%></label><br/>
							
							<label><b>ORDER STATUS </b>: <div id="orderstatus"><%= order.getOrderStatus()%></div></label><br/>
                    </div>

					
					
					
		</div>
		
		<div id="footer">
			Sudhir Verma <br/>
		</div>
	</div>
</div>



 </body>
 </html>

