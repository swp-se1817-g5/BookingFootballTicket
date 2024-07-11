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
                position: relative;
                overflow: hidden;
            }
           
            .ticket-header {
                padding-top: 20px;
                text-align: center;
                margin: 20px 0;
                color: #7e0505;
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
            }
            .ticket-footer p {
                color: #777;
            }
            .badge-season {
                background-color: #07509F;
                font-size: 20px;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                padding: 10px 0;
                color: #fff;
                text-align: center;
            }
            .highlight-price {
                color: #30970a;
                font-weight: bold;
            }

            @media screen and (max-width: 500px) {
                
                .ticket {
                    max-width: 350px;
                }
                
            }
            /* Media query for screens with max-width of 768px */
           
        </style>
    </head>
    <body>
        <div style="padding-bottom: 100px">
            <%@include file="header.jsp"%>
        </div>

        <div class="ticket">
            <div class="badge-season"><h5 class="mb-0">${ticket.seasonName}</h5></div>
            <div class="ticket-header">
                <h5><strong>${ticket.team1} - ${ticket.team2}</strong></h5>
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
                    <div class="col-6"><strong>Giá tiền:</strong> <span class="highlight-price">${ticket.getPriceFormatter()}</span> <span style="color: #a89a00" >VNĐ</span></div>
                </div>
            </div>
            <div class="ticket-footer">
                <div class="qr-code mb-3">
                    <img class="img-responsive" src="${requestScope.qrCode}" alt="QR Code">
                </div>
                <p>Vui lòng đưa mã vé QR cho nhân viên soát vé để vào sân.</p>
            </div>
        </div>
        <%@include file="footer.jsp" %>  

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
