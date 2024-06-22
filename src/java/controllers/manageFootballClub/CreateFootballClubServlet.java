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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.FootballClub;
import models.User;

@WebServlet(name = "CreateFootballClubServlet", urlPatterns = {"/createFootballClub"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class CreateFootballClubServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateFootballClubServlet.class.getName());
    private static final String IMAGE_FOLDER = "images/footballclubs";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("views/manageFootballClub.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean fcCreated = false;
        HttpSession session = request.getSession();
        try {
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String img = handleFileUpload(filePart);
                String clubName = request.getParameter("clubName").trim();
                String description = request.getParameter("description");
                description = description == null ? "" : description.trim();
                FootballClub fc = new FootballClub();
                fc.setClubName(clubName);
                fc.setImg(img);
                fc.setDescription(description);
                fcCreated = FootballClubDAO.getInstance().createFootballClub(fc);
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
        session.setAttribute("fcCreated", fcCreated);
        response.sendRedirect("manageFootballClub?fcCreated=" + fcCreated);

    }

    private String handleFileUpload(Part filePart) throws IOException {
        String fileName = getFileName(filePart);
        if (fileName == null) {
            throw new IOException("Invalid file name.");
        }

        String storePath = getServletContext().getRealPath("/" + IMAGE_FOLDER);
        File uploads = new File(storePath);
        if (!uploads.exists()) {
            Files.createDirectories(uploads.toPath());
        }

        File file = new File(uploads, fileName);

        try (InputStream input = filePart.getInputStream(); FileOutputStream output = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }

        return IMAGE_FOLDER + "/" + fileName;
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (contentDisposition != null) {
            for (String content : contentDisposition.split(";")) {
                if (content.trim().startsWith("filename")) {
                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Servlet for creating a football club with image upload functionality.";
    }
}
