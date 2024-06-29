/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_match;

import dal.MatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteMatchServlet", urlPatterns = {"/deleteMatch"})
public class DeleteMatchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        boolean deleted = false;
        try {
            int matchId = Integer.parseInt(request.getParameter("matchId"));
            deleted = MatchDAO.INSTANCE.deleteMatch(matchId);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid date time format", e);
        }
        session.setAttribute("deleteMatch", deleted);

        response.sendRedirect("manageMatch");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageMatch");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
