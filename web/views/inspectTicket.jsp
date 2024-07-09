<%-- 
    Document   : inspectorTicket
    Created on : Jul 8, 2024, 1:56:35 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>QR Code Reader from Image</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jsqr/dist/jsQR.js"></script>
    </head>
    <style>
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
    <body>
        <div style="margin-bottom: 160px">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="container mt-5">
            <h1 class="text-center">QR Code Reader from Image</h1>
            <form action="inspectTicket" method="post" enctype="multipart/form-data" class="mt-4">
                <div class="form-group">
                    <label for="fileInput">Upload QR Code Image</label>
                    <input name="qrcode" type="file" class="form-control-file" id="fileInput">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <h2 class="mt-5">Scanned Tickets</h2>
            <table class="table table-striped mt-3">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Team 1</th>
                        <th scope="col">Team 2</th>
                        <th scope="col">Thời gian bắt đầu</th>
                        <th scope="col">Mùa Giải</th>
                        <th scope="col">Khán Đài</th>
                        <th scope="col">Hạng Chỗ Ngồi</th>
                        <th scope="col">Khu Vực Ngồi</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Tổng Giá Vé</th>
                        <th scope="col">Tình Trạng</th>
                    </tr>
                </thead>
                <c:forEach items="${getListHistoryPurchasedTicketMatchSeat}" var="t" varStatus="status">
                    <tbody>
                        <tr>
                            <td>${status.count}</td>
                            <td>${t.team1}</td>
                            <td>${t.team2}</td>
                            <td>${t.startTime}</td>
                            <td>${t.seasonName}</td>
                            <td>${t.standName}</td>
                            <td>${t.seatClassName}</td>
                            <td>${t.seatName}</td>
                            <td>${t.quantity}</td>
                            <td>${t.price}</td>
                            <td>${t.statusId.statusName}</td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="mt-5">
            <jsp:include page="footer.jsp"/>
        </div>6
        <!-- toast notification -->
        <div class="toast" id="toastNotification" data-delay="3000">
            <div class="toast-header">
                <strong class="mr-auto" id="toastTitle"></strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
            </div>
            <div class="toast-body" id="toastMessage"></div>
        </div>
        <script> //update
            $(document).ready(function () {
                var updated = '<%= request.getAttribute("checkQRCode")%>';
                if (updated !== 'null' && updated !== '') {
                    var toast = $('#toastNotification');
                    if (updated === "true") {
                        console.log(updated);
                        toast.find('#toastTitle').text('Success');
                        toast.find('#toastMessage').text('check QRCode successfully.');
                        toast.addClass('success').removeClass('error');
                        toast.toast('show'); // Hiển thị toast
                    } else if (updated === "false") {
                        console.log(updated);
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to check QRCode!');
                        toast.addClass('error').removeClass('success');
                        toast.toast('show'); // Hiển thị toast
                    }
                }
            });</script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
