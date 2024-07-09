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
        <div style="margin-bottom: 160px">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="container mt-5">
            <h2 class="mt-5">List Tickets</h2>
            <div class="table-responsive">
                <table class="table table-striped mt-3">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">#</th>
                            <th scope="col">Team 1</th>
                            <th scope="col">Team 2</th>
                            <th scope="col">Thời gian bắt đầu</th>
                            <th scope="col">Mùa Giải</th>
                            <th scope="col">Khán Đài</th>
                            <th scope="col">Hạng Chỗ Ngồi</th>
                            <th scope="col">Khu Vực Ngồi</th>
                            <th scope="col">Số Lượng</th>
                            <th scope="col">Tổng Giá Tiền</th>
                            <th scope="col">Tình Trạng</th>
                        </tr>
                    </thead>
                    <c:forEach items="${getListHistoryPurchasedTicketMatchSeat}" var="t" varStatus="status">
                        <tbody class="text-center">
                            <tr>
                                <td>${status.count}</td>
                                <td>${t.team1}</td>
                                <td>${t.team2}</td>
                                <td><input type="datetime-local" value="${t.startTime}" readonly="" style="border: none; background: #F2F2F2"></td>
                                <td>${t.seasonName}</td>
                                <td>${t.standName}</td>
                                <td>${t.seatClassName}</td>
                                <td>${t.seatName}</td>
                                <td>${t.quantity}</td>
                                <td>${t.price} VNĐ</td>
                                <c:choose>
                                    <c:when test="${t.statusId.statusId == 1}">                            
                                        <td>${t.statusId.statusName}</td>
                                    </c:when>
                                    <c:when test="${t.statusId.statusId == 2}">                            
                                        <td style="color: green; font-weight: 700">${t.statusId.statusName}</td>
                                    </c:when>
                                    <c:when test="${t.statusId.statusId == 3}">                            
                                        <td style="color: red; font-weight: 700">${t.statusId.statusName}</td>
                                    </c:when>
                                </c:choose>

                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="mt-5">
            <jsp:include page="footer.jsp"/>
        </div>
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
                    }
                }
            });
        </script>
    </body>
</html>
