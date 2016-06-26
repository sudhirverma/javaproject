<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="phd.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/phd", "root", "asdf");
    ArrayList<Pizza> pizzas = new ArrayList();
    Pizza temp;
    Order order;
    
    if(request.getSession().getAttribute("UserOrder")!=null)
        {
             order=(Order)request.getSession().getAttribute("UserOrder");
        }
    else
        {
                        order=new Order();
        }
    
    
    if(Pizza.pizzasList!=null)
    {
        
        pizzas=Pizza.pizzasList;
    }
    else
    {
        
    String sql = "select pizzas.pid, pizzas.name, pizzas.description, pizzas.image from pizzas where type='Veg'";
    String sql2;
    int pid;
    String name, description, image;
    String type = "Veg";
    HashMap price;
    Statement ps = con.createStatement();
    Statement ps2;
    ResultSet rs = ps.executeQuery(sql);
    ResultSet rs2;

    while (rs.next()) {
        pid = rs.getInt(1);
        name = rs.getString(2);
        description = rs.getString(3);
        image = rs.getString(4);

        ps2 = con.createStatement();
        sql2 = "select * from PizzaMenu where pid=" + pid;
        rs2 = ps2.executeQuery(sql2);
        price = new HashMap();
        while (rs2.next()) {
            price.put(rs2.getString("size"), rs2.getDouble("price"));
        }

        pizzas.add(new Pizza(pid, name, type, description, image, price));

        rs2.close();
    }
    
    Pizza.pizzasList=pizzas;

    rs.close();
    con.close();
    
    }
        

%>

<html>
    <head>
        <title>Veg Pizzas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>
        
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript">
            
            function addToOrder(pid)
            {
                var sizes = document.getElementsByName('radio'+pid);
    var size;
    for(var i = 0; i < sizes.length; i++){
    if(sizes[i].checked){
        size = sizes[i].value;
    }
    }
   
	
	var url="ajax/addToOrder.jsp?pid="+encodeURIComponent(pid)+"&size="+encodeURIComponent(size);
	
	if (window.XMLHttpRequest) // Not IE
	{
		//alert("In if ....");
		xhr=new XMLHttpRequest();
	}
	else if (window.ActiveXObject) // IE
	{
		//alert("In Else ...");
		xhr=new ActiveXObject("Microsoft.XMLHTTP");
	}

	if(xhr)
	{
		xhr.open("GET",url,true); 
		xhr.onreadystatechange=callback;
		xhr.send(null);
	}
}

function callback()
{
	if(xhr.readyState==4)
	{
		if(xhr.status==200)
		{
			document.getElementById("items").innerHTML=xhr.responseText;
			$("html, body").animate({ scrollTop: 0 }, "slow");
		}
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

                    <li><a href="admin.jsp">Admin</a></li>
                </ul>
            </div>
            <div id="content-container">
                <div id="content">
                    <h2>
                        Choose your Pizzas
                    </h2>

                    <%               for (Pizza pizza : pizzas) {
                            out.println("<div class='pizza_details'>");
                            out.println("<h3>" + pizza.getName() + "</h3>");
                            out.println("<img src='" + pizza.getImage() + "' />");
                            out.println("<div class='desc'>");
                            out.println(pizza.getDescription() + "<br/>");
                            out.println("<b>Select Size</b><br/>");

                            Set set = pizza.getPrice().entrySet();
                            Iterator i = set.iterator();
                            while (i.hasNext()) {

                                Map.Entry me = (Map.Entry) i.next();
                                out.println("<input id='radio"+pizza.getPid()+"' type='radio' name='radio" + pizza.getPid() + "' value='" + me.getKey().toString() + "' "+(me.getKey().equals("Medium") ? " checked" : "")+" /> " + me.getKey().toString()+" (Rs. "+me.getValue().toString()+")<br/>");
                            }

                            out.println("<input type='button' onClick='addToOrder("+pizza.getPid()+")' name='"+pizza.getPid()+"' value='Add to Order'>");
                            out.println("");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    %>


                </div>
                <div id="aside">
                    <h3>
                        You Order
                    </h3>
                    <p>


                    <div id="items">

                        <% 
                                if(order.getPizzasX().size()>0)
                                {
                        %>

                        <form action="cart.jsp" method="post">


                            <table class="gridtable">
                                <tr><th>Your Pizza</th><th>Size</th><th>Quantity</th><th>Amount</th></tr>
                                        <%                   int i = 1;
                                            for (PizzaOrdered pizza : order.getPizzasX()) {
                                                out.println("<tr><td>" + pizza.getPizza().getName() + "</td><td> " + pizza.getSize() + "</td><td>" + pizza.getQuantity() + "</td><td> " + pizza.getPizzaTotal() + "</td></tr>");
                                          
                                                i++;
                                            }
                                        %>
                                <tr><th colspan="3">Total Bill Amount</th><th id="totalBill">Rs. <%=order.getTotalAmount()%></th></tr>
                                <tr><td colspan="4" style="text-align:right;"><input type="submit" value="Proceed"></td></tr>
                            </table>
                        </form>

                        <% 
}
else
out.println("Please add some pizzas to build your order");
                        %>





                    </div></p>
                </div>
                <div id="footer">
                    Sudhir Verma<br/>
                </div>
        </div>
</div>



    </body>
</html>

