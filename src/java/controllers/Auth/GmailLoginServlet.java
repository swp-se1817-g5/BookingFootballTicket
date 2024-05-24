package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.User;
import org.apache.http.client.ClientProtocolException;

@WebServlet(name="GmailLoginServlet", urlPatterns={"/gmail"})
public class GmailLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = UserDAO.INSTANCE.authenticateUser(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("homePage.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("homePage");
        } else {
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null && !code.isEmpty()) {
            try {
                String accessToken = getGmail.getToken(code);
                User googleUser = getGmail.getUserInfo(accessToken);
                if (googleUser != null) {
                    UserDAO userDAO = UserDAO.INSTANCE;
                    User user = userDAO.getUserByEmail(googleUser.getEmail());

                    if (user == null) {
                        user = new User();
                        user.setEmail(googleUser.getEmail());
                        user.setName(googleUser.getName());
                        user.setPassword(""); // Consider a different approach for password
                        userDAO.addUser(user);
                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setMaxInactiveInterval(60 * 60); // 1 hour session

                    response.sendRedirect("homePage");
                    return;
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        ArrayList<User> users = UserDAO.INSTANCE.getUsers();
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        boolean isUser = false;
        for (User user : users) {
            if ((name.trim().equals(user.getName()) || name.trim().equals(user.getEmail())) && password.equals(user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setMaxInactiveInterval(60*60);
                isUser = true;
            }
        }
        if (!isUser) {
            request.setAttribute("name", name);
            request.setAttribute("loginStatus", "Username or password is incorrect!");
        }
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
