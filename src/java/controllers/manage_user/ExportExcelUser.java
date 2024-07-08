/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manage_user;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import javax.swing.JFileChooser;
import models.User;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author AD
 */
@WebServlet(name = "ExportExcelUser", urlPatterns = {"/ExportExcelUser"})
public class ExportExcelUser extends HttpServlet {

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
        UserDAO userDAO = new UserDAO();

        if ("export".equals(service)) {
            ArrayList<User> userList = userDAO.getallUser();
            boolean isExport = exportToExcel(userList);
            String exportMessage = isExport ? "Export success!" : "Export fail!";
            request.setAttribute("mess", exportMessage); // Đảm bảo "mess" được thiết lập với thông báo tương ứng

            // Sau khi export thành công, chuyển hướng đến trang manageUser.jsp
            response.sendRedirect(request.getContextPath() + "/manageUser");
            return; // Cần return để dừng việc thực hiện các lệnh tiếp theo trong phương thức doGet()
        }

        // Nếu không phải yêu cầu export, tiếp tục hiển thị trang manageUser.jsp
        request.getRequestDispatcher("/views/manageUser.jsp").forward(request, response);
    }

    public boolean exportToExcel(ArrayList<User> users) {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Select directory to save!");
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
        Sheet sheet = workbook.createSheet("Users data");
        String[] headerTitle = {"Email", "Name", "Role ID", "Phone Number", "Status", "Created Date"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headerTitle.length; i++) {
            headerRow.createCell(i).setCellValue(headerTitle[i]);
        }
        int rowNum = 1;
        for (User user : users) {
            Row row = sheet.createRow(rowNum);
            row.createCell(0).setCellValue(user.getEmail());
            row.createCell(1).setCellValue(user.getName());
            row.createCell(2).setCellValue(user.getRoleId());
            row.createCell(3).setCellValue(user.getPhoneNumber());
            row.createCell(4).setCellValue(user.isStatus() ? "Active" : "Inactive");
            row.createCell(5).setCellValue(user.getCreatedDate());
            rowNum++;
        }
        String fileName = "usersData.xlsx";
        File excelFile = new File(directionToSave, fileName);
        try (FileOutputStream fileOut = new FileOutputStream(excelFile)) {
            workbook.write(fileOut);
            workbook.close();
            System.out.println("Success export!");
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
