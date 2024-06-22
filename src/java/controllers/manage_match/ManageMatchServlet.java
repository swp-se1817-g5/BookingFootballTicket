/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_match;

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
    private static final String ACTION_1 = "created";
    private static final String ACTION_2 = "updated";
    private static final String ACTION_3 = "deleted";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter(ACTION_1) != null) {
            request.setAttribute(ACTION_1, "true".equals(request.getParameter(ACTION_1)));
        } else if (request.getParameter(ACTION_2) != null) {
            request.setAttribute(ACTION_2, "true".equals(request.getParameter(ACTION_2)));
        } else if (request.getParameter(ACTION_3) != null) {
            request.setAttribute(ACTION_3, "true".equals(request.getParameter(ACTION_3)));
        }

        request.setAttribute("matches", MatchDAO.INSTANCE.getMatches());
        request.setAttribute("seasons", SeasonDAO.INSTANCE.getAllseason());
        request.setAttribute("types", MatchDAO.INSTANCE.getMatchTypes());
        request.setAttribute("statusList", MatchDAO.INSTANCE.getMatchStatus());
        request.setAttribute("footballClubs", FootballClubDAO.getInstance().getFootballClubs(""));
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
