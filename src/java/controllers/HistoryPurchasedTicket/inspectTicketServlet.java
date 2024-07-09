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
import dal.HistoryPurchasedTicketDAO;
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
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import models.HistoryPurchasedTicketMatchSeat;

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
        PrintWriter out = response.getWriter();
        String qrcode = request.getParameter("qrcode");
        out.print(qrcode);
        ArrayList<HistoryPurchasedTicketMatchSeat> listHistoryPurchasedTicket = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
        for (HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat : listHistoryPurchasedTicket) {
            if (qrcode.equals(historyPurchasedTicketMatchSeat.getQrCode())) {
                request.setAttribute("checkQRCode", HistoryPurchasedTicketDAO.getInstance().updateListHistoryPurchasedTicketMatchSeat(qrcode));
            }
        }
        request.setAttribute("getListHistoryPurchasedTicketMatchSeat", HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat());
        request.getRequestDispatcher("views/inspectTicket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
