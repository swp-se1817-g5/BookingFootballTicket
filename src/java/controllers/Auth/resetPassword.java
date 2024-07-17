/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Auth;

import SendMail.resetService;
import dal.TokenForgetDAO;
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
import models.TokenForgetPassword;
import models.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author AD
 */
@WebServlet(name = "resetPassword", urlPatterns = {"/resetPassword"})
public class resetPassword extends HttpServlet {

    TokenForgetDAO DAOToken = new TokenForgetDAO();
    UserDAO DAOUser = new UserDAO();

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
            out.println("<title>Servlet resetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPassword at " + request.getContextPath() + "</h1>");
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
        String token = request.getParameter("token");
        HttpSession session = request.getSession();
        if (token != null) {
            //
            TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(token);
            resetService service = new resetService();
            if (tokenForgetPassword == null) {
                request.setAttribute("messEr", "Token không hợp lệ !");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
                return;
            }
            if (tokenForgetPassword.isIsUsed()) {
                request.setAttribute("messEr", "Token đã sử dụng !");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
                return;
            }
            if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                request.setAttribute("messEr", "Token đã quá hạn !");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
                return;
            }
            //
            User user = DAOUser.getUserByEmail(tokenForgetPassword.getUserEmail());
            request.setAttribute("email", user.getEmail());
            session.setAttribute("token", tokenForgetPassword.getToken());
            request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        String tokenStr = (String) session.getAttribute("token");
        //
        TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(tokenStr);
        //check token is valid, of time, of used
        resetService service = new resetService();
        if (tokenForgetPassword == null) {
            request.setAttribute("messEr", "Token không hợp lệ !");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }
        if (tokenForgetPassword.isIsUsed()) {
            request.setAttribute("messEr", "Token đã sử dụng !");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }
        if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
            request.setAttribute("messEr", "Token đã quá hạn !");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }

        tokenForgetPassword.setIsUsed(true);
        //
        DAOToken.updateStatus(tokenForgetPassword);

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        try {
            //
            DAOUser.changePass(email, hashedPassword);
        } catch (SQLException ex) {
            Logger.getLogger(resetPassword.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("messEr", "Lỗi khi đổi mật khẩu!");
            request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
            return;
        }

        // Set the current user in session and redirect to home
        session.setAttribute("currentUser", DAOUser.getUserByEmail(email));
        // session.setAttribute("mess", "Reset password successfully!");
        session.setAttribute("resetPassword", true);
        response.sendRedirect("homePage");
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
