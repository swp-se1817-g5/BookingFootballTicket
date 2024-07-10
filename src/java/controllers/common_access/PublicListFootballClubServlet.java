/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.common_access;

import com.google.gson.JsonObject;
import dal.FootballClubDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.FootballClub;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "PublicListFootballClubServlet", urlPatterns = {"/publicListFootballClub"})
public class PublicListFootballClubServlet extends HttpServlet {

    int RECORDS_PER_PAGE = 12;

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
            out.println("<title>Servlet PublicListFootballClubServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PublicListFootballClubServlet at " + request.getContextPath() + "</h1>");
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
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String search = request.getParameter("search");
        search = search == null ? "" : search.trim();

        List<FootballClub> fcs = FootballClubDAO.getInstance().paggingFootballClubs(page, RECORDS_PER_PAGE, search);
        int noOfRecords = FootballClubDAO.getInstance().gettotalRecords(search);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);
        request.setAttribute("allFootballClubs", FootballClubDAO.getInstance().getFootballClubs(""));
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("search", search);
        request.setAttribute("fcs", fcs);
        request.getRequestDispatcher("views/publicListFootballClub.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String search = request.getParameter("search");
        search = (search == null) ? "" : search.trim();

        List<FootballClub> fcs = FootballClubDAO.getInstance().paggingFootballClubs(page, RECORDS_PER_PAGE, search);

        int noOfRecords = FootballClubDAO.getInstance().gettotalRecords(search);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / RECORDS_PER_PAGE);

        // StringBuilder for football club list HTML
        StringBuilder footballClubListHtml = new StringBuilder();

        if (fcs == null || fcs.isEmpty()) {
            footballClubListHtml.append("<div style=\"padding: 10px; background-color: #f1f1f1; border: 1px solid #ddd; margin-bottom: 10px; margin: auto ; color: red;\">Không có đội bóng nào phù hợp!</div>");
        } else {
            for (FootballClub fc : fcs) {
                footballClubListHtml.append("<div class=\"col-md-3 col-sm-6 mb-4\">")
                        .append("<div class=\"card\">")
                        .append("<div class=\"text-center mt-1\"><img src=\"")
                        .append(fc.getImg())
                        .append("\" style=\"width: 65%; height: auto;\" alt=\"Team\"></div>")
                        .append("<div class=\"card-body\">")
                        .append("<h5 class=\"card-title\">")
                        .append(fc.getClubName())
                        .append("</h5>")
                        .append("<a href=\"publicFootballClub?fcId=")
                        .append(fc.getClubId())
                        .append("\" class=\"btn btn-primary\">Chi tiết</a>")
                        .append("</div>")
                        .append("</div>")
                        .append("</div>");
            }
        }

        // StringBuilder for pagination HTML
        StringBuilder paginationHtml = new StringBuilder();

        paginationHtml.append("<div class=\"clearfix col-12\">")
                .append("<ul class=\"pagination\">");

        if (page > 1) {
            paginationHtml.append("<li class=\"page-item\">")
                    .append("<a class=\"page-link\" href=\"javascript:void(0);\" onclick=\"fetchFootballClubs(")
                    .append(page - 1)
                    .append(")\" style=\"font-size: 20px\"><</a>")
                    .append("</li>");
        }

        for (int i = 1; i <= noOfPages; i++) {
            paginationHtml.append("<li class=\"page-item ")
                    .append(i == page ? "active" : "")
                    .append("\">");

            if (i == page) {
                paginationHtml.append("<span class=\"page-link\">")
                        .append(i)
                        .append("</span>");
            } else {
                paginationHtml.append("<a class=\"page-link\" href=\"javascript:void(0);\" onclick=\"fetchFootballClubs(")
                        .append(i)
                        .append(")\">")
                        .append(i)
                        .append("</a>");
            }

            paginationHtml.append("</li>");
        }

        if (page < noOfPages) {
            paginationHtml.append("<li class=\"page-item\">")
                    .append("<a class=\"page-link\" href=\"javascript:void(0);\" onclick=\"fetchFootballClubs(")
                    .append(page + 1)
                    .append(")\" style=\"font-size: 20px\">></a>")
                    .append("</li>");
        }

        paginationHtml.append("</ul>")
                .append("</div>");

// Create JSON response object
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("footballClubList", footballClubListHtml.toString());
        jsonResponse.addProperty("pagination", paginationHtml.toString());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
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
