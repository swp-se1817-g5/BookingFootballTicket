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

            .toast {
                position: fixed;
                bottom: 20px;
                right: 20px;
                min-width: 200px;
                z-index: 10000;
            }
            .toast.success .toast-header {
                background-color: #28a745;
                color: white;
            }
            .toast.error .toast-header {
                background-color: #dc3545;
                color: white;
            }


        </style>
    </head>
    <body>
        <div style="padding-bottom: 160px">
            <%@include file="header.jsp"%>
        </div>
        <<form action="inspectTicket" method="post">
            <div class="ticket">
                <div class="badge-season"><h5 class="mb-0">${getTicketInfo.seasonName}</h5></div>
                <div class="ticket-header">
                    <h5><strong>${getTicketInfo.team1} - ${getTicketInfo.team2}</strong></h5>
                </div>
                <div class="ticket-body">
                    <div class="row">
                        <div class="col-6"><strong>Thời gian:</strong> ${getTicketInfo.getStartTimeConverted()}</div>
                        <div class="col-6"><strong>Địa điểm:</strong> SVĐ Mỹ Đình</div>
                    </div>
                    <div class="row">
                        <div class="col-6"><strong>Khán đài:</strong> ${getTicketInfo.standName}</div>
                        <div class="col-6"><strong>Khu vực:</strong> ${getTicketInfo.seatName}</div>
                    </div>
                    <div class="row">
                        <div class="col-6"><strong>Hạng vé:</strong> ${getTicketInfo.seatClassName}</div>
                        <div class="col-6"><strong>Số lượng:</strong> ${getTicketInfo.quantity}</div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-6"><strong>Giá tiền:</strong> <span class="highlight-price">${getTicketInfo.getPriceFormatter()}</span> <span style="color: #a89a00" >VNĐ</span></div>
                    </div>
                    <div class="row mt-3 justify-content-end mr-2" >
                        <input type="hidden" value="${getTicketInfo.qrCode}" name="qrcode">
                        <input type="submit" value="Xác nhận" style="    height: 50px;width: 125px;">
                    </div>
                </div>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- toast notification -->
        <div class="toast" id="toastNotification" data-delay="3000">
            <div class="toast-header">
                <strong class="mr-auto" id="toastTitle"></strong>
                <button type="button" class="ml-2 mb-1 close" data-bs-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body" id="toastMessage"></div>
        </div>
        <script>
            $(document).ready(function () {
                var checkQRCode = '<%= request.getAttribute("checkQRCode")%>';
                if (checkQRCode !== 'null' && checkQRCode !== '') {
                    var toast = $('#toastNotification');
                    switch (checkQRCode) {
                        case "unchecked":
                            toast.find('#toastTitle').text('Thành Công');
                            toast.find('#toastMessage').text('Kiểm tra vé thành công!');
                            toast.addClass('success').removeClass('error');
                            toast.toast('show'); // Show the toast
                            break;
                        case "checked":
                            toast.find('#toastTitle').text('Lỗi');
                            toast.find('#toastMessage').text('Vé đã được kiểm tra!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show'); // Show the toast
                            break;
                        case "timeOut":
                            toast.find('#toastTitle').text('Lỗi');
                            toast.find('#toastMessage').text('Trận đấu đã kết thúc!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show'); // Show the toast
                            break;
                        case "notStart":
                            toast.find('#toastTitle').text('Lỗi');
                            toast.find('#toastMessage').text('Trận đấu chưa bắt đầu!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show'); // Show the toast
                            break;
                    }
                }
            });
        </script>

    </body>
</html>
