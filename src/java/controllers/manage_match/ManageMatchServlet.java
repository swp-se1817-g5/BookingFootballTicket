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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thuat
 */

@WebServlet(name = "ManageMatchServlet", urlPatterns = {"/manageMatch"})
public class ManageMatchServlet extends HttpServlet {
    private static final String ACTION_1 = "createMatch";
    private static final String ACTION_2 = "updateMatch";
    private static final String ACTION_3 = "deleteMatch";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute(ACTION_1) != null) {
            request.setAttribute("created", (boolean)session.getAttribute(ACTION_1));
            session.removeAttribute(ACTION_1);
        }


        if (session.getAttribute(ACTION_2) != null) {
            request.setAttribute("updated", (boolean)session.getAttribute(ACTION_2));
            session.removeAttribute(ACTION_2);


        }
        if (session.getAttribute(ACTION_3) != null) {
            request.setAttribute("deleted", (boolean)session.getAttribute(ACTION_3));
            session.removeAttribute(ACTION_3);
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
