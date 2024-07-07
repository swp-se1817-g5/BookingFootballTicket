/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.dashboard;

import com.google.gson.Gson;
import dal.DashboardDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.collections4.list.AbstractLinkedList;


/**
 *
 * @author admin
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends HttpServlet {

    private static final int NUMBER_OF_YEAR = 5;

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
            out.println("<title>Servlet DashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardServlet at " + request.getContextPath() + "</h1>");
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
        LocalDate now = LocalDate.now();
        int monthNow = now.getMonthValue();
        int yearNow = now.getYear();

        request.setAttribute("totalRevenueThisMonth", convertNumber(DashboardDAO.getInstance().getTotalRevenue(monthNow, yearNow)));
        request.setAttribute("totalRevenue", convertNumber(DashboardDAO.getInstance().getTotalRevenue()));
        request.setAttribute("totalTicketsSoldThisMonth", convertNumber(new BigDecimal(DashboardDAO.getInstance().getTotalTicketsSold(monthNow, yearNow))));
        request.setAttribute("totalTicketsSold", convertNumber(new BigDecimal(DashboardDAO.getInstance().getTotalTicketsSold())));
        request.setAttribute("url", "dashboard");
        request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
    }

    private String convertNumber(BigDecimal number) {
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(number);
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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            Map<String, Object> ticketData = new HashMap<>();
            LocalDate now = LocalDate.now();
            int yearNow = now.getYear();
            List<Integer> years = new ArrayList<>();
            List<Integer> matchTickets = new ArrayList<>();
            List<Integer> seasonTickets = new ArrayList<>();
            List<BigDecimal> totalRevenue = new ArrayList<>();
            List<Integer> totalTickets = new ArrayList<>();
            List<Integer> ticketYear = new ArrayList<>();
            List<BigDecimal> revenueYear = new ArrayList<>();
            for (int i = yearNow - NUMBER_OF_YEAR; i <= yearNow; i++) {
                years.add(i);
                matchTickets.add((DashboardDAO.getInstance().getTotalTicketsSold(0, i) - DashboardDAO.getInstance().countSeasonTickets(0, i)));
                seasonTickets.add(DashboardDAO.getInstance().countSeasonTickets(0, i));
                totalTickets.add(DashboardDAO.getInstance().getTotalTicketsSold(0, i));
                totalRevenue.add(DashboardDAO.getInstance().getTotalRevenue(0, i));
            }
            for (int i = 1; i <= 12; i++) {
                ticketYear.add(DashboardDAO.getInstance().getTotalTicketsSold(i, yearNow));
                revenueYear.add(DashboardDAO.getInstance().getTotalRevenue(i, yearNow));
            }
            ticketData.put("years", years);
            ticketData.put("matchTickets", matchTickets);
            ticketData.put("seasonTickets", seasonTickets);
            ticketData.put("totalRevenue", totalRevenue);
            ticketData.put("totalTickets", totalTickets);
            ticketData.put("ticketYear", ticketYear);
            ticketData.put("revenueYear", revenueYear);
            String json = new Gson().toJson(ticketData);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
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
