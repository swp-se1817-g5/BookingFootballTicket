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
import models.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "CreateNewNewsServlet", urlPatterns = {"/createNewNews"})
@MultipartConfig
public class CreateNewNewsServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateNewNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateNewNewsServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        try {
//            User createdByRaw = (User) session.getAttribute("currentUser");
            User createdByRaw = new User();
            createdByRaw.setEmail("duongnche173192@fpt.edu.vn");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String conclusion = request.getParameter("conclusion");
            int status = 1;
            int stateRaw = Integer.parseInt(request.getParameter("state"));
            boolean state = false;
            if (stateRaw == 1) {
                state = true;
            }
            Part part = request.getPart("image");
            String imagePath = null;
            if ((part == null) || (part.getSubmittedFileName().trim().isEmpty()) || (part.getSubmittedFileName() == null)) {
                imagePath = "";
                out.print("if");
            } else {
                String path = request.getServletContext().getRealPath("/images/news");
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File image = new File(dir, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                imagePath = request.getContextPath() + "/images/news/" + image.getName();
                News news = new News(title, content, imagePath, conclusion, createdByRaw.getEmail(), status, state);
                session.setAttribute("created", NewsDAO.getInstance().createNews(news));
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
        response.sendRedirect("manageNews");
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
