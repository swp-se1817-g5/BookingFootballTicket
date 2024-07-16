/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vnpay;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import Config.Config;
import controllers.Auth.resetService;
import dal.DaoBooking;
import dal.MatchDAO;
import dal.MatchSeatDAO;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import models.BookingTicket;
import models.HistoryPurchasedTicketMatchSeat;
import models.Match;
import models.User;

/**
 *
 * @author AD
 */
@WebServlet(name = "vnpayReturn", urlPatterns = {"/vnpayReturn"})
public class vnpayReturn extends HttpServlet {

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
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            if (signValue.equals(vnp_SecureHash)) {
                String paymentCode = request.getParameter("vnp_TransactionNo");
                String ticketIdStr = request.getParameter("vnp_TxnRef");
                boolean transSuccess = false;
                int ticketId = Integer.parseInt(ticketIdStr);
                BookingTicket booking = DaoBooking.INSTANCE.getBookingTicketById(ticketId);
                Match match = MatchDAO.INSTANCE.getMatcheById(booking.getMatchId() + "");
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    //update banking system

                    HttpSession session = request.getSession();
                    if (session.getAttribute("currentUser") == null) {
                        response.sendRedirect("homePage");
                        return;
                    }
                    User user = (User) session.getAttribute("currentUser");

                    String email = user.getEmail();
                    booking.setEmail(email);
                    HistoryPurchasedTicketMatchSeat his = new HistoryPurchasedTicketMatchSeat(match.getTeam1().getClubName(), match.getTeam2().getClubName(),
                            match.getLocalDateTime(), match.getSeason().getSeasonName(), booking.getSeatName(), booking.getQuantity(),
                            booking.getStandName(), booking.getSeatClassName(), email, booking.getQrCode(), booking.getPrice(), email, LocalDateTime.now(), booking.getMatchSeatId());
//                    HistoryPurchasedTicketMatchSeat his = new HistoryPurchasedTicketMatchSeat(
//                            booking.getSeatName(), booking.getQuantity(), booking.getStandName(),
//                            booking.getSeatClassName(), booking.getQrCode(), booking.getPrice(),
//                            booking.getCreatedDate(), email
//                    );

                    MatchSeatDAO.INSTANCE.addOrderTicket(his);
                    booking.setStatus("done");

                    transSuccess = true;
                    resetService service = new resetService();
                } else {
                    MatchSeatDAO.INSTANCE.returnAvailability(booking);
                    booking.setStatus("cancel");
                }

                DaoBooking.INSTANCE.updateBookingStatus(booking);

                request.getSession().setAttribute("transResult", transSuccess);
                if (transSuccess) {

                    response.sendRedirect("homePage");
                } else {

                    response.sendRedirect("./matchDetail?matchId=" + booking.getMatchId());
                }
            }
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
        processRequest(request, response);
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
