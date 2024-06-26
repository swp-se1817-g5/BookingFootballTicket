/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_season;

import dal.SeasonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Season;

/**
 *
 * @author AD
 */
@WebServlet(name = "CreateSeason", urlPatterns = {"/createSeason"})
public class CreateSeasonServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateSeasonServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateSeasonServlet at " + request.getContextPath() + "</h1>");
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
        String seasonName = request.getParameter("seasonName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        boolean created = false;

        if (!seasonName.isBlank() && !startDate.isBlank() && !endDate.isBlank()) {
            try {
                Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
                Date end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);

                if (end.after(start)) {
                    Season season = new Season(seasonName, start, end);
                    created = SeasonDAO.getINSTANCE().createSeason(season);
                    response.sendRedirect("manageSeason?created=" + created);
                    return;
                } else {
                    request.setAttribute("message", "End date must be after start date!");
                }
            } catch (ParseException ex) {
                Logger.getLogger(CreateSeasonServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "Invalid date format!");
            }
        } else {
            request.setAttribute("message", "All fields are required!");
        }
        response.sendRedirect("manageSeason?created=" + created);
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
