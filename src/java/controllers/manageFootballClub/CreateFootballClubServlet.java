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

        try {
            Part filePart = request.getPart("imae");
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

        }

        response.sendRedirect("manageFootballClub?created=" + created);
    }

    /**
     * Handles the upload of a file part from an HTTP request.
     *
     * @param filePart the file part from the HTTP request
     * @return the relative file path where the uploaded file is stored
     * @throws IOException if an error occurs during file upload
     */
    private String handleFileUpload(Part filePart) throws IOException {
        // Extract the file name from the content-disposition header of the part
        String fileName = getFileName(filePart);

        // If the file name is invalid (null), throw an IOException
        if (fileName == null) {
            throw new IOException("Invalid file name.");
        }

        // Get the absolute path to the folder where the file should be stored
        String storePath = getServletContext().getRealPath("/" + IMAGE_FOLDER);

        // Create a File object representing the upload folder
        File uploads = new File(storePath);

        // If the upload folder does not exist, create it (and any necessary parent directories)
        if (!uploads.exists()) {
            Files.createDirectories(uploads.toPath());
        }

        // Create a File object representing the full path to the new file
        File file = new File(uploads, fileName);

        // Try-with-resources to ensure the input and output streams are closed properly
        try (InputStream input = filePart.getInputStream(); FileOutputStream output = new FileOutputStream(file)) {

            // Buffer to hold chunks of data read from the input stream
            byte[] buffer = new byte[1024];
            int bytesRead;

            // Read from the input stream and write to the output stream in chunks of 1024 bytes
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }

        // Return the relative file path to be stored in the database
        return IMAGE_FOLDER + "/" + fileName;
    }

    /**
     * Extracts the file name from the content-disposition header of the given
     * Part.
     *
     * @param part the Part from which to extract the file name
     * @return the extracted file name, or null if the file name cannot be
     * determined
     */
    private String getFileName(Part part) {
        // Get the content-disposition header from the Part
        String contentDisposition = part.getHeader("content-disposition");

        // Check if the content-disposition header is not null
        if (contentDisposition != null) {
            // Split the content-disposition header by semicolon to parse individual components
            for (String content : contentDisposition.split(";")) {
                // Trim the content to remove any leading or trailing whitespace
                // Check if the content starts with "filename" (indicating the file name is present)
                if (content.trim().startsWith("filename")) {
                    // Extract the file name by finding the substring after the equals sign
                    // Remove any surrounding double quotes from the file name
                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        // Return null if the file name cannot be determined
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Servlet for creating a football club with image upload functionality.";
    }
}
