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
import java.util.ArrayList;
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
        // Check if both searchType and keyword are provided and not empty
        if (searchType != null && !searchType.isBlank() && keyword != null && !keyword.isBlank()) {
            ArrayList<User> users = new ArrayList<>();
            // Perform search based on the searchType
            switch (searchType) {
                case "userid":
                    try {
                    int userId = Integer.parseInt(keyword);
                    User u = UserDAO.getINSTANCE().getUserbyID(userId);
                    if (u != null) {
                        users.add(u);
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
                case "username":
                    users = UserDAO.getINSTANCE().getUserbyUsername(keyword);
                    break;
                case "name":
                    users = UserDAO.getINSTANCE().getUserbyName(keyword);
                    break;
                default:
                    // Invalid search type, return error message
                    request.setAttribute("message", "Invalid search type: " + searchType);
                    break;
            }
            // Check if users list is not null and not empty
            if (users != null && !users.isEmpty()) {
                request.setAttribute("users", users);
            } else {
                // No users found, return message
                request.setAttribute("message", "No users found for the provided keyword: " + keyword);
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
