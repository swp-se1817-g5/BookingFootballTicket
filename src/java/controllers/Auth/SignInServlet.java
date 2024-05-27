package controllers.Auth;

import dal.UserDAO;
import models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SignInServlet", urlPatterns = {"/login"})
public class SignInServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = UserDAO.INSTANCE;
        HttpSession session = request.getSession();
        //get user by email and password
        User user = userDAO.authenticateUser(email, password);
        //if exist will set in seesion, may be set email and password or user 
        if (user != null) {
           session.setAttribute("currentUser", user);
           //redirect to home page or check any thing before redirect to home page
           request.getRequestDispatcher("index.html").forward(request, response);
        } else {
            //if not exits throw message ro view to display
            request.setAttribute("errorMessage", "Email or password may be wrong ! Please try again! ");
            request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
        }

    }


    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
