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

@WebServlet(name = "CreateFootballClubServlet", urlPatterns = {"/createFootballClub"})
@MultipartConfig
public class CreateFootballClubServlet extends HttpServlet {

    private static final String IMAGE_FOLDER = "/images/footballclubs/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageFootballClub");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean fcCreated = false;
        try {
            Part part = request.getPart("image");
        
                String img = part == null ? "" : handleFileUpload(part, request);
                String clubName = request.getParameter("clubName").trim();
                String description = request.getParameter("description");
                description = description == null ? "" : description.trim();
                FootballClub fc = new FootballClub();
                fc.setClubName(clubName);
                fc.setImg(img);
                fc.setDescription(description);
                fcCreated = FootballClubDAO.getInstance().createFootballClub(fc);
            
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
        response.sendRedirect("manageFootballClub?fcCreated=" + fcCreated);

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

    @Override
    public String getServletInfo() {
        return "Servlet for creating a football club with image upload functionality.";
    }
}
