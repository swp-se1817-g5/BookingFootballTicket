/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Auth;

import dal.TokenForgetDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import models.TokenForgetPassword;
import models.User;

/**
 *
 * @author AD
 */
@WebServlet(name="requestPassword", urlPatterns={"/requestPassword"})
public class requestPassword extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet requestPassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requestPassword at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO daoUser = new UserDAO();
        String email = request.getParameter("email");
        //email co ton tai trong db
        User user = daoUser.getUserByEmail(email);
        if(user == null) {
            request.setAttribute("messEr", "You have not registered for this email !!");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }
        resetService service = new resetService();
        String token = service.generateToken();
        
        String linkReset = "http://localhost:8080/BookingFootballTicket/resetPassword?token="+token;
        
        TokenForgetPassword newTokenForget = new TokenForgetPassword(
                user.getEmail(), false, token, service.expireDateTime());
        
        //send link to this email
        TokenForgetDAO daoToken = new TokenForgetDAO();
        boolean isInsert = daoToken.insertTokenForget(newTokenForget);
        if(!isInsert) {
            request.setAttribute("mess", "Have error in server !");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }
        boolean isSend = service.sendEmail(email, linkReset, user.getName());
        if(!isSend) {
            request.setAttribute("mess", "Can not send request !");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            return;
        }
        request.setAttribute("mess", "Check your email !");
        request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
