package controllers.Auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the current session, but don't create one if it doesn't exist

        if (session != null) {
            session.invalidate(); // Invalidate the session, removing all attributes
        }

        response.sendRedirect("homePage"); // Redirect to the login page or home page
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Delegate to doGet to handle both GET and POST requests
    }

    @Override
    public String getServletInfo() {
        return "Logout Servlet";
    }
}
