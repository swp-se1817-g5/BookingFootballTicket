package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name="changePassForget", urlPatterns={"/changePassForget"})
public class changePassForget extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        String emailReset = (String) session.getAttribute("emailReset");
        String password = request.getParameter("password");
        String rePass = request.getParameter("confirmPassword");

        if (emailReset == null) {
            request.setAttribute("mess", "Email does not exist in the system. Please try again.");
            request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
            return;
        }

        if (!password.equals(rePass)) {
            request.setAttribute("mess", "Password must be the same!!");
            request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
        } else {
            try {
                // Băm mật khẩu trước khi lưu vào cơ sở dữ liệu
                String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                dao.changePass(emailReset, hashedPassword);
                request.setAttribute("successMess", "Reset password successfully!");
                response.sendRedirect(request.getContextPath() + "/views/signIn.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(changePassForget.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("mess", "An error occurred while resetting the password. Please try again later.");
                request.getRequestDispatcher("views/changePassReset.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
