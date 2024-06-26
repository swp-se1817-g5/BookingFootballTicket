/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageFootballClub;

import dal.FootballClubDAO;
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
 * @author admin
 */
@WebServlet(name = "ManageFootballClubServlet", urlPatterns = {"/manageFootballClub"})
public class ManageFootballClubServlet extends HttpServlet {

    private final int NUM_OF_RECORDS = 2;
    private int pageIndex = 1;

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
            out.println("<title>Servlet ManageFootballClubServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageFootballClubServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("fcCreated") != null) {
            request.setAttribute("created", (boolean)session.getAttribute("fcCreated"));
            session.removeAttribute("fcCreated");
        }


        if (session.getAttribute("fcUpdated") != null) {
            request.setAttribute("updated", (boolean)session.getAttribute("fcUpdated"));
            session.removeAttribute("fcUpdated");


        }
        if (session.getAttribute("fcDeleted") != null) {
            request.setAttribute("deleted", (boolean)session.getAttribute("fcDeleted"));
            session.removeAttribute("fcDeleted");
        }
        
        String search = request.getParameter("search");
        search = search == null ? "" : search.trim();
        
        int totalRecords = FootballClubDAO.getInstance().gettotalRecords(search);
        int endPage = (totalRecords / NUM_OF_RECORDS);
        if (totalRecords % NUM_OF_RECORDS != 0 || totalRecords == 0) {
            endPage++;
        }
        
        try {
            String pageIndexRaw = request.getParameter("pageIndex");
            if (pageIndexRaw != null) {
                pageIndex = Integer.parseInt(pageIndexRaw);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("search", search);
        request.setAttribute("footballClubs", FootballClubDAO.getInstance().paggingFootballClubs(pageIndex, NUM_OF_RECORDS, search));
        request.setAttribute("url", "manageFootballClub");
        
        request.getRequestDispatcher("views/manageFootballClub.jsp").forward(request, response);
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
