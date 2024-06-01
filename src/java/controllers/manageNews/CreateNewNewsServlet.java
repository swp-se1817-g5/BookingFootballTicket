/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageNews;

import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import models.News;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author nguye
 */
@WebServlet(name = "CreateNewNewsServlet", urlPatterns = {"/createNewNews"})
public class CreateNewNewsServlet extends HttpServlet {

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

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
            out.println("<title>Servlet CreateNewNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateNewNewsServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
//        PrintWriter out = response.getWriter();
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        HttpSession session = request.getSession();
//        String userName = (String) session.getAttribute("currentUser");
//        out.print(userName);
        String userName = "Duong";
        String mainTitle = request.getParameter("mainTitle");
        String title = request.getParameter("title");
        String mainContent = request.getParameter("mainContent");
        String content = request.getParameter("content");
        String location = request.getParameter("location");
        String kickOff_raw = request.getParameter("kickOff");
        LocalDateTime kickOff;
        try {
            kickOff = LocalDateTime.parse(kickOff_raw, formatter);
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException("Invalid date time format", e);
        }
        int status_raw = Integer.parseInt(request.getParameter("status"));
        boolean status = false;
        if (status_raw == 2) {
            status = true;
        }
        News n = new News(mainTitle, title, mainContent, content, location, kickOff, userName, status);
        int created = NewsDAO.INSTANCE.createNews(n);
//        out.print(created);
        if (created != 0) {
            session.setAttribute("created", created);
        }
        response.sendRedirect("manageNews");

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
