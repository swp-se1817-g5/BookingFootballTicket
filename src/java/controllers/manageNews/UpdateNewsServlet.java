/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageNews;

import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import models.News;
import models.NewsState;
import models.NewsStatus;
import models.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UpdateNewsServlet", urlPatterns = {"/updateNews"})
@MultipartConfig
public class UpdateNewsServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateNewsServlet at " + request.getContextPath() + "</h1>");
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
        String statusId_raw = request.getParameter("statusId");
        String stateId_raw = request.getParameter("stateId");
        String title;
        String content;
        String conclusion;
        int statusId;
        int stateId;
        try {
            int newsId = Integer.parseInt(request.getParameter("newsId"));
            title = request.getParameter("title").trim();
            content = request.getParameter("content").trim();
            conclusion = request.getParameter("conclusion").trim();
            statusId = Integer.parseInt(statusId_raw);
            stateId = Integer.parseInt(stateId_raw);
            if (statusId == 1 || statusId == 2) {
                stateId = 1;
            }
            String currentImage = request.getParameter("currentImage");
            Part part = request.getPart("image");
            String imagePath;
            imagePath = getImagePath(request, response, part, currentImage);
            News news = NewsDAO.getInstance().getNewsByNewsId(newsId);
            news.setTitle(title);
            news.setContent(content);
            news.setConclusion(conclusion);
            news.setImage(imagePath);
            NewsStatus newsStatus = new NewsStatus();
            newsStatus.setStatusId(statusId);
            news.setStatusId(newsStatus);
            NewsState newsState = new NewsState();
            newsState.setStateId(stateId);
            news.setStateId(newsState);
            news.setNewsId(newsId);
            User createdBy_raw = (User) session.getAttribute("currentUser");
            news.setUpdateBy(createdBy_raw.getEmail());
            session.setAttribute("newsUpdated", NewsDAO.getInstance().updateNews(news));
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageNews");
    }

    public String getImagePath(HttpServletRequest request, HttpServletResponse response, Part part, String currentImage) throws ServletException, IOException {
        String imagePath = null;
        if ((part == null) || (part.getSubmittedFileName().trim().isEmpty()) || (part.getSubmittedFileName() == null)) {
            imagePath = currentImage;
        } else {
            String path = request.getServletContext().getRealPath("/images/news");
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File image = new File(dir, part.getSubmittedFileName());
            part.write(image.getAbsolutePath());
            imagePath = request.getContextPath() + "/images/news/" + image.getName();
        }
        return imagePath;
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
