/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.HistoryPurchasedTicket;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import dal.HistoryPurchasedTicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.HistoryPurchasedTicketMatchSeat;
import models.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "MyTicketServlet", urlPatterns = {"/myTicket"})
public class MyTicketServlet extends HttpServlet {

    private static final int PAGE_SIZE = 10;
    private int pageIndex = 1;

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
            out.println("<title>Servlet MyTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyTicketServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        String email = user.getEmail();
        String type = request.getParameter("type");
        type = type == null ? "match" : type;
        String startDate = request.getParameter("startDate");
        startDate = startDate == null ? "" : startDate;
        String endDate = request.getParameter("endDate");
        endDate = endDate == null ? "" : endDate;
        int totalRecords = 0;
        if (type.equals("match")) {
            try {
                totalRecords = HistoryPurchasedTicketDAO.getInstance().getTotalRecords(startDate, endDate, email);
            } catch (ParseException ex) {
                Logger.getLogger(MyTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        int endPage = totalRecords / PAGE_SIZE;
        if (totalRecords % PAGE_SIZE != 0 || totalRecords == 0) {
            endPage++;
        }
        try {
            String pageIndexRaw = request.getParameter("pageIndex");
            if (pageIndexRaw != null) {
                pageIndex = Integer.parseInt(pageIndexRaw);
            }
        } catch (Exception e) {
        }

        if (type.equals("match")) {
            try {
                request.setAttribute("tickets", HistoryPurchasedTicketDAO.getInstance().paggingTickets(pageIndex, PAGE_SIZE, startDate, endDate, email));
            } catch (ParseException ex) {
                Logger.getLogger(MyTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("views/myTicket.jsp").forward(request, response);
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
    String ticketId = request.getParameter("ticketId");
    List<HistoryPurchasedTicketMatchSeat> tickets = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
    HistoryPurchasedTicketMatchSeat ticket = null;
    for (HistoryPurchasedTicketMatchSeat t : tickets) {
        if (String.valueOf(t.getTicketId()).equals(ticketId)) {
            ticket = t;
            break;
        }
    }

    if (ticket != null) {
        try {
            String qrContent = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath() +"/inspectTicket?qrcode=" + ticket.getQrCode();
            String relativeQrFilePath = generateQRCodeImage(request.getContextPath(), qrContent, 350, 350, getServletContext().getRealPath(QR_CODE_DIRECTORY));
            request.setAttribute("qrCode", relativeQrFilePath);
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("views/myTicketDetail.jsp").forward(request, response);
        } catch (WriterException ex) {
            Logger.getLogger(MyTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } else {
        response.getWriter().write("Ticket not found");
    }
}


    private static final String QR_CODE_DIRECTORY = "/images/qrCodes/";

    private String generateQRCodeImage(String contextPath, String qrContent, int width, int height, String qrCodeDirectory)
        throws WriterException, IOException {
    QRCodeWriter qrCodeWriter = new QRCodeWriter();
    BitMatrix bitMatrix = qrCodeWriter.encode(qrContent, BarcodeFormat.QR_CODE, width, height);

    // Sử dụng mã băm để tạo tên tệp hợp lệ
    String fileName = Integer.toHexString(qrContent.hashCode()) + ".png";

    // Tạo đường dẫn tuyệt đối của file QR
    String filePath = qrCodeDirectory + fileName;

    // Tạo đường dẫn tương đối từ thư mục gốc của dự án
    Path path = Paths.get(filePath);

    // Kiểm tra nếu thư mục không tồn tại, tạo mới
    Files.createDirectories(path.getParent());

    // Ghi BitMatrix vào file PNG
    MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);

    // Trả về đường dẫn tương đối từ thư mục gốc của dự án
    return contextPath + QR_CODE_DIRECTORY + fileName;
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
