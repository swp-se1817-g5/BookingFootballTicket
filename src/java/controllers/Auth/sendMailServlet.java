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

/**
 *
 * @author AD
 */
@WebServlet(name = "SendMailServlet", urlPatterns = {"/sendmail"})
public class SendMailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SendMailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
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
        String emailReset = request.getParameter("emailInputReset");
        getLink gL = new getLink();
        UserDAO dao = UserDAO.getINSTANCE(); // Sử dụng singleton UserDAO

        try {
            boolean emailSent = gL.sendEmailResetPass(emailReset);

            HttpSession session = request.getSession();
            session.setAttribute("emailReset", emailReset);

            if (!dao.checkEmailExist(emailReset)) {
                request.setAttribute("messEr", "You have not registered for this email!!");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            } else if (emailSent) {
                request.setAttribute("mess", "Check your mail!");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("messEr", "Server error");
                request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("messEr", "An unexpected error occurred.");
            request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
