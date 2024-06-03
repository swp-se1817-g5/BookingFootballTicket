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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("emailSave");
        String password = (String) session.getAttribute("passSave");

        if (email != null && password != null) {
            request.setAttribute("emailValid", email);
            request.setAttribute("passValid", password);
        }

        request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember_me");
        System.out.println("remember = " + remember);
        UserDAO userDAO = UserDAO.INSTANCE;
        HttpSession session = request.getSession();

        // Get user by email and password
        User user = userDAO.authenticateUser(email, password);

        // If exist, set in session, maybe set email and password or user
        if (user != null) {
            session.setAttribute("currentUser", user);

            if (remember != null && remember.equals("on")) {
                session.setAttribute("emailSave", email);
                session.setAttribute("passSave", password);
            } else {
                session.removeAttribute("emailSave");
                session.removeAttribute("passSave");
            }

            // Popup
            request.setAttribute("isFirstLogin", true);

            // Redirect to home page or check anything before redirect to home page
            request.getRequestDispatcher("views/homePage.jsp").forward(request, response);
        } else {
            // If not exists, throw message to view to display
            request.setAttribute("errorMessage", "Email or password may be wrong! Please try again!");
            request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
