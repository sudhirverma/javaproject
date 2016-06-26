<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="phd.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");

    Order order;

    if (request.getSession().getAttribute("UserOrder") != null) {
        order = (Order) request.getSession().getAttribute("UserOrder");
        order.calcTotal();
    } else {
        order = new Order();
    }


%>


<!DOCTYPE HTML>
<head>
    <title>Pizza Hut - You Cart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>

    <script type="text/javascript"src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">

        function removeFromOrder(i, pid, size)
        {


            var url = "ajax/removeFromOrder.jsp?pid=" + encodeURIComponent(pid) + "&size=" + encodeURIComponent(size);

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

                        var xmlDocument = xhr.responseXML;
                        var mydata = xmlDocument.getElementsByTagName("detail");
                        if (parseInt(mydata[0].firstChild.data) == 0)
                        {
                            $("#" + "row" + i).fadeOut();
                            document.getElementById("totalBill").innerHTML = mydata[2].firstChild.data;
                        }
                        else {
                            document.getElementById("quantity" + i).innerHTML = mydata[0].firstChild.data;
                            document.getElementById("total" + i).innerHTML = mydata[1].firstChild.data;
                            document.getElementById("totalBill").innerHTML = mydata[2].firstChild.data;
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
                <h2>View Cart</h2>


                <div class='order_details'>
                    <form action="checkout.jsp"t method="post">
                        <table class="gridtable" style="width:800px">
                            <tr><th>Your Pizza</th><th>Size</th><th>Quantity</th><th>Amount</th></tr>


                            <%           if(order.getPizzasX().size()>0)
{
                                                                int i = 1;
                                for (PizzaOrdered pizza : order.getPizzasX()) {
                                    out.println("");
                                    out.println("<tr id='row" + i + "'><td width='400'> " + pizza.getPizza().getName() + " <br><a onClick='removeFromOrder(" + i + "," + pizza.getPizza().getPid() + ",\"" + pizza.getSize() + "\")'>Remove</a></td><td> " + pizza.getSize() + "</td><td id='quantity"+i+"'>" + pizza.getQuantity() + "</td><td id='total"+i+"'> " + pizza.getPizzaTotal() + "</td> ");
                                    out.println("</tr>");
                                    i++;
                                }
                            %>


                            <tr><th colspan="3">Total Bill Amount</th><th id="totalBill">Rs. <%=order.getTotalAmount()%></th></tr>
                            <tr><td colspan="4" style="text-align:right;"><input type="submit" value="Place Order"></td></tr>

                            <% }
                            else{
                            out.println("<tr><td colspan='4'>Your order is empty</td></tr>");
                            }
							
							
                            %>
                        </table>


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

