/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Objects;
import models.FacebookUser;
import models.User;

/**
 *
 * @author AD
 */
@WebServlet(name = "FacebookLogin", urlPatterns = {"/loginFB"})
public class FacebookLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        System.out.println(code);

        getFacebook FB = new getFacebook();
        String accessToken = FB.getToken(code);
        System.out.println(accessToken);

        FacebookUser accFb = FB.getUserInfo(accessToken);
        System.out.println(accFb);

        User userExist = UserDAO.INSTANCE.getUserByEmail(accFb.getEmail());

        if (userExist != null) {
            // If user exists, save user in session
            session.setAttribute("currentUser", userExist);
        } else {
            // If user does not exist, create a new user and save in session
            User newUser = new User();
            newUser.setEmail(accFb.getEmail());
            newUser.setName(accFb.getName());
            // Set other necessary fields for newUser
            // Example:
            newUser.setRoleId(2); // Assuming 2 is the roleId for regular users

            session.setAttribute("currentUser", newUser);
        }
        request.getRequestDispatcher("homePage").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
