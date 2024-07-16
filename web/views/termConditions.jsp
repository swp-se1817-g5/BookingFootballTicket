<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            .inner {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh; /* Điều chỉnh chiều cao tối đa cho phù hợp với nội dung */
            }
            .text {
                text-align: justify; /* Căn lề đều cho các đoạn văn bản */
                max-width: 800px; /* Giới hạn chiều rộng của nội dung */
                padding: 20px; /* Khoảng cách viền nội dung */
                border-radius: 10px; /* Bo tròn viền nội dung */
            }
            .text p {
                margin-bottom: 1rem; /* Khoảng cách giữa các đoạn văn bản */
            }
            .text h2 {
                text-align: center; /* Căn giữa tiêu đề */
                margin-bottom: 20px; /* Khoảng cách giữa tiêu đề và nội dung */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="inner">
            <div class="text">
                <h2>ĐIỀU KHOẢN VÀ ĐIỀU LỆ</h2>
                <p> 1. BookingFootballTicket không thu bất kỳ khoản phí nào khi thanh toán bằng thẻ tín dụng hoặc thẻ ghi nợ. </p>
                <p> 2. Ngân hàng hoặc công ty thẻ tín dụng/thẻ ghi nợ của bạn có thể tính thêm phí giao dịch và chúng tôi không chịu trách nhiệm về bất kỳ khoản phí bổ sung nào từ ngân hàng hoặc công ty thẻ tín dụng/thẻ ghi nợ mà bạn nợ. </p> 
                <p> 3. Sau khi thanh toán thành công, thông tin vé đã mua của bạn nằm trong mục "Vé đã mua", vui lòng chụp lại mã QR để tránh xãy ra lỗi.</p> 
                <p> 4. Ngay sau khi nhận được thanh toán của khách hàng qua chuyển khoản, chúng tôi sẽ liên hệ với bạn để xác nhận thông tin và hỗ trợ giao vé theo thỏa thuận trên hợp đồng hoặc thỏa thuận trực tiếp với khách hàng. Nếu đã quá thời gian cam kết giao hàng mà khách hàng chưa nhận được sản phẩm có thể liên hệ tới số hottline: 0819215525 để được hỗ trợ.</p> 
                <p>&nbsp;</p>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
           <jsp:include page="footer.jsp"/>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
