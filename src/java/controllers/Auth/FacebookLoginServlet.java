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
        String code = request.getParameter("code");
        String accessToken = getFacebook.getToken(code);
        FacebookUser accFb = getFacebook.getUserInfo(accessToken);
        User userExist = UserDAO.INSTANCE.getUserByEmail(accFb.getEmail());
        if (Objects.isNull(userExist)) {
            // If user does not exist, redirect to register page
            request.setAttribute("name", accFb.getName());
            request.setAttribute("email", accFb.getEmail());
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        } else {
            // If user exists, save user in session
            request.getSession().setAttribute("currentUser", userExist);
            request.getRequestDispatcher("/views/homePage.jsp").forward(request, response);
        }
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
