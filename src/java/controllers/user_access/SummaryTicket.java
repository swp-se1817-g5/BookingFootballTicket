/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.user_access;

import dal.MatchDAO;
import dal.MatchSeatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import models.Match;
import models.User;

/**
 *
 * @author thuat
 */
@WebServlet(name = "SummaryTicket", urlPatterns = {"/summaryTicket"})
public class SummaryTicket extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SummaryTicket</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SummaryTicket at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        String numberOfTicketString = request.getParameter("numberOfTicket");
        String matchSeatIdString = request.getParameter("matchSeatId");
        String seatIdString = request.getParameter("seatId");
        String matchId = request.getParameter("mathId");
        
        
        int numberOfTicket;
        int matchSeatId;
        int seatId;
        try {
            numberOfTicket = Integer.parseInt(numberOfTicketString);
            matchSeatId = Integer.parseInt(matchSeatIdString);
            seatId = Integer.parseInt(seatIdString);
            request.setAttribute("seat", MatchSeatDAO.INSTANCE.getMatchSeatbyMatchSeatId(seatId));
            request.setAttribute("matchSeatId", matchSeatId);
            request.setAttribute("numberOfTicket", numberOfTicket);

            Match match = MatchDAO.INSTANCE.getMatcheById(
                    MatchSeatDAO.INSTANCE.getMatchSeatbyMatchSeatId(seatId).getMatch()+"");
            
            String dateTimeString = match.getTime();
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, inputFormatter);
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMMM dd, yyyy");
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
            String date = dateTime.toLocalDate().format(dateFormatter);
            String time = dateTime.toLocalTime().format(timeFormatter);

            request.setAttribute("user", currentUser);
            request.setAttribute("date", date);
            request.setAttribute("time", time);
            request.setAttribute("match", match);
            request.setAttribute("matchId", matchId);
            request.setAttribute("seatId", seatIdString);
            
            request.setAttribute("seatByMatch", MatchSeatDAO.INSTANCE.getMatchSeatbyMatch(matchSeatId));
            request.getRequestDispatcher("views/ticketSummary.jsp").forward(request, response);
        } catch (Exception e) {

        }
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
