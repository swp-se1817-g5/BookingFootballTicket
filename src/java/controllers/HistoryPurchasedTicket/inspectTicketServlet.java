/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.HistoryPurchasedTicket;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.FormatException;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author nguye
 */
@WebServlet(name = "inspectTicketServlet", urlPatterns = {"/inspectTicket"})
@MultipartConfig
public class inspectTicketServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inspectTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet inspectTicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/inspectTicket.jsp").forward(request, response);
    }

    public String getTextQRCode(String path) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            throw new FileNotFoundException("File not found: " + path);
        }
        try (InputStream barCodeInputStream = new FileInputStream(file)) {
            BufferedImage bufferedImage = ImageIO.read(barCodeInputStream);
            LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            Reader reader = new MultiFormatReader();
            try {
                Result result = reader.decode(bitmap);
                return result.getText();
            } catch (NotFoundException | ChecksumException | FormatException ex) {
                Logger.getLogger(inspectTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public String getImagePath(HttpServletRequest request, HttpServletResponse response, Part part) throws ServletException, IOException {
        if (part == null || part.getSubmittedFileName().trim().isEmpty()) {
            return null;
        }
        String path = request.getServletContext().getRealPath("/images/qrcode");
        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File image = new File(dir, part.getSubmittedFileName());
        part.write(image.getAbsolutePath());
        return image.getAbsolutePath();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Part part = request.getPart("qrcode");
            String imagePath = getImagePath(request, response, part);
            if (imagePath != null) {
                String resultQRCode = getTextQRCode(imagePath);
                out.print(resultQRCode);
            } else {
                out.print("No QR code file uploaded.");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
