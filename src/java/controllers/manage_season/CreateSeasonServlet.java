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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Season;

@WebServlet(name = "CreateSeason", urlPatterns = {"/createSeason"})
public class CreateSeasonServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageSeason");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean created = false;

        String seasonName = request.getParameter("seasonName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        if (!seasonName.isBlank() && !startDate.isBlank() && !endDate.isBlank()) {
            try {
                Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
                Date end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);

                if (end.after(start)) {
                    Season season = new Season(seasonName, start, end);
                    created = SeasonDAO.getINSTANCE().createSeason(season);
                } else {
                    session.setAttribute("message", "End date must be after start date!");
                }
            } catch (ParseException ex) {
                Logger.getLogger(CreateSeasonServlet.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("message", "Invalid date format!");
            }
        } else {
            session.setAttribute("message", "All fields are required!");
        }

        session.setAttribute("created", created);
        response.sendRedirect("manageSeason");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
