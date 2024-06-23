/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageFootballClub;

import dal.FootballClubDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import models.FootballClub;
import models.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "UpdateFootballClubServlet", urlPatterns = {"/updateFootballClub"})
@MultipartConfig
public class UpdateFootballClubServlet extends HttpServlet {
    private static final String IMAGE_FOLDER = "/images/footballclubs/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageFootballClub");
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
        boolean fcUpdated = false;
        try {
                
                
                int clubIb = Integer.parseInt(request.getParameter("clubId"));
                FootballClub f = FootballClubDAO.getInstance().getFootballClubbyID(clubIb);
                Part part = request.getPart("image");
                String img = f.getImg();
                if(part != null && part.getSize() > 0)
                    img = handleFileUpload(part, request);
                String clubName = request.getParameter("clubName").trim();
                String description = request.getParameter("description");
                description = description == null ? "" : description.trim();
                User user = (User)session.getAttribute("currentUser");
                FootballClub fc = new FootballClub();
                fc.setClubId(clubIb);
                fc.setClubName(clubName);
                fc.setImg(img);
                fc.setDescription(description);
                fc.setUpdatedBy(user.getEmail());
                fcUpdated = FootballClubDAO.getInstance().updateFootballClub(fc);
            
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
        response.sendRedirect("manageFootballClub?fcUpdated=" + fcUpdated);
    }

    private String handleFileUpload(Part part, HttpServletRequest request) throws ServletException, IOException {
        String imagePath = null;    
        if ((part != null) && (!part.getSubmittedFileName().trim().isEmpty()) && (part.getSubmittedFileName() != null)) {
            String path = request.getServletContext().getRealPath(IMAGE_FOLDER);
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File image = new File(dir, part.getSubmittedFileName());
            part.write(image.getAbsolutePath());
            imagePath = request.getContextPath() + IMAGE_FOLDER + image.getName();
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
