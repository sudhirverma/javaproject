<%@ page import="java.sql.*" %><%@ page import="java.util.*" %><%@ page import="phd.*" %><%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");

    Order order;
	
        if (request.getSession().getAttribute("UserOrder") != null) {
            order = (Order) request.getSession().getAttribute("UserOrder");
            order.calcTotal();
        } else {
                order=new Order();
                if(order.getPizzasX().size()<1)
                {
            String redirectURL = "veg_pizza.jsp";
        response.sendRedirect(redirectURL);
                }
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
    <title>Checkout</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <script type="text/javascript"src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">


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
                <h2>Checkout</h2>


                <div class='order_details'>
                    <form action="checkout.jsp">
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

                    </form>

                    <br/>
                    <h3>Your Details</h3>
                    <form id="checkout" name="checkout" method="post" action="OrderServlet">



                        <label>NAME :</label>
                        <input type="text" name="name" value="<%= temp2.getName()%>"><br/>
                        <label>E-MAIL :</label>
                        <input type="text" name="email" value="<%= temp2.getEmail()%>"><br/>


                        <label>PHONE NO :</label>
                        <input type="text" name="phoneno" value="<%= temp2.getPhoneno()%>"><br/>

                        <label>ADDRESS :</label><br/>
                        <textarea name="address" rows="4" cols="50"><%= temp2.getAddress()%></textarea><br/>
                        <input type="submit" value="Confirm Order">
                    </form>
                </div>





            </div>

            <div id="footer">
                Sudhir Verma <br/>
            </div>
        </div>
    </div>



</body>
</html>

