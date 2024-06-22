/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_match;

import dal.FootballClubDAO;
import dal.MatchDAO;
import dal.SeasonDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import models.Match;

/**
 *
 * @author thuat
 */
@WebServlet(name = "UpdateMatchServlet", urlPatterns = {"/updateMatch"})
public class UpdateMatchServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageMatch");
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
        boolean updated = false;
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        // Retrieve and validate parameters
        String matchIdString = request.getParameter("matchId");
        String fc1IdString = request.getParameter("fc1Id");
        String fc2IdString = request.getParameter("fc2Id");
        String typeString = request.getParameter("type");
        String statusString = request.getParameter("status");
        String startTimeString = request.getParameter("startTime");
        if (fc1IdString == null || fc2IdString == null || typeString == null || startTimeString == null) {
            throw new IllegalArgumentException("Missing parameters");
        }
        // Parse and validate the date time parameter
        LocalDateTime time;
        int fc1Id;
        int fc2Id;
        int matchId;
        time = LocalDateTime.parse(startTimeString, formatter);

        try {
            fc1Id = Integer.parseInt(fc1IdString);
            fc2Id = Integer.parseInt(fc2IdString);
            matchId = Integer.parseInt(matchIdString);
            Match match = new Match();
            match.setMatchId(matchId);
            match.setType(MatchDAO.INSTANCE.getMatchTypeById(typeString));
            match.setStatus(MatchDAO.INSTANCE.getMatchStatusById(statusString));
            match.setTeam1(FootballClubDAO.INSTANCE.getFootballClubbyID(fc1Id));
            match.setTeam2(FootballClubDAO.INSTANCE.getFootballClubbyID(fc2Id));
            match.setTime(time);

            updated = MatchDAO.INSTANCE.updateMatch(match);

        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid date time format", e);
        }

        response.sendRedirect("manageMatch?updated=" + updated);
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
