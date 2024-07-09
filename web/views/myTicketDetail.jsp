<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>QR Code Reader from Image</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .ticket {
                max-width: 450px;
                border: 1px solid #ccc;
                border-radius: 15px;
                padding: 0; /* Remove padding to allow full-width header */
                margin: 40px auto;
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s;
                overflow: hidden; /* Ensure full-width header is within the border-radius */
            }
            .ticket:hover {
                transform: scale(1.02);
            }
           
            .ticket-body {
                padding: 20px; /* Add padding to body */
            }
            .ticket-body .row {
                margin-bottom: 10px;
            }
            .ticket-body .col-6 {
                color: #555;
            }
            .ticket-footer {
                text-align: center;
            }
            .ticket-footer img {
                width: 250px;
                height: auto;
            }
            .ticket-footer p {
                color: #777;
            }
            .badge-danger {
                width: 100%;
                background-color: #e58000;
                color: #fff;
                padding: 10px;
                box-sizing: border-box;
                text-align: center;
            }
            .team-names {
                font-size: 1.5em;
                color: #7e0505; /* Change team name color */
                font-weight: bold;
            }
            .highlight-price {
                color: #30970a;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <%@include file="header.jsp"%>
        </div>

        <div class="ticket">
            <div class="badge-danger">
                <h5><span>${ticket.seasonName}</span></h5>
            </div>    
            <div class="ticket-header text-center mt-2">
                <h5 class="team-names">${ticket.team1} - ${ticket.team2}</h5>
            </div>
            <div class="ticket-body">
                <div class="row">
                    <div class="col-6"><strong>Thời gian:</strong> ${ticket.getStartTimeConverted()}</div>
                    <div class="col-6"><strong>Địa điểm:</strong> SVĐ Mỹ Đình</div>
                </div>
                <div class="row">
                    <div class="col-6"><strong>Khán đài:</strong> ${ticket.standName}</div>
                    <div class="col-6"><strong>Khu vực:</strong> ${ticket.seatName}</div>
                </div>
                <div class="row">
                    <div class="col-6"><strong>Hạng vé:</strong> ${ticket.seatClassName}</div>
                    <div class="col-6"><strong>Số lượng:</strong> ${ticket.quantity}</div>
                </div>
                <div class="row mt-3">
                    <div class="col-6"><strong>Giá tiền:</strong><span class="highlight-price"> ${ticket.getPriceFormatter()}</span> <span style="color: #a89a00">VNĐ</span></div>
                </div>
            </div>
            <div class="ticket-footer">
                <div class="qr-code">
                    <img class="img-responsive" src="${requestScope.qrCode}" alt="QR Code">
                </div>
                <div><strong>Mã vé:</strong> ${ticket.qrCode}</div>
                <p>Vui lòng đưa mã vé QR cho nhân viên soát vé để vào sân.</p>
            </div>
        </div>

    </body>
</html>
