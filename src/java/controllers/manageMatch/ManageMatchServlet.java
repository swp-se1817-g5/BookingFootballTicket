/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageMatch;

import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thuat
 */
@WebServlet(name = "ManageMatchServlet", urlPatterns = {"/manageMatch"})
public class ManageMatchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("created") != null) {
            request.setAttribute("created", "true".equals(request.getParameter("created")));
        } else if (request.getParameter("updated") != null) {
            request.setAttribute("updated", "true".equals(request.getParameter("updated")));
        } else if (request.getParameter("deleted") != null) {
            request.setAttribute("deleted", "true".equals(request.getParameter("deleted")));
        }

        request.setAttribute("matches", MatchDAO.INSTANCE.getMatches());
        request.setAttribute("seasons", SeasonDAO.INSTANCE.getAllseason());
        request.setAttribute("types", MatchDAO.INSTANCE.getMatchTypes());
        request.setAttribute("statusList", MatchDAO.INSTANCE.getMatchStatus());
        request.setAttribute("footballClubs", FootballClubDAO.INSTANCE.getFootballClubs());
        request.getRequestDispatcher("views/manageMatch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
