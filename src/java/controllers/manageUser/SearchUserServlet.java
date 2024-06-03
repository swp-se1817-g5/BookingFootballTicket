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
        String searchType = request.getParameter("searchType");
        String keyword = request.getParameter("keyword");
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            if (page < 1) {
                page = 1;
            }
        }
        int pageSize = 10;
        // Check if both searchType and keyword are provided and not empty
        if (searchType != null && !searchType.isBlank() && keyword != null && !keyword.isBlank()) {
            ArrayList<User> users = new ArrayList<>();
            ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
            int totalUsers = 0;
            // Perform search based on the searchType
            switch (searchType) {
                case "userId":
                    try {
                    int userId = Integer.parseInt(keyword);
                    User u = UserDAO.getINSTANCE().getUserbyuserID(userId);
                    if (u != null) {
                        users.add(u);
                        totalUsers = 1;
                    } else {
                        // No user found with the provided userid
                        request.setAttribute("message", "No users found for the provided userid: " + userId);
                        request.getRequestDispatcher("views/searchUser.jsp").forward(request, response);
                        return; // Stop further processing
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("message", "Invalid user ID format: " + keyword);
                    request.getRequestDispatcher("views/searchUser.jsp").forward(request, response);
                    return; // Stop further processing
                }
                break;
                case "userName":
                    users = UserDAO.getINSTANCE().getUserbyType("userName", keyword);
                    totalUsers = users.size();
                    break;
                case "name":
                    users = UserDAO.getINSTANCE().getUserbyType("name", keyword);
                    totalUsers = users.size();
                    break;
                case "email":
                    users = UserDAO.getINSTANCE().getUserbyType("email", keyword);
                    totalUsers = users.size();
                    break;
                case "phoneNumber":
                    users = UserDAO.getINSTANCE().getUserbyType("phoneNumber", keyword);
                    totalUsers = users.size();
                    break;
                case "roleId":
                    int roleId = Integer.parseInt(keyword);
                    users = UserDAO.getINSTANCE().getUserbyroleID(roleId);
                    totalUsers = users.size();
                    break;
                default:
                    // Invalid search type, return error message
                    request.setAttribute("message", "Invalid search type: " + searchType);
                    break;
            }
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
                request.setAttribute("message", "No users found for the provided keyword: " + keyword);
                request.setAttribute("noOfRecords",0);
            }
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
