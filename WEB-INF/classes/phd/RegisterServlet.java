package phd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String name = request.getParameter("name");
        String phoneno = request.getParameter("phoneno");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String message;
        String url;

        User user = new User(name, phoneno, address, email, username, password);
        System.out.println("Debugging message 1");
        if ((message = user.checkUsername()) != "Available") {
            System.out.println("Debugging message 2");
            request.setAttribute("message", message);
            url = "ajax/register_fail.jsp";
        } else if ((message = user.checkEmail()) != "Available") {
            System.out.println("Debugging message 3");
            request.setAttribute("message", message);
            url = "ajax/register_fail.jsp";
        } else {
            System.out.println("Debugging message 4");
            if (user.addToDatabase() == 1) {
                request.setAttribute("UserData", user);
                url = "ajax/register_success.jsp";
                System.out.println("Debugging message 5");
            } else {
                message = "Unknown Reason. Please try again later.";
                request.setAttribute("message", message);
                url = "ajax/register_fail.jsp";
                System.out.println("Debugging message 6");
            }
        }
        System.out.println("Debugging message 7");
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}
