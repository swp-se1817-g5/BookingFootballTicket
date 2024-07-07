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
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JFileChooser;
import models.HistoryPurchasedTicketSeasonSeat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author AD
 */
@WebServlet(name = "ExportExcelSeasonSeat", urlPatterns = {"/ExportExcelSeasonSeat"})
public class ExportExcelSeasonSeat extends HttpServlet {

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
            out.println("<title>Servlet ExportExcelSeasonSeat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcelSeasonSeat at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        HistoryPurchasedTicketDAO seasonDAO = new HistoryPurchasedTicketDAO();

        if ("export".equals(service)) {
            ArrayList<HistoryPurchasedTicketSeasonSeat> seasonList = seasonDAO.getlistHistoryPurchasedTicketSeasonSeat();
            boolean isExport = exportToExcel(seasonList);
            String exportMessage = isExport ? "Xuất Excel thành công!" : "Xuất Excel thất bại!";
            request.setAttribute("mess", exportMessage);

            response.sendRedirect(request.getContextPath() + "/manageHistoryPurchasedTicketSeasonSeat");
            return;
        }

        request.getRequestDispatcher("/views/manageHistoryPurchasedTicketSeasonSeat.jsp").forward(request, response);
    }

    public boolean exportToExcel(ArrayList<HistoryPurchasedTicketSeasonSeat> seasonSeat) {
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
        Sheet sheet = workbook.createSheet("History Purchased Ticket Season Seat");
        String[] headerTitle = {"ticketId", "startDate", "endDate", "seasonName", "seatName", "quantity", "standName", "seatClassName", "email", "qrCode", "price", "statusId", "createdBy", "createdDate"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headerTitle.length; i++) {
            headerRow.createCell(i).setCellValue(headerTitle[i]);
        }
        int rowNum = 1;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        for (HistoryPurchasedTicketSeasonSeat historyPurchasedTicketSeasonSeat : seasonSeat) {
            Row row = sheet.createRow(rowNum);
            row.createCell(0).setCellValue(historyPurchasedTicketSeasonSeat.getTicketId());

            Date startDate = historyPurchasedTicketSeasonSeat.getStartDate();
            if (startDate != null) {
                LocalDateTime startDateTime = convertToLocalDateTimeViaInstant(startDate);
                String formattedStartDate = startDateTime.format(formatter);
                row.createCell(1).setCellValue(formattedStartDate);
            } else {
                row.createCell(1).setCellValue("N/A");
            }

            Date endDate = historyPurchasedTicketSeasonSeat.getEndDate();
            if (endDate != null) {
                LocalDateTime endDateTime = convertToLocalDateTimeViaInstant(endDate);
                String formattedEndDate = endDateTime.format(formatter);
                row.createCell(2).setCellValue(formattedEndDate);
            } else {
                row.createCell(2).setCellValue("N/A");
            }

            row.createCell(3).setCellValue(historyPurchasedTicketSeasonSeat.getSeasonName());
            row.createCell(4).setCellValue(historyPurchasedTicketSeasonSeat.getSeatName());
            row.createCell(5).setCellValue(historyPurchasedTicketSeasonSeat.getQuantity());
            row.createCell(6).setCellValue(historyPurchasedTicketSeasonSeat.getStandName());
            row.createCell(7).setCellValue(historyPurchasedTicketSeasonSeat.getSeatClassName());
            row.createCell(8).setCellValue(historyPurchasedTicketSeasonSeat.getEmail());
            row.createCell(9).setCellValue(historyPurchasedTicketSeasonSeat.getQrCode());
            row.createCell(10).setCellValue(historyPurchasedTicketSeasonSeat.getPrice().doubleValue());
            row.createCell(11).setCellValue(historyPurchasedTicketSeasonSeat.getStatusId().getStatusId());
            row.createCell(12).setCellValue(historyPurchasedTicketSeasonSeat.getCreatedBy());
            row.createCell(13).setCellValue(historyPurchasedTicketSeasonSeat.getCreatedDate());
            rowNum++;
        }
        String fileName = "HistoryPurchasedTicketSeasonSeat.xlsx";
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

    private LocalDateTime convertToLocalDateTimeViaInstant(Date dateToConvert) {
        if (dateToConvert instanceof java.sql.Date) {
            return ((java.sql.Date) dateToConvert).toLocalDate().atStartOfDay();
        }
        return dateToConvert.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();
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
