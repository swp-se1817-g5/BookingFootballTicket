/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.common_access;

import dal.SeasonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;
import models.Season;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "PublicListTournmentServlet", urlPatterns = {"/publicListTournment"})
public class PublicListTournmentServlet extends HttpServlet {

    int RECORDS_PER_PAGE = 6;

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
            out.println("<title>Servlet PublicListTournmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PublicListTournmentServlet at " + request.getContextPath() + "</h1>");
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

        // Pagination and search handling
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String search = request.getParameter("search");
        search = search == null ? "" : search.trim();
        Date startDate = null;
        Date endDate = null;

        if (request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()) {
            startDate = Date.valueOf(request.getParameter("startDate"));
        }
        if (request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty()) {
            endDate = Date.valueOf(request.getParameter("endDate"));
        }
        ArrayList<Season> seasons = SeasonDAO.getINSTANCE().getFilterofTournment((page - 1) * RECORDS_PER_PAGE, RECORDS_PER_PAGE, search, startDate, endDate);
        int noOfRecords = SeasonDAO.getINSTANCE().getNoOfRecordsWithConditions(search, startDate, endDate);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);
        request.setAttribute("seasons", seasons);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("search", search);
        request.getRequestDispatcher("views/publicListTournment.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");

        // Pagination and search handling
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String search = request.getParameter("search");
        search = search == null ? "" : search.trim();

        Date startDate = null;
        Date endDate = null;

        try {
            String dateFromParam = request.getParameter("startDate");
            if (dateFromParam != null && !dateFromParam.isEmpty()) {
                startDate = Date.valueOf(dateFromParam);
            }

            String dateToParam = request.getParameter("endDate");
            if (dateToParam != null && !dateToParam.isEmpty()) {
                endDate = Date.valueOf(dateToParam);
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }

        ArrayList<Season> seasons = SeasonDAO.getINSTANCE().getFilterofTournment((page - 1) * RECORDS_PER_PAGE, RECORDS_PER_PAGE, search, startDate, endDate);
        int noOfRecords = SeasonDAO.getINSTANCE().getNoOfRecordsWithConditions(search, startDate, endDate);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);

        StringBuilder htmlContent = new StringBuilder();

        if (seasons.isEmpty()) {
            htmlContent.append("<div class=\"row\" id=\"tournamentList\" style=\"justify-content: center;\">")
                    .append("<div style=\"padding: 10px; text-align: center; background-color: #f1f1f1; border: 1px solid #ddd; display: inline-block; margin: auto; color: red;\">")
                    .append("Không có giải đấu nào phù hợp!")
                    .append("</div>")
                    .append("</div>"); // Close the outer div.row
        } else {
            htmlContent.append("<div class=\"row\" id=\"tournamentList\">");

            for (Season s : seasons) {
                htmlContent.append("<div class=\"col-md-4\">")
                        .append("<div class=\"card ticket-card\">")
                        .append("<div class=\"card-body\">")
                        .append("<h5 class=\"card-title\">").append(s.getSeasonName()).append("</h5>")
                        .append("<p class=\"card-text\">Thời gian bắt đầu: ").append(s.getStartDate()).append("</p>")
                        .append("<p class=\"card-text\">Thời gian kết thúc: ").append(s.getEndDate()).append("</p>")
                        .append("<a href=\"publicListMatch?seasonId=").append(s.getSeasonId()).append("\" class=\"btn btn-primary\">Xem Các Trận Đấu</a>")
                        .append("</div>") // Close card-body
                        .append("</div>") // Close card
                        .append("</div>"); // Close col-md-4
            }

            htmlContent.append("</div>"); // Close row
        }

// Send the response back to the client
        response.getWriter().write(htmlContent.toString());
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
