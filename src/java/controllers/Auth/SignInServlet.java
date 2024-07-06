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
        // This method is currently not used
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // Check if the user is already logged in
        if (currentUser != null) {
            // Redirect to the home page or another appropriate page
            response.sendRedirect("homePage");
            return;
        }

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

        UserDAO userDAO = UserDAO.INSTANCE;
        HttpSession session = request.getSession();

        // Set session timeout to 24 hours
        session.setMaxInactiveInterval(88230);

        boolean emailExists = userDAO.checkEmailExist(email);

        if (!emailExists) {
            // Email does not exist in the database
            request.setAttribute("errorMessage", "Email chưa được đăng ký!");
            returnValueBefore(request, response, email, null); // Set email value
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } else {
            // Authenticate user by email and plaintext password
            User user = userDAO.authenticateUser(email, password);

            if (user != null) {
                // Password correct, set user in session
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

                // Check roleID and redirect accordingly
                int roleID = UserDAO.INSTANCE.getRoleID(user.getEmail());
                if (roleID == 1 || roleID == 3) {
                    response.sendRedirect("manageUser");
                } else {
                    // Redirect to the original URL or home page
                    if (redirectURL != null && !redirectURL.isEmpty()) {
                        response.sendRedirect(redirectURL);
                    } else {
                        response.sendRedirect("homePage");
                    }
                }

            } else {
                // If password is incorrect, show error message and return to login page
                request.setAttribute("errorMessage", "Mật khẩu sai! Vui lòng nhập lại!");
                returnValueBefore(request, response, email, null); // Set email value
                request.getRequestDispatcher("views/login.jsp").forward(request, response);
            }
        }
    }

    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String email, String password) {
        request.setAttribute("emailValid", email);
        request.setAttribute("password", password);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
