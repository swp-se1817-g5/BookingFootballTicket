package controllers.Auth;

import constant.IConstant;
import dal.UserDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
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
            request.getRequestDispatcher("/views/signIn.jsp").forward(request, response);
            return;
        }
        String accessToken = gg.getToken(code);
        UserGoogle ggUser = gg.getUserInfo(accessToken);
        int passwordLength = 12;
        //create user have passowrd random
        String generatedPassword = generatePassword(passwordLength);
        //check user have exist
        User userExist = UserDAO.INSTANCE.getUserByEmail(ggUser.getEmail());
        if (Objects.isNull(userExist)) {
            //if not exist => add user to database
            User us = new User(
                    ggUser.getName(),
                    ggUser.getGiven_name(),
                    ggUser.getEmail(),
                    ggUser.getPicture(),
                    generatedPassword, 2
            );
           boolean is =  UserDAO.INSTANCE.addUser(us);
            System.out.println("add"+is);
            session.setAttribute("currentUser", UserDAO.INSTANCE.getUserByEmail(us.getEmail()));
        } else {
            //else save user in session => may be save email, password, or all userExist
            System.out.println(userExist);
            session.setAttribute("currentUser", userExist);
        }
        request.getRequestDispatcher("index.html").forward(request, response);
    }

    public static String generatePassword(int passLength) {
        if (passLength <= 0) {
            throw new IllegalArgumentException("Độ dài mật khẩu phải lớn hơn 0");
        }
        //string buider like string use to create string contain password random
        StringBuilder password = new StringBuilder();
        SecureRandom random = new SecureRandom();
        //use random to random character
        String allCharacters = IConstant.LOWERCASE_CHARACTERS + IConstant.UPPERCASE_CHARACTERS + IConstant.NUMERIC_CHARACTERS + IConstant.SPECIAL_CHARACTERS;
        // Chắc chắn ít nhất một ký tự từ mỗi nhóm
        password.append(getRandomCharacter(IConstant.LOWERCASE_CHARACTERS, random));
        password.append(getRandomCharacter(IConstant.UPPERCASE_CHARACTERS, random));
        password.append(getRandomCharacter(IConstant.NUMERIC_CHARACTERS, random));
        password.append(getRandomCharacter(IConstant.SPECIAL_CHARACTERS, random));
        // Tạo các ký tự ngẫu nhiên cho phần còn lại của mật khẩu
        for (int i = 4; i < passLength; i++) {
            password.append(getRandomCharacter(allCharacters, random));
        }
        // Trộn ngẫu nhiên mật khẩu
        return shuffleString(password.toString(), random);
    }

    private static char getRandomCharacter(String characters, SecureRandom random) {
        int index = random.nextInt(characters.length());
        return characters.charAt(index);
    }

    private static String shuffleString(String input, SecureRandom random) {
        char[] characters = input.toCharArray();
        for (int i = characters.length - 1; i > 0; i--) {
            int index = random.nextInt(i + 1);
            char temp = characters[index];
            characters[index] = characters[i];
            characters[i] = temp;
        }
        return new String(characters);
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
