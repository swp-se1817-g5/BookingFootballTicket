package controllers.Auth;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import models.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import constant.Validate;
import java.time.LocalDateTime;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = UserDAO.INSTANCE;

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String avatar = request.getParameter("avatar");

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String registerEmail = request.getParameter("registerEmail");
        String termsAndConditions = request.getParameter("iAgree");
        boolean status = false;
        String errorMessage = "";
        String successMessage = "";

        if (Boolean.valueOf(registerEmail)) {
            request.setAttribute("registerEmail", true);
        }
        if (avatar != null) {
            request.setAttribute("avatar", avatar);
        }

        if (name.isEmpty() || password.isEmpty() || email.isEmpty() || phoneNumber.isEmpty()) {
            request.setAttribute("errorMessage", "Tất cả các trường là bắt buộc!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidName(name)) {
            request.setAttribute("errorMessage", "Tên không hợp lệ!");
            returnValueBefore(request, response, null, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidPhoneNumber(phoneNumber)) {
            String messPhone = "Số điện thoại không hợp lệ!";
            if (!phoneNumber.startsWith("0") && phoneNumber.length() == 10 && Validate.isNumber(phoneNumber)) {
                messPhone = "Số điện thoại bắt buộc phải bắt đầu bằng 0!";
            }
            request.setAttribute("errorMessage", messPhone);
            returnValueBefore(request, response, name, email, null);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidEmail(email)) {
            request.setAttribute("errorMessage", "Email không hợp lệ!");
            returnValueBefore(request, response, name, null, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        User userExists = userDAO.getUserByEmail(email);
        if (userExists != null) {
            request.setAttribute("errorMessage", "Email đã tồn tại!");
            returnValueBefore(request, response, name, null, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!Validate.isValidPassword(password)) {
            request.setAttribute("errorMessage", "Mật khẩu cần ít nhất 8 kí tự bao gồm: ký tự chữ thường, ít nhất 1 ký tự viết hoa và 1 ký tự số!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu nhập lại không khớp!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        if (termsAndConditions == null) {
            request.setAttribute("errorMessage", "Vui lòng đồng ý với điều khoản và điều lệ của chúng tôi!");
            returnValueBefore(request, response, name, email, phoneNumber);
            dispatch(request, response, "/views/register.jsp");
            return;
        }

        // Hash the password using bcrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        LocalDateTime now = LocalDateTime.now();


        User newUser = new User();
        newUser.setName(name);
        newUser.setHashedPassword(hashedPassword); // Save hashed password
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setRoleId(2);
        newUser.setAvatar(avatar);
        newUser.setCreatedBy(email);
        newUser.setUpdatedBy(email);
        newUser.setCreatedDate(now);

        status = userDAO.addUser(newUser);
        successMessage = "Đăng ký thành công!";
        HttpSession session = request.getSession();
        session.setAttribute("successMessage", successMessage);
        session.setAttribute("currentUser", userDAO.getUserByEmail(email));
        session.setMaxInactiveInterval(Integer.MAX_VALUE);
        session.setAttribute("isRegister", true);
        response.sendRedirect("homePage");
    }

    private void returnValueBefore(HttpServletRequest request, HttpServletResponse response, String name, String email, String phoneNumber) {
        request.setAttribute("phone", phoneNumber);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
