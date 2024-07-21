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
            margin: 0;
            padding: 0;
        }

        .inner {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px); /* Chiều cao tối thiểu trừ chiều cao header và footer */
            padding-top: 110px; /* Điều chỉnh giá trị này để phù hợp với chiều cao của header */
            padding-bottom: 0px; /* Đảm bảo nội dung không tràn vào footer */
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

        .text img {
            display: block;
            margin: 0 auto; /* Căn giữa hình ảnh */
            max-width: 100%;
        }

        /* Đảm bảo header không che khuất nội dung */
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .footer {
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="header.jsp" />
    </header>
    <div class="inner">
        <div class="text">
            <h2>CHÍNH SÁCH BÁN HÀNG</h2>
            <p> 1. Trang web bán vé đá bóng của chúng tôi cam kết cung cấp vé xem các trận đấu bóng đá một cách nhanh chóng, thuận tiện và an toàn.</p>
            <p> 2. Giá vé được niêm yết rõ ràng trên trang web và bao gồm các khoản phí liên quan.</p>
            <p> 3. Chúng tôi cam kết không thu thêm bất kỳ khoản phí nào ngoài giá vé đã niêm yết.</p>
            <p> 4. Chúng tôi chấp nhận phương thức thanh toán như cổng thanh toán điện tử VNPAY.</p>
            <p> 5. Vé đã mua sẽ không được hoàn tiền trừ khi trận đấu bị hủy bỏ hoặc thay đổi thời gian diễn ra do lỗi từ ban tổ chức.</p>
            <p> 6. Trong trường hợp hủy vé hợp lệ, khách hàng sẽ nhận được thông báo và hướng dẫn hoàn tiền qua email đã đăng ký.</p>
            <p> 7. Vé sẽ được hiển thị trong mục "Vé đã mua" dưới dạng vé điện tử (QR code) ngay sau khi thanh toán thành công.</p>
            <p> 8. Khách hàng cần kiểm tra thông tin vé và tải vé xuống thiết bị của mình để sử dụng khi vào sân.</p>
            <p> 10. Nếu có bất kỳ vấn đề nào liên quan đến việc mua vé, khách hàng có thể liên hệ với bộ phận hỗ trợ của chúng tôi qua email hoặc số điện thoại được cung cấp trên trang web.</p>
            <p> 11. Tất cả các giao dịch thanh toán đều được bảo mật đảm bảo an toàn thông tin khách hàng.</p>
            <h2>CHÍNH SÁCH BẢO MẬT</h2>
            <p> 1. Chúng tôi thu thập các thông tin cá nhân như tên, email, số điện thoại và thông tin thanh toán khi khách hàng thực hiện giao dịch trên trang web.</p>
            <p> 2. Thông tin cá nhân của khách hàng được sử dụng để xử lý đơn hàng, giao vé và cung cấp dịch vụ hỗ trợ khách hàng.</p>
            <p> 3. Tất cả các thông tin cá nhân và thông tin thanh toán đều được bảo mật an toàn.</p>
            <p> 4. Chúng tôi cam kết không chia sẻ, bán hoặc trao đổi thông tin cá nhân của khách hàng cho bất kỳ bên thứ ba nào trừ khi có sự đồng ý của khách hàng hoặc yêu cầu từ cơ quan pháp luật.</p>
            <p> 5. Khách hàng có quyền truy cập, chỉnh sửa và xóa thông tin cá nhân của mình bằng cách đăng nhập vào tài khoản trên trang web.</p>
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
