<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            body {
                padding-top: 60px; /* Khoảng cách phía trên để tránh header */
            }
            .inner {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 70vh; /* Điều chỉnh chiều cao tối thiểu cho phù hợp với nội dung */
                padding-top: 20px; /* Khoảng cách phía trên để tránh header */
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
            footer {
                padding-top: 0; /* Xóa khoảng cách trên của footer */
                margin-top: 0; /* Xóa khoảng cách trên của footer */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="inner">
            <div class="text">
                <h2>ĐIỀU KHOẢN VÀ ĐIỀU LỆ</h2>
                <p>1. Các điều khoản và điều lệ này quy định việc sử dụng trang web bán vé đá bóng của chúng tôi và tạo thành một thỏa thuận pháp lý giữa bạn và chúng tôi. Bằng cách sử dụng trang web, bạn đồng ý tuân thủ các điều khoản và điều lệ này.</p>
                <p>2. Khi đăng ký tài khoản, bạn phải cung cấp thông tin chính xác, đầy đủ và cập nhật. Bạn chịu trách nhiệm bảo mật thông tin tài khoản và mật khẩu của mình, và phải thông báo cho chúng tôi ngay lập tức về bất kỳ hành vi sử dụng trái phép nào của tài khoản.</p> 
                <p>3. Khi mua vé, bạn đồng ý cung cấp thông tin thanh toán chính xác và đầy đủ. Chúng tôi có quyền từ chối hoặc hủy bất kỳ đơn hàng nào nếu thông tin cung cấp không chính xác hoặc có dấu hiệu gian lận.</p> 
                <p>4. Bạn được cấp quyền sử dụng trang web này cho mục đích cá nhân và phi thương mại. Bạn không được phép sao chép, phân phối, sửa đổi hoặc tạo ra các sản phẩm phái sinh từ bất kỳ nội dung nào trên trang web mà không có sự đồng ý bằng văn bản của chúng tôi.</p> 
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
