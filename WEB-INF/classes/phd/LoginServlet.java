package phd;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        String message = "Login Successful";
        User user = new User(username, password);
        Order order;

        if (user.login() == true) {
            request.getSession().setAttribute("UserSession", user);
        } else {
            message = "Invalid User Login Details";
        }
        out.print(message);
        out.close();
    }

    public void destroy() {
    }
}
