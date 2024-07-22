/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageNews;

import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.News;
import models.NewsState;

/**
 *
 * @author nguye
 */
@WebServlet(name = "ManageNewsServlet", urlPatterns = {"/manageNews"})
public class ManageNewsServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageNewsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public boolean isNullOrBlank(String str) {
        return str == null || str.trim().isEmpty();
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<News> listNews;
        ArrayList<NewsState> listState;
        String valueSearch = request.getParameter("valueSearch");
        valueSearch = valueSearch == null ? "" : valueSearch.trim();
        listNews = NewsDAO.getInstance().getlistNews(valueSearch.toLowerCase());
        listState = NewsDAO.getInstance().getListState();
        if (!listNews.isEmpty() || !listState.isEmpty()) {
            session.setAttribute("getListNews", listNews);
            session.setAttribute("getListState", listState);
        }
        if (session.getAttribute("newsCreated") != null) {
            request.setAttribute("created", session.getAttribute("newsCreated"));
            session.removeAttribute("newsCreated");
        }
        if (session.getAttribute("newsUpdated") != null) {
            request.setAttribute("updated", session.getAttribute("newsUpdated"));
            session.removeAttribute("newsUpdated");
        }
        if (session.getAttribute("newsDeleted") != null) {
            request.setAttribute("deleted", session.getAttribute("newsDeleted"));
            session.removeAttribute("newsDeleted");
        }
        request.getRequestDispatcher("views/manageNews.jsp").forward(request, response);
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
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
// </editor-fold>
}
