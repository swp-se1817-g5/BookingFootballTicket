package controllers.Auth;

import SendMail.sendGmail;
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
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        String redirectURL = request.getParameter("redirectURL");

        // If user cancels login, redirect to the register page
        if (error != null) {
            response.sendRedirect(request.getContextPath() + "/views/register.jsp");
            return;
        }

        // Get access token from Google
        sendGmail gg = new sendGmail();
        String accessToken = gg.getToken(code);
        UserGoogle ggUser = gg.getUserInfo(accessToken);

        // Check if the user exists
        User userExist = UserDAO.INSTANCE.getUserByEmail(ggUser.getEmail());

        if (Objects.isNull(userExist)) {
            // If user does not exist, forward to the register page with pre-filled values
            returnValueBefore(request, response,
                    ggUser.getGiven_name(),
                    ggUser.getEmail(),
                    null,
                    ggUser.getPicture()
            );
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        } else {
            // If user exists, save user in session
            session.setAttribute("currentUser", userExist);
        }

        // Redirect to the specified redirect URL or home page
        if (redirectURL != null && !redirectURL.isEmpty()) {
            response.sendRedirect(redirectURL);
        } else {
            session.setAttribute("isFirstLogin", true);
            response.sendRedirect(request.getContextPath() + "/homePage");
        }
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
