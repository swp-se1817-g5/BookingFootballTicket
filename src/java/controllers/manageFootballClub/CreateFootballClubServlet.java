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

@WebServlet(name = "CreateFootballClubServlet", urlPatterns = {"/createFootballClub"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class CreateFootballClubServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateFootballClubServlet.class.getName());
    private static final String IMAGE_FOLDER = "Images/FootballClubs";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("views/manageFootballClub.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean created = false;
        HttpSession session = request.getSession();
        String errorMessage = null;

        try {
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String img = handleFileUpload(filePart);
                String clubName = request.getParameter("clubName");
                String userName = (String) session.getAttribute("userName");

                FootballClub fc = new FootballClub();
                fc.setClubName(clubName);
                fc.setImg(img);
                fc.setCreatedBy(userName);

                created = FootballClubDAO.INSTANCE.createFootballClub(fc);
            }
        } catch (IOException | ServletException e) {
            errorMessage = e.getMessage();
            LOGGER.log(Level.SEVERE, "Error processing the file upload", e);
        }

        if (created) {
            response.sendRedirect("manageFootballClub?created=true");
        } else {
            try (PrintWriter out = response.getWriter()) {
                response.setContentType("text/html;charset=UTF-8");
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error Creating Football Club</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error Creating Football Club</h1>");
                if (errorMessage != null) {
                    out.println("<p>Error: " + errorMessage + "</p>");
                } else {
                    out.println("<p>An unknown error occurred.</p>");
                }
                out.println("<a href=\"views/manageFootballClub.jsp\">Back to Manage Football Club</a>");
                out.println("</body>");
                out.println("</html>");
            }
        }
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
