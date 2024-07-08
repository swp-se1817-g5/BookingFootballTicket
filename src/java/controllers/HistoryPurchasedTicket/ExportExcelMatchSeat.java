/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.HistoryPurchasedTicket;

import dal.HistoryPurchasedTicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.swing.JFileChooser;
import models.HistoryPurchasedTicketMatchSeat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author AD
 */
@WebServlet(name = "ExportExcelMatchSeat", urlPatterns = {"/ExportExcelMatchSeat"})
public class ExportExcelMatchSeat extends HttpServlet {

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
            out.println("<title>Servlet ExportExcel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcel at " + request.getContextPath() + "</h1>");
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
        String service = request.getParameter("service");
        HistoryPurchasedTicketDAO matchDAO = new HistoryPurchasedTicketDAO();

        if ("export".equals(service)) {
            ArrayList<HistoryPurchasedTicketMatchSeat> matchList = matchDAO.getlistHistoryPurchasedTicketMatchSeat();
            boolean isExport = exportToExcel(matchList);
            String exportMessage = isExport ? "Xuất Excel thành công!" : "Xuất Excel thất bại!";
            request.setAttribute("mess", exportMessage); // Đảm bảo "mess" được thiết lập với thông báo tương ứng

            // Sau khi export thành công, chuyển hướng đến trang manageUser.jsp
            response.sendRedirect(request.getContextPath() + "/manageHistoryPurchasedTicketMatchSeat");
            return; // Cần return để dừng việc thực hiện các lệnh tiếp theo trong phương thức doGet()
        }

        // Nếu không phải yêu cầu export, tiếp tục hiển thị trang manageUser.jsp
        request.getRequestDispatcher("/views/manageHistoryPurchasedTicketMatchSeat.jsp").forward(request, response);
    }

    public boolean exportToExcel(ArrayList<HistoryPurchasedTicketMatchSeat> matchSeat) {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Chọn thư mục để lưu trữ!");
        fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        int userSelection = fileChooser.showSaveDialog(null);
        if (userSelection != JFileChooser.APPROVE_OPTION) {
            return false;
        }

        File directionToSave = fileChooser.getSelectedFile();
        if (directionToSave == null) {
            return false;
        }

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("History Purchased Ticket Match Seat");
        String[] headerTitle = {"ticketId", "team1", "team2", "startTime", "seasonName", "seatName", "quantity","standName","seatClassName","email","qrCode","price","statusId","createdBy","createdDate"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headerTitle.length; i++) {
            headerRow.createCell(i).setCellValue(headerTitle[i]);
        }
        int rowNum = 1;
        for (HistoryPurchasedTicketMatchSeat HistoryPurchasedTicketMatchSeat : matchSeat) {
            Row row = sheet.createRow(rowNum);
            row.createCell(0).setCellValue(HistoryPurchasedTicketMatchSeat.getTicketId());
            row.createCell(1).setCellValue(HistoryPurchasedTicketMatchSeat.getTeam1());
            row.createCell(2).setCellValue(HistoryPurchasedTicketMatchSeat.getTeam2());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = HistoryPurchasedTicketMatchSeat.getStartTime().format(formatter);
            row.createCell(3).setCellValue(formattedDateTime);
            row.createCell(4).setCellValue(HistoryPurchasedTicketMatchSeat.getSeasonName());
            row.createCell(5).setCellValue(HistoryPurchasedTicketMatchSeat.getSeatName());
            row.createCell(6).setCellValue(HistoryPurchasedTicketMatchSeat.getQuantity());
            row.createCell(7).setCellValue(HistoryPurchasedTicketMatchSeat.getStandName());
            row.createCell(8).setCellValue(HistoryPurchasedTicketMatchSeat.getSeatClassName());
            row.createCell(9).setCellValue(HistoryPurchasedTicketMatchSeat.getEmail());
            row.createCell(10).setCellValue(HistoryPurchasedTicketMatchSeat.getQrCode());
            row.createCell(11).setCellValue(HistoryPurchasedTicketMatchSeat.getPrice().doubleValue());
            row.createCell(12).setCellValue(HistoryPurchasedTicketMatchSeat.getStatusId().getStatusId());
            row.createCell(13).setCellValue(HistoryPurchasedTicketMatchSeat.getCreatedBy());
            row.createCell(14).setCellValue(HistoryPurchasedTicketMatchSeat.getCreatedDate());
            rowNum++;
        }
        String fileName = "HistoryPurchasedTicketMatchSeat.xlsx";
        File excelFile = new File(directionToSave, fileName);
        try (FileOutputStream fileOut = new FileOutputStream(excelFile)) {
            workbook.write(fileOut);
            workbook.close();
            System.out.println("Xuất Excel thành công!");
            return true;
        } catch (IOException e) {
            System.out.println(e);
            return false;
        }
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
        processRequest(request, response);
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
