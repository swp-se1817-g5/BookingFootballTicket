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
    <jsp:include page="header.jsp" />
    <div class="inner">
        <div class="text">
            <h2>HƯỚNG DẪN MUA VÉ</h2>
            <p>
                1. Quý khách vui lòng tham khảo thông tin vé tại mục "Trận đấu sắp diễn ra".
                <br>
                <img src="images/instructions/1.png" alt="Hình ảnh hướng dẫn 1">
            </p>
            <p>
                2. Tiếp theo hãy chọn vị trí mà bạn mong muốn, mỗi tài khoản chỉ được mua tối đá 5 vé 1 lần.
                <br>
                <img src="images/instructions/2.png" alt="Hình ảnh hướng dẫn 2">
            </p>
            <p>
                3. Sau đó hãy kiểm tra lại thông tin một lần nữa và chọn mục "Thanh toán".
                <br>
                <img src="images/instructions/3.png" alt="Hình ảnh hướng dẫn 3">
            </p>
            <p>
                4. Hãy điền thông tin thanh toán của bạn để thanh toán.
                <br>
                <img src="images/instructions/4.png" alt="Hình ảnh hướng dẫn 4">
            </p>
            <p>
                5. Sau khi thanh toán thành công, tại trang HomePage, quý khách vui lòng vào mục "Vé đã mua" ở Tài khoản.
                <br>
                <img src="images/instructions/5.png" alt="Hình ảnh hướng dẫn 5">
            </p>
            <p>
                6. Sau đó chụp lại mã QR.
                <br>
                <img src="images/instructions/6.png" alt="Hình ảnh hướng dẫn 6">
            </p>
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
