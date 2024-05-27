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

        HttpSession session = request.getSession();
        User user = authenticateUser(email, password);

        if (user != null) {
            if (user.isIsDeleted()) {
                session.setAttribute("userobj", user);
                response.sendRedirect("manageMatch");

//                session.setAttribute("email", email);
//                session.setAttribute("password", password);
//                session.setMaxInactiveInterval(3600);
            } else {

                session.setAttribute("userobj", user);
                request.getRequestDispatcher("register").forward(request, response);
            }
        } else {
            //request.setAttribute("errorMessage", "Email or password may be wrong ! Please try again! ");
            request.getRequestDispatcher("register").forward(request, response);
        }

    }

    private User authenticateUser(String email, String password) {
        UserDAO userDAO = UserDAO.INSTANCE;
        User user = userDAO.getUserByEmail(email);
        System.out.println("User: " + user);
        if (user != null && user.getPassword().equals(password)) {
            return user;

        }
        return null;

    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
