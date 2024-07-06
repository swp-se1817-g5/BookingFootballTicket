<%-- 
    Document   : newjsp
    Created on : Jul 5, 2024, 2:46:50 PM
    Author     : thuat
--%>

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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .section-header h2 {
                margin-bottom: 0;
            }
            @media (max-width: 768px) {
                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .card {
                margin-bottom: 1rem;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                text-align: center;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            .card-body {
                text-align: center;
            }
            .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 1rem;
            }
            .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1rem;
                text-decoration: none;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }
            .stadium-map {
                background-color: #f8f9fa;
                padding: 20px;
                margin-bottom: 20px;
            }


            .ticket-row {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                padding: 10px;
            }
            .color-bar {
                width: 5px;
                height: 100%;
                margin-right: 10px;
            }
            .color-bar-standard {
                background-color: dodgerblue;
            }
            .vip-seat {
                background-color: cyan;
            }
            .color-bar-longside-upper {
                background-color: orange;
            }
            .ticket-info {
                display: flex;
                flex-direction: column;
            }
            .ticket-status {
                color: red;
            }
            .view-type {
                color: green;
            }
            .book-now {
                color: blue;
            }
            .scroll-container {
                max-height: 660px; /* Chiều cao tối đa của khung cuộn */
                overflow-y: auto; /* Kích hoạt thanh cuộn dọc */
                padding-right: 10px; /* Đệm phải để tránh đè lên thanh cuộn */
            }




            .alert-custom {
                background-color: #ffe5e5;
                border: 1px solid #ffcccc;
            }
            .border-custom {
                border-bottom: 2px solid #d1d5db;
            }
            .match-title {
                font-size: 1.5rem; /* Giảm kích thước chữ */
            }
            .team-logos {
                display: flex;
                align-items: flex-start; /* Căn top */
                height: 100%;
            }
            .team-logos img {
                height: 50px; /* Điều chỉnh chiều cao logo tùy ý */
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />



        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <div class="card mt-3">
                        <div class="card-header">
                            <h4 class="card-title">Thông tin vé</h4>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Thông tin người mua</h5>
                            <form>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="fullName">Họ và Tên*</label>
                                        <input type="text" class="form-control" id="fullName" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="telephone">Số điện thoại*</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">+84</span>
                                            </div>
                                            <input type="tel" class="form-control" id="telephone" required>
                                        </div>
                                    </div>
                                </div>
                                <h5 class="card-title mt-4">Thông tin trận đấu</h5>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="address1">Đội bóng 1</label>
                                        <input value="${match.team1.clubName}" type="text" class="form-control" id="address1" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="address2">Đội bóng 2</label>
                                        <input value="${match.team2.clubName}" type="text" class="form-control" id="address2" disabled>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="postcode">Ngày diễn ra</label>
                                        <input value="${date}" type="text" class="form-control" id="postcode" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="city">Giờ diễn ra</label>
                                        <input value="${time}" type="text" class="form-control" id="city" disabled>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="postcode">Khán đài</label>
                                        <input value="${seat.seatarea.stand.standName}" type="text" class="form-control" id="postcode" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="city">Khu vực</label>
                                        <input value="${seat.seatarea.seatName}" type="text" class="form-control" id="city" disabled>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="postcode">Đơn giá(vnđ)</label>
                                        <input value="${seat.price}" type="text" class="form-control" id="postcode" disabled>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="float-left" for="city">Số lượng</label>
                                        <input value="${numberOfTicket}" type="text" class="form-control" id="city" disabled>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="terms" required>
                                        <label class="form-check-label" for="terms">
                                            By having an account you are agreeing with our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Statement</a>
                                        </label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">THANH TOÁN</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="order-details">
                        <h5>${match.type.name} - ${match.team1.clubName} vs ${match.team2.clubName}</h5>
                        <p>${match.type.name}</p>
                        <p>Sân vận động Mỹ Đình</p>
                        <p>${date} - ${time}</p>
                        <hr>
                        <p><strong class="badge ${seat.seatarea.seatClass.seatClassName}">${seat.seatarea.seatClass.seatClassName}</strong></p>
                        <p><c:if test="${numberOfTicket > 1}">Ghi chú: Ngồi cùng nhau</c:if>
                            <c:if test="${numberOfTicket == 1}">Ghi chú: Một mình</c:if></p>
                            <hr>
                            <h5>Chi tiết đơn hàng</h5>
                            <p>Giá: ${seat.price} mỗi vé</p>
                        <p>Số lượng: ${numberOfTicket} vé</p>
                        <hr>
                        <p>Tổng tiền: ${seat.price * numberOfTicket} vnđ</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>
        <style>
            .standard {
                color:#fff;
                background-color:#007bff
            }
            .under-roof {
                color:#fff;
                background-color:#ffc118
            }
            .on-roof {
                color:#fff;
                background-color:#17a2b8
            }
            .vip-stand {
                color:#fff;
                background-color:#28a745
            }
            .fans-side {
                color:#fff;
                background-color:#dc3545
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
