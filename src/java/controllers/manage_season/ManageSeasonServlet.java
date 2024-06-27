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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.Season;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "ManageSeason", urlPatterns = {"/manageSeason"})
public class ManageSeasonServlet extends HttpServlet {

    private static final int RECORDS_PER_PAGE = 10;
    private static final String UPDATED = "updated";

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
            out.println("<title>Servlet ManageSeasonServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageSeasonServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        // Handle the "created" attribute
        if (session.getAttribute("created") != null) {
            request.setAttribute("created", (boolean) session.getAttribute("created"));
            session.removeAttribute("created");
        }
        if (session.getAttribute("message") != null) {
            request.setAttribute("message", (String) session.getAttribute("message"));
            session.removeAttribute("message");
        }

        // Handle the "updated" attribute
        if (session.getAttribute("updated") != null) {
            request.setAttribute("updated", session.getAttribute("updated"));
            session.removeAttribute("updated");
        }

        // Handle the "deleted" attribute
        if (session.getAttribute("deleted") != null) {
            request.setAttribute("deleted", (boolean) session.getAttribute("deleted"));
            session.removeAttribute("deleted");
        }

        // Pagination and search handling
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String search = request.getParameter("search");
        search = search == null ? "" : search.trim();

        ArrayList<Season> seasons = SeasonDAO.getINSTANCE().getSeasons((page - 1) * RECORDS_PER_PAGE, RECORDS_PER_PAGE, search);
        int noOfRecords = SeasonDAO.getINSTANCE().getNoOfRecords(search);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);

        request.setAttribute("seasons", seasons);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("search", search);

        request.getRequestDispatcher("views/manageSeason.jsp").forward(request, response);
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
        doGet(request, response);
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
