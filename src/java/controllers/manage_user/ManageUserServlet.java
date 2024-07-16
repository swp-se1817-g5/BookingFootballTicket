/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_user;

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
        if (request.getParameter("userCreated") != null) {
            boolean created = Boolean.parseBoolean(request.getParameter("userCreated"));
            request.setAttribute("created", created);
        }
        if (request.getParameter("updated") != null) {
            boolean updated = Boolean.parseBoolean(request.getParameter("updated"));
            request.setAttribute("updated", updated);
        }
        if (request.getParameter("changed") != null) {
            boolean changed = Boolean.parseBoolean(request.getParameter("changed"));
            request.setAttribute("changed", changed);
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
        request.setAttribute("url", "manageUser");
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
        try {
            roleId = Integer.parseInt(request.getParameter("roleId"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
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
            if (user.getRoleId() != 1) {
                String roleName = getRoleName(user.getRoleId());
                String status = user.isStatus() ? "Kích hoạt" : "Không kích hoạt";

                htmlResponse.append("<tr>");
                htmlResponse.append("<td>").append(user.getEmail()).append("</td>");
                htmlResponse.append("<td>").append(user.getName()).append("</td>");
                htmlResponse.append("<td>").append(user.getPhoneNumber()).append("</td>");
                htmlResponse.append("<td>").append(roleName).append("</td>");
                htmlResponse.append("<td>").append(status).append("</td>");
                htmlResponse.append("<td>");
                htmlResponse.append("<a href=\"#userDetailModal\" class=\"view\" title=\"View\" ")
                        .append("onclick=\"update('")
                        .append(user.getEmail()).append("', '")
                        .append(user.getName()).append("', '")
                        .append(user.getPhoneNumber()).append("', '")
                        .append(user.getAvatar()).append("', '")
                        .append(user.getRoleId()).append("', '")
                        .append(user.isStatus()).append("')\" ")
                        .append("data-toggle=\"modal\"><i class=\"fa fa-eye\" style=\"color: gray;\"></i></a>");
                if (user.isStatus()) {
                    htmlResponse.append("<a href=\"#\" class=\"inactive\" title=\"InActive\" data-toggle=\"tooltip\" ")
                            .append("onclick=\"changeStatus('").append(user.getEmail()).append("', event)\">")
                            .append("<i class=\"fas fa-toggle-on status-icon active\" style=\"color: green;\"></i></a>");
                } else {
                    htmlResponse.append("<a href=\"#\" class=\"active\" title=\"Active\" data-toggle=\"tooltip\" ")
                            .append("onclick=\"changeStatus('").append(user.getEmail()).append("', event)\">")
                            .append("<i class=\"fas fa-toggle-off status-icon active\"></i></a>");
                }
                htmlResponse.append("</td>");
                htmlResponse.append("</tr>");
            }
        }
        /// Build pagination HTML
        StringBuilder pagination = new StringBuilder();
        pagination.append("<ul class='pagination'>");
        if (page > 1) {
            pagination.append("<li class='page-item'><a href='manageUser?page=1' data-page='1' class='page-link'>First</a></li>");
            pagination.append("<li class='page-item'><a href='manageUser?page=${page - 1}' data-page='").append(page - 1).append("' class='page-link'>Previous</a></li>");
        }
        for (int i = 1; i <= noOfPages; i++) {
            if (i == page) {
                pagination.append("<li class='page-item active'><a href='manageUser?page=${pageNumber}' data-page='").append(i).append("' class='page-link'>").append(i).append("</a></li>");
            } else {
                pagination.append("<li class='page-item'><a href='manageUser?page=${pageNumber}' data-page='").append(i).append("' class='page-link'>").append(i).append("</a></li>");
            }
        }
        if (page < noOfPages) {
            pagination.append("<li class='page-item'><a href='manageUser?page=${page + 1}' data-page='").append(page).append(1).append("' class='page-link'>Next</a></li>");
            pagination.append("<li class='page-item'><a href='manageUser?page=${noOfPages}' data-page='").append(noOfPages).append("' class='page-link'>Last</a></li>");
        }
        pagination.append("</ul>");
        response.setContentType("application/json");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("html", htmlResponse.toString());
        jsonResponse.addProperty("pagination", pagination.toString());
        jsonResponse.addProperty("usersCount", users.size()); // Số lượng người dùng trong trang hiện tại
        try (PrintWriter out = response.getWriter()) {
            out.println(jsonResponse.toString());
        }
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