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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thuat
 */
@WebServlet(name = "ManageMatchServlet", urlPatterns = {"/manageMatch"})
public class ManageMatchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("created") != null) {
            request.setAttribute("created", (boolean)session.getAttribute("created"));
            session.removeAttribute("created");
        }
        if(session.getAttribute("updated") != null) {
            request.setAttribute("updated", (boolean)session.getAttribute("updated"));
            session.removeAttribute("updated");
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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
