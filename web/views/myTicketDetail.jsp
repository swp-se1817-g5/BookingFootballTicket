<%-- 
    Document   : myTicketDetail
    Created on : Jul 7, 2024, 7:27:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Detail</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .ticket {
                max-width: 450px;
                border: 1px solid #ccc;
                border-radius: 15px;
                padding: 20px;
                margin: 40px auto;
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s;
            }
            .ticket:hover {
                transform: scale(1.02);
            }
            .ticket-header {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }
            .ticket-header h4 {
                margin: 0;
                font-weight: bold;
            }
            .ticket-body {
                margin-bottom: 20px;
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
                width: 200px;
                height: auto;
                margin-bottom: 10px;
            }
            .ticket-footer p {
                color: #777;
            }
            .badge-danger {
                background-color: #dc3545;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 150px">
            <%@include file="header.jsp"%>
        </div>
    
        <div class="ticket">
            <div class="d-flex justify-content-center mb-3">
                <span class="badge badge-danger"><h6 class="mb-0">${ticket.seasonName}</h6></span>
            </div>    
            <div class="ticket-header">
                <h5><strong>${ticket.team1} - ${ticket.team2}</strong></5>
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
                    <div class="col-6"><strong>Giá tiền:</strong> ${ticket.price}</div>
                </div>
            </div>
            <div class="ticket-footer">
                <div class="qr-code mb-3">
                    <img class="img-responsive" src="${requestScope.qrCode}" alt="QR Code">
                </div>
                <div><strong>Mã vé:</strong> ${ticket.qrCode}</div>
                <p>Vui lòng đưa mã vé QR cho nhân viên soát vé để vào sân.</p>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
