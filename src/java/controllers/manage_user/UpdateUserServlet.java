/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_user;

import dal.UserDAO;
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
import models.User;

/**
 *
 * @author Vinh
 */
@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/updateUser"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UpdateUserServlet extends HttpServlet {

    private static final String IMAGE_FOLDER = "/images/avatars/";

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
            out.println("<title>Servlet UpdateUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        boolean updated = false;
        User currentUser = (User) session.getAttribute("currentUser");
        String updatedBy = currentUser.getEmail();

        // Handle potential null values
        String email = request.getParameter("detailEmail");
        if (email != null) {
            email = email.trim();
        }

        String name = request.getParameter("detailName");
        if (name != null) {
            name = name.trim();
        }
        String phoneNumber = request.getParameter("detailPhoneNumber");
        if (phoneNumber != null) {
            phoneNumber = phoneNumber.trim();
        }
        Part part = request.getPart("detailAvatar");
        String avatar = currentUser.getAvatar();
        if (part != null && part.getSize() > 0) {
            avatar = handleFileUpload(part, request);
        }
        // Check if the necessary parameters are present and not blank
        if (email != null && !email.isBlank() && name != null && !name.isBlank() && phoneNumber != null && !phoneNumber.isBlank()) {
            User user = UserDAO.getINSTANCE().getUserByEmail(email);
            user.setEmail(email);
            user.setName(name);
            user.setPhoneNumber(phoneNumber);
            user.setAvatar(avatar);
            user.setUpdatedBy(updatedBy);
            updated = UserDAO.getINSTANCE().updateUser(user);
        }
        response.sendRedirect("manageUser?updated=" + updated);
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
