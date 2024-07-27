/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.common_access;

import dal.FootballClubDAO;
import dal.MatchDAO;
import dal.MatchSeatDAO;
import dal.SeasonDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import java.io.StringWriter;
import java.util.List;
import models.Match;
import models.Season;
import models.MatchType;
import models.MatchStatus;
import models.FootballClub;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "PublicListMatchServlet", urlPatterns = {"/publicListMatch"})
public class PublicListMatchServlet extends HttpServlet {

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
            out.println("<title>Public List of Matches</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Upcoming Matches</h1>");

            // Display matches using JSP snippet
            request.getRequestDispatcher("views/publicListMatch.jsp").include(request, response);

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
        int pageNumber = 1; // Default page number
        int pageSize = 6; // Default page size

        // Get parameters and handle null values
        String seasonIdParam = request.getParameter("seasonId");
        String matchStatusIdParam = request.getParameter("matchStatusId");
        String dateFromParam = request.getParameter("dateFrom");
        String dateToParam = request.getParameter("dateTo");
        String searchInputParam = request.getParameter("searchInput");
        String typeIdParam = request.getParameter("typeId");

        // Use empty string if the parameter is null, otherwise trim the value
        String dateFrom = dateFromParam != null ? dateFromParam.trim() : "";
        String dateTo = dateToParam != null ? dateToParam.trim() : "";
        String searchInput = searchInputParam != null ? searchInputParam.trim() : "";
        String seasonId = seasonIdParam != null ? seasonIdParam : "";
        String matchStatusId = matchStatusIdParam != null ? matchStatusIdParam : "";
        String typeId = typeIdParam != null ? typeIdParam : "";

        // Parse page number and page size from request parameters if provided
        String pageParam = request.getParameter("page");

        if (pageParam != null && !pageParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageParam);
        }
        if (!seasonId.isEmpty() && !seasonId.isBlank()) {
            request.setAttribute("seasonId", seasonId);
        }
        List<Match> matches = MatchDAO.INSTANCE.getFilteredMatches(searchInput, seasonId, dateFrom, dateTo, matchStatusId, typeId, pageNumber, pageSize);
        int totalCount = MatchDAO.INSTANCE.countFilteredMatches(searchInput, seasonId, dateFrom, dateTo, matchStatusId, typeId);

        // Calculate number of pages
        int numberOfPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("allticket", MatchSeatDAO.INSTANCE.getAllTicketAvailable());
        request.setAttribute("hotMatches", MatchDAO.INSTANCE.getMatchHotByTicketSold());
        request.setAttribute("matches", matches);
        request.setAttribute("totalMatches", totalCount);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("numberOfPages", numberOfPages); // Set number of pages
        request.setAttribute("seasons", SeasonDAO.INSTANCE.getAllseason());
        request.setAttribute("types", MatchDAO.INSTANCE.getMatchTypes());
        request.setAttribute("statusList", MatchDAO.INSTANCE.getMatchStatus());
        request.setAttribute("footballClubs", FootballClubDAO.getInstance().getFootballClubs(""));

        request.getRequestDispatcher("views/publicListMatch.jsp").forward(request, response);
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
        int pageNumber = 1; // Default page number
        int pageSize = 5; // Default page size
        // Parse page number and page size from request parameters if provided
        String pageParam = request.getParameter("page");
        String sizeParam = request.getParameter("size");

        if (pageParam != null && !pageParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageParam);
        }
        if (sizeParam != null && !sizeParam.isEmpty()) {
            pageSize = Integer.parseInt(sizeParam);
        }
        // Get parameters and handle null values
        String seasonIdParam = request.getParameter("seasonId");
        String matchStatusIdParam = request.getParameter("matchStatusId");
        String dateFromParam = request.getParameter("dateFrom");
        String dateToParam = request.getParameter("dateTo");
        String searchInputParam = request.getParameter("searchInput");
        String typeIdParam = request.getParameter("typeId");

        // Use empty string if the parameter is null, otherwise trim the value
        String dateFrom = dateFromParam != null ? dateFromParam.trim() : "";
        String dateTo = dateToParam != null ? dateToParam.trim() : "";
        String searchInput = searchInputParam != null ? searchInputParam.trim() : "";
        String seasonId = seasonIdParam != null ? seasonIdParam : "";
        String matchStatusId = matchStatusIdParam != null ? matchStatusIdParam : "";
        String typeId = typeIdParam != null ? typeIdParam : "";

        List<Match> matches = MatchDAO.INSTANCE.getFilteredMatches(searchInput, seasonId, dateFrom, dateTo, matchStatusId, typeId, pageNumber, pageSize);

        // Check if matches is null or empty
        if (matches == null || matches.isEmpty()) {
            String emptyMessage = "<div style=\"padding: 10px; background-color: #f1f1f1; border: 1px solid #ddd; margin-bottom: 10px; margin: auto ; color: red;\">Không có trận đấu nào phù hợp!</div>";
            response.getWriter().write(emptyMessage);
            return;
        }
        // Build HTML content using StringBuilder
        StringBuilder htmlContent = new StringBuilder();
        for (Match o : matches) {
            String dateTime = o.getTime();
            String[] dateTimeParts = dateTime.split("T");
            String date = dateTimeParts[0];
            String time = dateTimeParts[1];

            htmlContent.append("<div class=\"col-md-4 mb-4 match\">")
                    .append("<div class=\"ticket-card\">")
                    .append("<input type=\"date\" class=\"date\" value=\"").append(date).append("\" style=\"border: none; background: none;text-align: center\" readonly>")
                    .append("<div class=\"competition\">").append(o.getSeason().getSeasonName()).append("</div>")
                    .append("<div class=\"team-logos\">")
                    .append("<img src=\"").append(o.getTeam1().getImg()).append("\" alt=\"").append(o.getTeam1().getClubName()).append("\">")
                    .append("<span class=\"vs\">vs</span>")
                    .append("<img src=\"").append(o.getTeam2().getImg()).append("\" alt=\"").append(o.getTeam2().getClubName()).append("\">")
                    .append("</div>")
                    .append("<div class=\"match-teams\">").append(o.getTeam1().getClubName()).append(" vs ").append(o.getTeam2().getClubName()).append("</div>")
                    .append("<div class=\"location\"><i class=\"fa fa-map-marker-alt\"></i> Sân vận động Mỹ Đình, Hà Nội</div>")
                    .append("<i class=\"fa fa-clock\"></i><input type=\"time\" class=\"time\" readonly value=\"").append(time).append("\" style=\"border: none; background: none;text-align: center\">")
                    .append("<div class=\"tickets-sold\">Vé Đã Bán: 79 </div>")
                    .append("<div class=\"button-container\">")
                    .append("<a type=\"button\" href=\"matchDetail?matchId=").append(o.getMatchId()).append("\" class=\"btn btn-primary book-now-btn\">Xem Vé</a>")
                    .append("</div>")
                    .append("</div>")
                    .append("</div>");
        }
        // Set response content type to HTML
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(htmlContent.toString());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet to display public list of upcoming matches";
    }// </editor-fold>

}
