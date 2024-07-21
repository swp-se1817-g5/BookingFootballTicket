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
            <h2>GIỚI THIỆU VỀ CHÚNG TÔI</h2>
            <p> Chào mừng bạn đến với FootballBookingTicket, điểm đến tuyệt vời nhất để mua vé cho những trận đấu bóng đá sôi động trên SVĐ Mỹ Đình. Được thành lập bởi một đội ngũ đam mê bóng đá, sứ mệnh của chúng tôi là cung cấp cho người hâm mộ một nền tảng đáng tin cậy và dễ dàng để mua vé cho các trận đấu yêu thích.</p>
            <h2>CÂU CHUYỆN CỦA CHÚNG TÔI</h2>
            <p> Tại FootballBookingTicket, chúng tôi tin rằng mỗi người hâm mộ bóng đá đều xứng đáng có cơ hội trải nghiệm không khí cuồng nhiệt của một trận đấu trực tiếp. Hành trình của chúng tôi bắt đầu khi một nhóm bạn bè, chán nản với những khó khăn trong việc mua vé bóng đá trực tuyến, quyết định tạo ra một giải pháp đơn giản và dễ tiếp cận cho tất cả mọi người.</p>
            <h2>NHỮNG GÌ CHÚNG TÔI CUNG CẤP</h2>
            <p> <strong>Lựa Chọn Trận Đấu Đa Dạng:</strong> Từ các giải đấu trong nước, chúng tôi phủ sóng một loạt các sự kiện bóng đá, đảm bảo người hâm mộ không bỏ lỡ bất kỳ trận đấu nào.</p>
            <p> <strong>Đặt Vé An Toàn và Dễ Dàng:</strong> Giao diện thân thiện với người dùng và cổng thanh toán an toàn của chúng tôi giúp việc đặt vé trở nên dễ dàng và không gặp rắc rối.</p>
            <p> <strong>Cập Nhật Theo Thời Gian Thực:</strong> Luôn cập nhật thông tin về lịch thi đấu, tình trạng vé và tin tức bóng đá mới nhất.</p>
            <h2>CAM KẾT CỦA CHÚNG TÔI</h2>
            <p> Chúng tôi cam kết cung cấp dịch vụ khách hàng tốt nhất và hỗ trợ tận tình. Đội ngũ chuyên nghiệp của chúng tôi luôn sẵn sàng giúp đỡ bạn với bất kỳ thắc mắc hay vấn đề nào mà bạn gặp phải. Chúng tôi tự hào về sự minh bạch, độ tin cậy và sự tận tụy trong việc làm cho trải nghiệm mua vé bóng đá của bạn trở nên thú vị nhất.</p>
<!--            <h2>Tham Gia Cùng Chúng Tôi</h2>
            <p> Hãy tham gia cộng đồng FootballBookingTicket ngay hôm nay và trở thành một phần của mạng lưới người hâm mộ bóng đá đang ngày càng phát triển trên toàn cầu. Dù bạn là người hâm mộ nhiệt thành của đội bóng trong nước hay là fan của các câu lạc bộ quốc tế, chúng tôi luôn đảm bảo bạn không bỏ lỡ bất kỳ khoảnh khắc nào của trận đấu.</p>-->
            <h2><em>Cảm ơn bạn đã chọn FootballBookingTicket – nơi biến giấc mơ xem những trận bóng đá hay nhất, kịch tính nhất của bạn thành hiện thực.</em></h2>
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
