/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageMatch;

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
            String fc1Id_string = request.getParameter("fc1Id");
            String fc2Id_string = request.getParameter("fc2Id");
            String season_string = request.getParameter("season");
            String type_string = request.getParameter("type");
            String startTime_string = request.getParameter("startTime");

            if (fc1Id_string == null || fc2Id_string == null || season_string == null || type_string == null || startTime_string == null) {
                throw new IllegalArgumentException("Missing parameters");
            }

            // Parse and validate the date time parameter
            LocalDateTime time;
            try {
                time = LocalDateTime.parse(startTime_string, formatter);
            } catch (DateTimeParseException e) {
                throw new IllegalArgumentException("Invalid date time format", e);
            }
            int fc1Id, fc2Id;
            try {
                fc1Id = Integer.parseInt(fc1Id_string);
                fc2Id = Integer.parseInt(fc2Id_string);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid football club ID format", e);
            }

            Match match = new Match();
            match.setCreatedBy(createdBy);
            match.setUpdatedBy(createdBy);
            match.setSeason(SeasonDAO.getINSTANCE().getSeasonbyID(season_string));
            match.setType(MatchDAO.INSTANCE.getMatchTypeById(type_string));
            match.setStatus(MatchDAO.INSTANCE.getMatchStatusById("1"));
            match.setTeam1(FootballClubDAO.INSTANCE.getFootballClubbyID(fc1Id));
            match.setTeam2(FootballClubDAO.INSTANCE.getFootballClubbyID(fc2Id));
            match.setTime(time);

            created = MatchDAO.INSTANCE.createMatch(match);

        } catch (IllegalArgumentException e) {
        }

        response.sendRedirect("manageMatch?created=" + created);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
