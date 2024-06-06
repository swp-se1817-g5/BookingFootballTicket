/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageUser;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "CreateUser", urlPatterns = {"/createUser"})
public class CreateUserServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String avatar = request.getParameter("avatar");

        if (!email.isBlank() && !name.isBlank() && !password.isBlank() && !phoneNumber.isBlank()) {
            try {
                // Set additional fields
                int roleId = 2; // Assuming a default role ID, adjust as necessary
                String createdBy = "admin"; // Adjust as necessary
                boolean isDeleted = false;

                // Create the User object
                User user = new User(email, name, roleId, password, phoneNumber, avatar, createdBy, LocalDateTime.now(), isDeleted);

                // Save the user
                boolean added = UserDAO.getINSTANCE().createUser(user);

                if (added) {
                    response.sendRedirect(request.getContextPath() + "/manageUser?message=User+created+successfully!");
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/manageUser?message=Failed+to+create+user.");
                    return;
                }
            } catch (Exception ex) {
                response.sendRedirect(request.getContextPath() + "/manageUser?message=An+error+occurred+while+creating+user.");
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/manageUser?message=Please+fill+all+fields.");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
