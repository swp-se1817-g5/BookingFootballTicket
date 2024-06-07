/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageUser;

import com.google.gson.JsonObject;
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
import java.util.HashMap;
import models.Role;
import models.User;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "ManageUser", urlPatterns = {"/manageUser"})
public class ManageUserServlet extends HttpServlet {

    private static final int RECORDS_PER_PAGE = 10;

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
            out.println("<title>Servlet ManageUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageUserServlet at " + request.getContextPath() + "</h1>");
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
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            if (page < 1) {
                page = 1;
            }
        }
        ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
        ArrayList<User> users = UserDAO.getINSTANCE().getUsers((page - 1) * RECORDS_PER_PAGE, RECORDS_PER_PAGE);
        int noOfRecords = UserDAO.getINSTANCE().getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);

        request.setAttribute("users", users);
        request.setAttribute("roles", roles);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.getRequestDispatcher("views/manageUser.jsp").forward(request, response);
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
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            if (page < 1) {
                page = 1;
            }
        }
        int roleId = 0;
        String roleIdParam = request.getParameter("roleId");
        if (roleIdParam != null && !roleIdParam.isEmpty()) {
            try {
                roleId = Integer.parseInt(roleIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
        ArrayList<User> users;
        int noOfRecords;
        int noOfPages;
        if (roleId == 0) {
            users = UserDAO.getINSTANCE().getUsers((page - 1) * RECORDS_PER_PAGE, RECORDS_PER_PAGE);
            noOfRecords = UserDAO.getINSTANCE().getNoOfRecords();
            noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);
        } else {
            users = UserDAO.getINSTANCE().getUsersByRoleId(roleId, 0, RECORDS_PER_PAGE); // Không cần phân trang ở đây
            noOfRecords = UserDAO.getINSTANCE().getNoOfRecordsByRoleId(roleId);
            noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);
        }
        // Build HTML response
        StringBuilder htmlResponse = new StringBuilder();
        for (User user : users) {
            String roleName = getRoleName(user.getRoleId());
            htmlResponse.append("<tr>");
            htmlResponse.append("<td>").append(user.getEmail()).append("</td>");
            htmlResponse.append("<td>").append(user.getName()).append("</td>");
            htmlResponse.append("<td>").append(roleName).append("</td>");
            htmlResponse.append("<td>").append(user.getPhoneNumber()).append("</td>");
            htmlResponse.append("<td>").append(user.getAvatar()).append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<a href=\"#\" class=\"view\" title=\"View\" data-toggle=\"modal\"><i class=\"material-icons\">&#xE417;</i></a>");
            htmlResponse.append("<a href=\"editUser.jsp?email=").append(user.getEmail()).append("\" class=\"edit\" title=\"Edit\" data-toggle=\"tooltip\"><i class=\"material-icons\">&#xE254;</i></a>");
            htmlResponse.append("<a href=\"deleteUser?email=").append(user.getEmail()).append("\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class=\"material-icons\">&#xE872;</i></a>");
            htmlResponse.append("</td>");
            htmlResponse.append("</tr>");
            htmlResponse.append("</tr>");
        }
        /// Build pagination HTML
        StringBuilder pagination = new StringBuilder();
        pagination.append("<ul class='pagination'>");
        if (page > 1) {
            pagination.append("<li class='page-item'><a href='#' data-page='1' class='page-link'>First</a></li>");
            pagination.append("<li class='page-item'><a href='#' data-page='" + (page - 1) + "' class='page-link'>Previous</a></li>");
        }
        for (int i = 1; i <= noOfPages; i++) {
            if (i == page) {
                pagination.append("<li class='page-item active'><a href='#' data-page='" + i + "' class='page-link'>" + i + "</a></li>");
            } else {
                pagination.append("<li class='page-item'><a href='#' data-page='" + i + "' class='page-link'>" + i + "</a></li>");
            }
        }
        if (page < noOfPages) {
            pagination.append("<li class='page-item'><a href='#' data-page='" + (page + 1) + "' class='page-link'>Next</a></li>");
            pagination.append("<li class='page-item'><a href='#' data-page='" + noOfPages + "' class='page-link'>Last</a></li>");
        }
        pagination.append("</ul>");
        response.setContentType("application/json");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("html", htmlResponse.toString());
        jsonResponse.addProperty("pagination", pagination.toString());
        jsonResponse.addProperty("usersCount", users.size()); // Số lượng người dùng trong trang hiện tại
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
