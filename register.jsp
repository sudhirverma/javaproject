<html>
    <head>
        <title>Register at PHD</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style2.css" rel="stylesheet" type="text/css" media="all"/>
        <script type="text/javascript" src="js/validations.js"></script>
        <script type="text/javascript"src="js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $("#registerform").submit(function () {
                    event.preventDefault();
                    if (formValidation())
                    {
                        console.log("Submitting the form");
                        $("#result").hide();

                        var form = $(this);

                        usernameX = $("input[name='username']").val();
                        passwordX = $("input[name='password']").val();
                        nameX = $("input[name='name']").val();
                        phonenoX = $("input[name='phoneno']").val();
                        emailX = $("input[name='email']").val();
                        addressX = $("textarea[name='address']").val();


                        $.post("RegisterServlet",
                                {
                                    username: usernameX,
                                    password: passwordX,
                                    name: nameX,
                                    phoneno: phonenoX,
                                    email: emailX,
                                    address: addressX
                                },
                        function (data, status) {
                            $("#theform").hide();
                            $("#result").html(data).fadeIn("slow");
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
                        Register Below
                    </h2>

                    <div id="theform">
                        <form id="registerform" name="registerform" method="post">
                            <table style="text-align:right">
                                <tr> <td><label>USERNAME :</label> </td>
                                    <td><input type="text" name="username"></td></tr>

                                <tr> <td><label>PASSWORD :</label></td>
                                    <td><input type="password" name="password"></td></tr>

                                <tr> <td><label>NAME :</label></td>
                                    <td><input type="text" name="name"></td></tr>
                                <tr> <td><label>E-MAIL :</label></td>
                                    <td><input type="text" name="email"></td></tr>


                                <tr> <td><label>PHONE NO :</label></td>
                                    <td><input type="text" name="phoneno"></td></tr>
                            </table>
                            <label>ADDRESS :</label><br/>
                            <textarea rows="10" cols="50" name="address"></textarea><br/><br/>
                            <input type="submit" value="Submit" id="submit">
                        </form>
                        <br/>
                    </div><div id="result"></div>



                </div>

                <div id="footer">
                    Made by Amandeep Singh (14030142029) & Sudhir Verma (14030142005) <br/>
                    MSc CA 2014-16 (SICSR)
                </div>
            </div>
        </div>



    </body>
</html>

