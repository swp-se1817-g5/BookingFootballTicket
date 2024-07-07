package vnpay;

import Config.Config;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.MatchSeatDAO;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;
import models.HistoryPurchasedTicketMatchSeat;
import models.User;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

@WebServlet("/ajaxServlet")
public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("currentUser");

        String email = user.getEmail();
        String seatClassName = req.getParameter("seatClassName");
        String standName = req.getParameter("standName");
        String quantity = req.getParameter("quantity");
        String seatName = req.getParameter("seatName");
        String priceStr = req.getParameter("price");
        BigDecimal price = new BigDecimal(priceStr);
        String orderStatus = "unPayment";
        String qrCode = UUID.randomUUID().toString();

        // Lưu thông tin mua vé vào cơ sở dữ liệu
        HistoryPurchasedTicketMatchSeat his = new HistoryPurchasedTicketMatchSeat(
                quantity, Integer.parseInt(quantity), standName, seatClassName, qrCode, price, orderStatus,
                LocalDateTime.now());
        MatchSeatDAO.INSTANCE.addOrderTicket(his);
        int insertId = MatchSeatDAO.INSTANCE.getNewId();
        if (insertId < 0) {
            resp.sendRedirect("login");
            return;
        }

        // Chuẩn bị thông tin thanh toán VNPay
        String orderType = "other";
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";

        long amount = price.longValue() * 100;
        String vnp_TxnRef = insertId + "";
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        vnp_Params.put("vnp_BankCode", "NCB");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        // Chuẩn bị và gửi email với mã QR đính kèm
        String ticketId = String.valueOf(insertId);
        sendEmailWithQRCode(email, qrCode, ticketId);

        // Redirect hoặc trả về kết quả thành công
        resp.sendRedirect("homePage"); // Ví dụ redirect đến trang thành công
    }

    // Phương thức để tạo và gửi email với mã QR code đính kèm
    private void sendEmailWithQRCode(String recipientEmail, String qrCodeData, String ticketId) {
        try {
            // Tạo hình ảnh QR code từ qrCodeData
            byte[] qrCodeBytes = generateQRCodeImage(qrCodeData);

            // Gửi email với mã QR code đính kèm
            String subject = "Mã QR của bạn cho vé số " + ticketId;
            String body = "Mã QR của bạn là : " + qrCodeData;

            // Gửi email
//            EmailService service = new EmailService(); // Thay bằng service gửi email thực tế của bạn
//            service.sendEmailWithAttachment(recipientEmail, subject, body, qrCodeBytes, "QR_Code.png");

            // Log ghi nhận việc gửi email thành công (nếu cần)

        } catch (Exception ex) {
            ex.printStackTrace();
            // Xử lý lỗi khi gửi email (nếu cần)
        }
    }

    // Hàm để chuyển đổi chuỗi QR code thành hình ảnh byte array
    private byte[] generateQRCodeImage(String qrCodeData) {
        ByteArrayOutputStream out = QRCode.from(qrCodeData).to(ImageType.PNG).stream();
        return out.toByteArray();
    }
}
