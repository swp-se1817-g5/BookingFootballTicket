/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_user;

import com.google.gson.JsonObject;
import dal.RoleDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
        String email = request.getParameter("email").trim();
        String name = request.getParameter("name").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
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

        ArrayList<User> users = UserDAO.getINSTANCE().searchUsers(email, name, phoneNumber, roleId);
        int totalUsers = users.size();
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
        ArrayList<User> paginatedUsers = UserDAO.getINSTANCE().getPaginatedUsers(users, page, pageSize);

        StringBuilder htmlResponse = new StringBuilder();
        for (User user : paginatedUsers) {
            String roleName = getRoleName(user.getRoleId());
            htmlResponse.append("<tr>");
            htmlResponse.append("<td>").append(user.getEmail()).append("</td>");
            htmlResponse.append("<td>").append(user.getName()).append("</td>");
            htmlResponse.append("<td>").append(roleName).append("</td>");
            htmlResponse.append("<td>").append(user.getPhoneNumber()).append("</td>");
            htmlResponse.append("<td>").append("<img src=\"" + user.getAvatar() + "\" alt=\"User Avatar\" style=\"max-width: 100px; max-height: 100px;\">").append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<a href=\"#\" class=\"view\" title=\"View\" data-toggle=\"modal\"><i class=\"material-icons\">&#xE417;</i></a>");
            htmlResponse.append("<a href=\"editUser.jsp?email=").append(user.getEmail()).append("\" class=\"edit\" title=\"Edit\" data-toggle=\"tooltip\"><i class=\"material-icons\">&#xE254;</i></a>");
            htmlResponse.append("<a href=\"deleteUser?email=").append(user.getEmail()).append("\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class=\"material-icons\">&#xE872;</i></a>");
            htmlResponse.append("</td>");
            htmlResponse.append("</tr>");
        }
        StringBuilder pagination = new StringBuilder();
        pagination.append("<ul class='pagination'>");
        if (page > 1) {
            pagination.append("<li class='page-item'><a href='#' data-page='1' class='page-link'>First</a></li>");
            pagination.append("<li class='page-item'><a href='#' data-page='").append(page - 1).append("' class='page-link'>Previous</a></li>");
        }
        for (int i = 1; i <= totalPages; i++) {
            if (i == page) {
                pagination.append("<li class='page-item active'><a href='#' data-page='").append(i).append("' class='page-link'>").append(i).append("</a></li>");
            } else {
                pagination.append("<li class='page-item'><a href='#' data-page='").append(i).append("' class='page-link'>").append(i).append("</a></li>");
            }
        }
        if (page < totalPages) {
            pagination.append("<li class='page-item'><a href='#' data-page='").append(page + 1).append("' class='page-link'>Next</a></li>");
            pagination.append("<li class='page-item'><a href='#' data-page='").append(totalPages).append("' class='page-link'>Last</a></li>");
        }
        pagination.append("</ul>");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("html", htmlResponse.toString());
        jsonResponse.addProperty("pagination", pagination.toString());
        jsonResponse.addProperty("usersCount", totalUsers);

        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
        out.close();
    }

    private String getRoleName(int roleId) {
        String roleName = "";
        ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
        for (Role role : roles) {
            if (role.getRoleId() == roleId) {
                roleName = role.getRoleName();
                break;
            }
        }
        return roleName;
    }

    @Override
    public String getServletInfo() {
        return "SearchUserServlet handles searching users with AJAX.";
    }
}
