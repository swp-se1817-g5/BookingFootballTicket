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
        String redirectURL = request.getParameter("redirectURL");

        if (email != null && password != null) {
            request.setAttribute("emailValid", email);
            request.setAttribute("passValid", password);
        }

        if (redirectURL == null || redirectURL.isEmpty()) {
            redirectURL = request.getHeader("Referer");
        }

        request.setAttribute("redirectURL", redirectURL);
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember_me");
        String redirectURL = request.getParameter("redirectURL");

        System.out.println("remember = " + remember);
        UserDAO userDAO = UserDAO.INSTANCE;
        HttpSession session = request.getSession();

        // Authenticate user by email and plaintext password
        User user = userDAO.authenticateUser(email, password);

        // If user exists, set in session, maybe set email and password or user
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
            session.setAttribute("isFirstLogin", true);

            // Redirect to the original URL
            if (redirectURL != null && !redirectURL.isEmpty()) {
                response.sendRedirect(redirectURL);
            } else {
                response.sendRedirect("homePage");
            }
        } else {
            // If not exists, throw message to view to display
            request.setAttribute("errorMessage", "Email or password may be wrong! Please try again!");
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
