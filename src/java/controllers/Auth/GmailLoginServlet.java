package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Objects;
import models.User;
import models.UserGoogle;

@WebServlet(name = "GmailLoginServlet", urlPatterns = {"/gmail"})
public class GmailLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        getGmail gg = new getGmail();
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        //neu user cancel login => error => redirect trang login
        if (error != null) {
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }
        String accessToken = gg.getToken(code);
        UserGoogle ggUser = gg.getUserInfo(accessToken);
        //check user have exist
        User userExist = UserDAO.INSTANCE.getUserByEmail(ggUser.getEmail());
        if (Objects.isNull(userExist)) {
            //if not exist => redirect to register page
            returnValueBefore(request, response,
                    ggUser.getGiven_name(),
                    ggUser.getGiven_name(),
                    ggUser.getEmail(),
                    null,
                    ggUser.getPicture()
            );
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        } else {
            //else save user in session => may be save email, password, or all userExist
            System.out.println(userExist);
            session.setAttribute("currentUser", userExist);
        }
        request.getRequestDispatcher("index.html").forward(request, response);
    }

    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String name,
            String userName, String mail, String phone, String avatar)
            throws ServletException, IOException {
        request.setAttribute("name", name);
        request.setAttribute("userName", userName);
        request.setAttribute("email", mail);
        request.setAttribute("phone", phone);
        request.setAttribute("registerEmail", true);
        request.setAttribute("avatar", avatar);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String code = request.getParameter("code");
//        String accessToken = google.getToken(code);
//        UserGoogleDTO user = google.getUserInfo(accessToken);
//        if (StringUtils.isEmpty(code)) {
//            response.sendRedirect("login");
//            return;
//        }
//            int passwordLength = 12;
//            String generatedPassword = generatePassword(passwordLength);
//            User userExist = userDAO.existCustomerByEmail(user.getEmail());
//            HttpSession session = request.getSession();
//            if (Objects.isNull(cusExist)) {
//                
//                    Customer cus = new Customer(
//                    user.getName(),
//                    user.getGiven _name(),
//                    user.getFamily_name(),
//                    user.getEmail(),
//                    generatedPassword,
//                    user.getPicture(),
//            );
//       System.outprintln(cus) ;
//      daoCus.addCustomerGoogle(cus);
//            if (session.getAttribute("currentAdmin") != null) {
//                session.removeAttribute("currentAdmin");
//
//                @Override
//                public String getServletInfo
//                
//                    () {
//        return "Short description";
//                }
    }
}
