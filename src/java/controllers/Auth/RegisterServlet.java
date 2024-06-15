package controllers.Auth;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import models.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import util.Validate;
import java.time.LocalDateTime;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = UserDAO.INSTANCE;

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String avatar = request.getParameter("avatar");

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String registerEmail = request.getParameter("registerEmail");
        String termsAndConditions = request.getParameter("iAgree");
        boolean status = false;
        String errorMessage = "";
        String successMessage = "";

        if (Boolean.valueOf(registerEmail)) {
            request.setAttribute("registerEmail", true);
        }
        if (avatar != null) {
            request.setAttribute("avatar", avatar);
        }

        if (name.isEmpty() || password.isEmpty() || email.isEmpty() || phoneNumber.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidName(name)) {
            request.setAttribute("errorMessage", "Name invalid!");
            returnValueBefore(request, response, null, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidPhoneNumber(phoneNumber)) {
            String messPhone = "Phone Number invalid!";
            if (!phoneNumber.startsWith("0") && phoneNumber.length() == 10 && Validate.isNumber(phoneNumber)) {
                messPhone = "Phone must start with 0";
            }
            request.setAttribute("errorMessage", messPhone);
            returnValueBefore(request, response, name, email, null);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidEmail(email)) {
            request.setAttribute("errorMessage", "Email invalid!");
            returnValueBefore(request, response, name, null, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        User userExists = userDAO.getUserByEmail(email);
        if (userExists != null) {
            request.setAttribute("errorMessage", "Email already exists!");
            returnValueBefore(request, response, name, null, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password needs at least 8 characters, 1 normal character, 1 uppercase character, 1 numeric character!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Confirm password does not match password!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (termsAndConditions == null) {
            request.setAttribute("errorMessage", "Please agree with our Terms and Conditions and Privacy Statement");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        // Hash the password using bcrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        LocalDateTime now = LocalDateTime.now();


        User newUser = new User();
        newUser.setName(name);
        newUser.setHashedPassword(hashedPassword); // Save hashed password
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setRoleId(2);
        newUser.setAvatar(avatar);
        newUser.setCreatedBy(email);
        newUser.setUpdatedBy(email);
        newUser.setCreatedDate(now);

        status = userDAO.addUser(newUser);
        successMessage = "Registered successfully!";
        HttpSession session = request.getSession();
        session.setAttribute("successMessage", successMessage);
        session.setAttribute("currentUser", userDAO.getUserByEmail(email));
        session.setMaxInactiveInterval(Integer.MAX_VALUE);
        request.setAttribute("isRegister", true);
        request.getRequestDispatcher("views/homePage.jsp").forward(request, response);
    }

    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String name, String email, String phoneNumber) {
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
