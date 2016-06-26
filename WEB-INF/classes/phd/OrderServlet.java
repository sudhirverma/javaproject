package phd;

import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

public class OrderServlet extends HttpServlet {

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("Debug 1");
        User current = (User) request.getSession().getAttribute("UserSession");
        System.out.println("Debug 2" + current.getName());
        int uid = Integer.parseInt(current.getUid());
        System.out.println("Debug 3");
        String orderStatus = "Order Placed";
        Order order = (Order) request.getSession().getAttribute("UserOrder");
        order.setUid(uid);
        order.setOrderDate(new Date());
        String url = "";
        order.setOrderStatus("Order Placed");

        if (order.placeOrder() == 1) {
            request.getSession().setAttribute("UserOrder", order);
            url = "orderStatus.jsp";
            System.out.println("Debugging message 5");
        } else {

            url = "ajax/register_fail.jsp";
            System.out.println("Debugging message 6");
        }

        response.sendRedirect(url);
    }

    public void destroy() {
    }
}
