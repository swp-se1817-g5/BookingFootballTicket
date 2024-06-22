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
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import models.Match;

/**
 *
 * @author thuat
 */
@WebServlet(name = "CreateMatchServlet", urlPatterns = {"/createMatch"})
public class CreateMatchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageMatch");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean created = false;
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        try {
            // Validate and parse session attributes
            String createdBy = (String) session.getAttribute("userName");
            // Retrieve and validate parameters
            String fc1IdString = request.getParameter("fc1Id");
            String fc2IdString = request.getParameter("fc2Id");
            String seasonString = request.getParameter("season");
            String typeString = request.getParameter("type");
            String startTimeString = request.getParameter("startTime");

            if (fc1IdString == null || fc2IdString == null || seasonString == null || typeString == null || startTimeString == null) {
                throw new IllegalArgumentException("Missing parameters");
            }

            // Parse and validate the date time parameter
            LocalDateTime time;
            time = LocalDateTime.parse(startTimeString, formatter);
            int fc1Id;
            int fc2Id;
            fc1Id = Integer.parseInt(fc1IdString);
            fc2Id = Integer.parseInt(fc2IdString);

            Match match = new Match();
            match.setCreatedBy(createdBy);
            match.setUpdatedBy(createdBy);
            match.setSeason(SeasonDAO.getINSTANCE().getSeasonbyID(seasonString));
            match.setType(MatchDAO.INSTANCE.getMatchTypeById(typeString));
            match.setStatus(MatchDAO.INSTANCE.getMatchStatusById("1"));
            match.setTeam1(FootballClubDAO.getInstance().getFootballClubbyID(fc1Id));
            match.setTeam2(FootballClubDAO.getInstance().getFootballClubbyID(fc2Id));
            match.setTime(time);

            created = MatchDAO.INSTANCE.createMatch(match);

        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid date time format", e);
        }

        response.sendRedirect("manageMatch?created=" + created);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
