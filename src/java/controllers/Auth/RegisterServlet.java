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
import java.io.PrintWriter;

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
        String name = request.getParameter("name");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String termsAndConditions = request.getParameter("iAgree"); // This will get "terms-and-conditions" if checkbox is checked
        boolean status = false;
        String errorMessage = "";
        String successMessage = "";

        if (termsAndConditions != null) {
            // Validate input
            if (name.isEmpty() || userName.isEmpty() || password.isEmpty() || email.isEmpty() || phoneNumber.isEmpty()) {
                errorMessage = "All fields are required!";
            } else {
                User newUser = new User();
                newUser.setName(name);
                newUser.setUserName(userName);
                newUser.setPassword(password);
                newUser.setEmail(email);
                newUser.setPhoneNumber(phoneNumber);

                UserDAO userDAO = UserDAO.INSTANCE;
                try {
                    status = userDAO.addUser(newUser);
                    if (status) {
                        successMessage = "Register successfully!!!";
                        HttpSession session = request.getSession();
                        session.setAttribute("successMessage", successMessage);
                        session.setAttribute("userName", userName);
                        session.setAttribute("password", password);
                        session.setMaxInactiveInterval(3600);
                        request.getRequestDispatcher("homePage").forward(request, response);
                        return; // Exit the method to prevent further processing
                    } else {
                        errorMessage = "Something went wrong! Please try again!";
                    }
                } catch (Exception e) {
                    errorMessage = "An error occurred: " + e.getMessage();
                }
            }
        } else {
            errorMessage = "Please agree with our Terms and Conditions and Privacy Statement";
        }
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("/register").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Servlet";
    }
}
