/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageUser;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Role;
import models.User;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "SearchUser", urlPatterns = {"/searchUser"})
public class SearchUserServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchUserServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        String phoneNumber = request.getParameter("phoneNumber");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            if (page < 1) {
                page = 1;
            }
        }
        int pageSize = 10;
        email = (email != null) ? email : "";
        name = (name != null) ? name : "";
        phoneNumber = (phoneNumber != null) ? phoneNumber : "";
        // Perform user search
        ArrayList<User> users = UserDAO.getINSTANCE().searchUsers(email, name, phoneNumber, roleId);
        ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
        int totalUsers = users.size();
        // Check if users list is not null and not empty
        if (users != null && !users.isEmpty()) {
            ArrayList<User> paginatedUsers = UserDAO.getINSTANCE().getPaginatedUsers(users, page, pageSize);
            int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
            request.setAttribute("users", paginatedUsers);
            request.setAttribute("roles", roles);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("noOfRecords", totalUsers);
        } else {
            // No users found, return message
            request.setAttribute("message", "No users found for the provided keyword: " + email + name + phoneNumber);
            request.setAttribute("noOfRecords", 0);
        }
        // Forward the request to the searchUser.jsp page
        request.getRequestDispatcher("views/searchUser.jsp").forward(request, response);
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
