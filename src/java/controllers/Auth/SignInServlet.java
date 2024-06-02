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

@WebServlet(name = "SignInServlet", urlPatterns = {"/login"})
public class SignInServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            //tim cookie cua cart
            for (Cookie c : arr) {
                if (c.getName().equals("emailSave")) {
                    request.setAttribute("emailValid", c.getValue());
                    System.out.println(c.getValue()+"mail");
                }
                if (c.getName().equals("passSave")) {
                    request.setAttribute("passValid", c.getValue());
                    System.out.println(c.getValue()+"pass");
                }
            }
        }

        request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember_me");
        System.out.println("remember = "+remember);
        UserDAO userDAO = UserDAO.INSTANCE;
        HttpSession session = request.getSession();
        //get user by email and password
        User user = userDAO.authenticateUser(email, password);
        //if exist will set in seesion, may be set email and password or user 
        if (user != null) {
           session.setAttribute("currentUser", user);
           if(remember != null && remember.equals("on")) {
               Cookie cookieEmail = new Cookie("emailSave", email);
               Cookie cookiePassword = new Cookie("passSave", password);
               response.addCookie(cookieEmail);
               response.addCookie(cookiePassword);
               cookieEmail.setMaxAge(60 * 60 * 1);
               cookiePassword.setMaxAge(60 * 60 * 1);
           }
           //popup
           request.setAttribute("isFirstLogin", true);
           //redirect to home page or check any thing before redirect to home page
           request.getRequestDispatcher("views/homePage.jsp").forward(request, response);
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
