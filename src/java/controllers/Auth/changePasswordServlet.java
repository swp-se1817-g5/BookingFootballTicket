/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author AD
 */
@WebServlet(name = "changePassServlet", urlPatterns = {"/changepass"})
public class changePasswordServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet changePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePassServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("views/changePassword.jsp").forward(request, response);
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
    String oldpass = request.getParameter("oldpassword");
    String password = request.getParameter("password");
    UserDAO dao = new UserDAO();
    HttpSession session = request.getSession();

    if (session != null) {
        User user = (User) session.getAttribute("currentUser");

        if (user != null) {
            String email = user.getEmail();

            try {
                // Băm mật khẩu cũ nhập từ người dùng
                String hashedOldPassword = BCrypt.hashpw(oldpass, BCrypt.gensalt()); 

                // Lấy mật khẩu đã băm từ cơ sở dữ liệu
                String hashedPasswordFromDB = dao.getHashedPasswordByEmail(email);

                // So sánh mật khẩu đã băm từ cơ sở dữ liệu với mật khẩu băm từ mật khẩu cũ nhập vào từ người dùng
                if (!BCrypt.checkpw(oldpass, hashedPasswordFromDB)) { 
                    request.setAttribute("messEr", "Sai mật khẩu cũ!");
                } else {
                    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                    dao.changePass(email, hashedPassword);
                    session.setAttribute("changePassword", true);
                    response.sendRedirect("homePage");
                    return; 
                }
            } catch (SQLException ex) {
                Logger.getLogger(changePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("mess", password);
            }
            request.getRequestDispatcher("views/changePassword.jsp").forward(request, response);
            return; 
        }
    }

        // Xử lý trường hợp session hoặc user là null
        // Ví dụ: chuyển hướng đến trang đăng nhập
        response.sendRedirect("login");
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
