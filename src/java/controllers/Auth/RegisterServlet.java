package controllers.Auth;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import util.Validate;

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
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String termsAndConditions = request.getParameter("iAgree"); // This will get "terms-and-conditions" if checkbox is checked
        boolean status = false;
        String errorMessage = "";
        String successMessage = "";

        // Validate input
        if (name.isEmpty() || userName.isEmpty() || password.isEmpty() || email.isEmpty() || phoneNumber.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required!");
            returnValueBefore(request, response, name, userName, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidName(name)) {
            request.setAttribute("errorMessage", "Name invalid");
            //if field is error will null else will return value input before
            returnValueBefore(request, response, null, userName, email, phoneNumber);
            //the page will return
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        User userExistName = userDAO.getUserByUserName(userName);
        if (userExistName != null) {
            request.setAttribute("errorMessage", "userName have exist");
            returnValueBefore(request, response, name,  null, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        
        if (!Validate.isValidPhoneNumber(phoneNumber)) {
            request.setAttribute("errorMessage", "phone invalid");
            returnValueBefore(request, response, name, userName, email, null);
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        User userExistsPhone = userDAO.getUserByPhone(phoneNumber);
        if (userExistsPhone != null) {
            request.setAttribute("errorMessage", "Phone number have exist");
            returnValueBefore(request, response, name, userName, email, null);
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        if (!Validate.isValidEmail(email)) {
            request.setAttribute("errorMessage", "email invalid");
            returnValueBefore(request, response, name, userName, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        
        User userExists = userDAO.getUserByEmail(email);
        if (userExists != null) {
            request.setAttribute("errorMessage", "Email have exits!");
            returnValueBefore(request, response, name, userName, null, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        // Mật khẩu cần ít nhất 8 kí tự, 1 kí tự thường, 1 kí tự in hoa, 1 kí tự số
        if (!Validate.isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password needs at least 8 characters, 1 normal character, 1 uppercase character, 1 numeric character");
            dispatch(request, response, "/views/register.jsp");
            return;
        }
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "confirm password not equal password");
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (termsAndConditions == null) {
            request.setAttribute("errorMessage", "Please agree with our Terms and Conditions and Privacy Statement");
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        User newUser = new User();
        newUser.setName(name);
        newUser.setUserName(userName);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setRoleId(2);

        try {
            status = userDAO.addUser(newUser);
            if (status) {
                //if add success save this user into session and direct to home page
                successMessage = "Register successfully!!!";
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", successMessage);
                session.setAttribute("currentUser", userDAO.getUserByEmail(email));
                session.setMaxInactiveInterval(3600);
                request.getRequestDispatcher("homePage").forward(request, response);
                return; // Exit the method to prevent further processing
            } else {
                errorMessage = "Something went wrong! Please try again!";
            }
        } catch (Exception e) {
            errorMessage = "An error occurred: " + e.getMessage();
        }

        //if have any thing error will throw register page to display
        request.setAttribute("errorMessage", errorMessage);
        dispatch(request, response, "/views/register.jsp");
        return;
    }

    //return the value input before
    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String name,
            String userName, String mail, String phone)
            throws ServletException, IOException {
        request.setAttribute("name", name);
        request.setAttribute("userName", userName);
        request.setAttribute("email", mail);
        request.setAttribute("phone", phone);
    }
    
    //direct to page
    private void dispatch(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Servlet";
    }
}
