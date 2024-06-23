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
import models.NewsStatus;

/**
 *
 * @author nguye
 */
@WebServlet(name = "ManageNewsServlet", urlPatterns = {"/manageNews"})
public class ManageNewsServlet extends HttpServlet {

    private static final String CREATED = "created";
    private static final String UPDATED = "updated";
    private static final String DELETED = "deleted";

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
        ArrayList<NewsStatus> listStatus;
        ArrayList<NewsState> listState;

        String go = request.getParameter("go");
        if (!isNullOrBlank(go)) {
            if (go.equals("search")) {
                String valueSearch = request.getParameter("valueSearch").trim();
                listNews = NewsDAO.getInstance().search(valueSearch);
                if (!listNews.isEmpty()) {
                    session.setAttribute("getListNews", listNews);
                }
            }
        } else {
            listNews = NewsDAO.getInstance().getlistNews();
            listStatus = NewsDAO.getInstance().getListStatus();
            listState = NewsDAO.getInstance().getListState();
            if (!listNews.isEmpty() || !listState.isEmpty() || !listStatus.isEmpty()) {
                session.setAttribute("getListNews", listNews);
                session.setAttribute("getListState", listState);
                session.setAttribute("getListStatus", listStatus);
            }

            if (session.getAttribute(CREATED) != null) {
                request.setAttribute(CREATED, session.getAttribute(CREATED));
                session.removeAttribute(CREATED);
            }
            if (session.getAttribute(UPDATED) != null) {
                request.setAttribute(UPDATED, session.getAttribute(UPDATED));
                session.removeAttribute(UPDATED);
            }
            if (session.getAttribute(DELETED) != null) {
                request.setAttribute(DELETED, session.getAttribute(DELETED));
                session.removeAttribute(DELETED);
            }
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
