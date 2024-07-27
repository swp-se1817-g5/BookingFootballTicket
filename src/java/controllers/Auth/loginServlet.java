package controllers.Auth;

import dal.UserDAO;
import models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method is currently not used
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (User) (session != null ? session.getAttribute("currentUser") : null);

        // Redirect to login page if the user is not logged in
        if (currentUser == null) {
            String email = null;
            String password = null;

            // Get cookies from the request
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("emailSave".equals(cookie.getName())) {
                        email = cookie.getValue();
                    } else if ("passSave".equals(cookie.getName())) {
                        password = cookie.getValue();
                    }
                }
            }

            // Set attributes to pre-fill login form
            if (email != null) {
                request.setAttribute("emailValid", email);
            }
            if (password != null) {
                request.setAttribute("passValid", password);
            }

            String redirectURL = request.getParameter("redirectURL");
            if (redirectURL == null || redirectURL.isEmpty()) {
                redirectURL = request.getHeader("Referer");
            }

            request.setAttribute("redirectURL", redirectURL);
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } else {
            // If the user is already logged in, redirect to the home page or another appropriate page
            response.sendRedirect("homePage");
        }
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

        User userByEmail = userDAO.getAllUserInDB(email);

        if (userByEmail == null) {
            // Email does not exist in the database
            request.setAttribute("errorMessage", "Email chưa được đăng ký !");
            returnValueBefore(request, response, email, null);
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } else if (!userByEmail.isStatus()) {
            // Account is locked
            request.setAttribute("errorMessage", "Tài khoản của bạn đã bị cấm do vi phạm điều khoản và điều lệ của chúng tôi !");
            returnValueBefore(request, response, email, null);
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } else {
            // Authenticate user by email and plaintext password
            User user = userDAO.authenticateUser(email, password);

            if (user != null) {
                // Password correct, set user in session
                session.setAttribute("currentUser", user);

                if (remember != null && remember.equals("on")) {
                    // Create cookies for email and password
                    Cookie emailCookie = new Cookie("emailSave", email);
                    Cookie passwordCookie = new Cookie("passSave", password);

                    // Set cookie lifespan to 30 days
                    emailCookie.setMaxAge(30 * 24 * 60 * 60);
                    passwordCookie.setMaxAge(30 * 24 * 60 * 60);

                    // Add cookies to response
                    response.addCookie(emailCookie);
                    response.addCookie(passwordCookie);
                } else {
                    // Remove cookies if "remember me" is not checked
                    Cookie emailCookie = new Cookie("emailSave", "");
                    Cookie passwordCookie = new Cookie("passSave", "");

                    // Set cookies expiry time to 0 to delete them
                    emailCookie.setMaxAge(0);
                    passwordCookie.setMaxAge(0);

                    // Add cookies to response
                    response.addCookie(emailCookie);
                    response.addCookie(passwordCookie);
                }

                // Popup
                session.setAttribute("isFirstLogin", true);

                // Check roleID and redirect accordingly
                int roleID = UserDAO.INSTANCE.getRoleID(user.getEmail());
                if (roleID == 1 || roleID == 3) {
                    response.sendRedirect("dashboard");
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
