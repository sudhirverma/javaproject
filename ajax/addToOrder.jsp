<%@page import="java.util.*"%><%@ page import="java.io.*" %><%@ page import="phd.*" %><%
    response.setContentType("text/text");
    response.setHeader("Cache-Control", "no-cache");
    
    int pid = Integer.parseInt((String) request.getParameter("pid"));
    String size = (String) request.getParameter("size");
    Order order;
    if (request.getSession().getAttribute("UserOrder") != null) {
        order = (Order) request.getSession().getAttribute("UserOrder");
    } else {
        order = new Order();
    }
    
    Pizza newpizza=null;    
    
    for (Pizza temp : Pizza.pizzasList) {
        if (temp.getPid() == pid) {
            newpizza = temp;
            newpizza.setSize(size);
            newpizza.setAmount();
            break;
        }
    }
    
    order.addToOrder(newpizza);
    order.calcTotal();
    request.getSession().setAttribute("UserOrder", order);
    

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