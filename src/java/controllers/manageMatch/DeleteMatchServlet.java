/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageMatch;

import dal.MatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thuat
 */
@WebServlet(name = "DeleteMatchServlet", urlPatterns = {"/deleteMatch"})
public class DeleteMatchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                boolean deleted = false;
        try {
            int matchId = Integer.parseInt(request.getParameter("matchId"));
            deleted = MatchDAO.INSTANCE.deleteMatch(matchId);
        } catch (NumberFormatException e) {
        }
        request.setAttribute("deleted", deleted);
        request.getRequestDispatcher("manageMatch").forward(request, response);
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
