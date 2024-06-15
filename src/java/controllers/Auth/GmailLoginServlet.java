package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import java.util.Objects;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import models.UserGoogle;

@WebServlet(name = "GmailLoginServlet", urlPatterns = {"/gmail"})
public class GmailLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        GetGmail gg = new GetGmail();
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        
        // If user cancels login, redirect to the register page
        if (error != null) {
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }
        
        // Get access token from Google
        String accessToken = gg.getToken(code);
        UserGoogle ggUser = gg.getUserInfo(accessToken);
        
        // Check if the user exists
        User userExist = UserDAO.INSTANCE.getUserByEmail(ggUser.getEmail());
        
        if (Objects.isNull(userExist)) {
            // If user does not exist, redirect to the register page
            returnValueBefore(request, response,
                    ggUser.getGiven_name(),
                    ggUser.getEmail(),
                    null,
                    ggUser.getPicture()
            );
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        } else {
            // If user exists, save user in session and redirect to home page
            session.setAttribute("currentUser", userExist);
        }
        
        request.setAttribute("isFirstLogin", true);
        request.getRequestDispatcher("views/homePage.jsp").forward(request, response);
    }

    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String name,
            String mail, String phone, String avatar)
            throws ServletException, IOException {
        request.setAttribute("name", name);
        request.setAttribute("email", mail);
        request.setAttribute("phone", phone);
        request.setAttribute("registerEmail", true);
        request.setAttribute("avatar", avatar);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle doPost if needed
    }
}
