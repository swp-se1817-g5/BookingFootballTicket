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
            <h2>Về chúng tôi</h2>
            <p> Tại BookingFootballTicket, chúng tôi tự hào cung cấp một nền tảng an toàn để người dùng có thể mua vé bóng đá một cách an toàn cho các trận đấu được mong đợi nhất trên SVĐ Mỹ Đình, với dịch vụ khách hàng tuyệt vời.</p>
            <p>&nbsp;</p>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Your Website. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
</body>
</html>
