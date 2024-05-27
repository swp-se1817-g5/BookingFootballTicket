package controllers.Auth;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "GmailLoginServlet", urlPatterns = {"/gmail"})
public class GmailLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("views/homePage.jsp");
        } else {
            request.getRequestDispatcher("views/register.jsp").forward(request, response);
        }
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
