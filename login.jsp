<%@ page import="phd.*" %>
<%
User temp = null;
    Order order = null;
    if (request.getSession().getAttribute("UserSession") != null) {
	String redirectURL="";
        if (request.getSession().getAttribute("UserOrder") != null) {
            
            order = (Order) request.getSession().getAttribute("UserOrder");
            order.calcTotal();
            if (order.getTotalAmount() == 0) {
                redirectURL = "veg_pizza.jsp";
            }
            else {
                redirectURL = "checkout.jsp";
            }
            
        }
		else
		{
		redirectURL = "veg_pizza.jsp";
		}
		
                response.sendRedirect(redirectURL);
    }
%>
<html>
<head>
<title>Login at Pizza Hut</title>
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/validations.js"></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    $("#loginform").submit(function () {
        event.preventDefault();
        if (loginformValidation())
        {
            $("#result").hide();
			
            var form = $(this);

            usernameX = $("input[name='username']").val();
            passwordX = $("input[name='password']").val();


            $.post("LoginServlet",
                    {
                        username: usernameX,
                        password: passwordX
                    },
            function (data, status) {
				if(data==="Login Successful")
				{
				window.history.back();
				}
				else
				{
				 $("#result").html(data).fadeIn("slow");
				}
            }, "html");


        }
        return false;
    });
});

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
			<h2>
				Login Below
			</h2>
			 
			 <div id="theform">
		    <form id="loginform" name="loginform" method="post">
		    
		    <label>USERNAME :</label> 
		    <input type="text" name="username"><br/>
			
			<label>PASSWORD :</label>
		    <input type="password" name="password"><br/>
			
		   <input type="submit" value="Submit" id="submit"><br/>
		   <div id="result"></div>
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

