<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Ticket</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .ticket-card {
                cursor: pointer;
                transition: background-color 0.3s, box-shadow 0.3s;
                border: 1px solid #ddd;
                border-radius: 10px;
                overflow: hidden;
                max-width: 600px; /* Giảm chiều rộng của thẻ vé */
                margin: 0 auto; /* Căn giữa thẻ vé */
            }
            .ticket-card:hover {
                background-color: #f8f9fa;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .ticket-header {
                background-color: #343a40;
                color: #fff;
                padding: 10px;
                text-align: center;
            }
            .ticket-body {
                padding: 15px;
            }
            .form-inline label {
                font-weight: bold;
            }
            .page-link {
                color: #343a40;
            }
            .page-item.active .page-link {
                background-color: #343a40;
                border-color: #343a40;
                color: #fff;
            }
            .team-names {
                font-size: 1.5em; /* Tăng kích thước chữ của tên đội bóng */
                color: #d9534f; /* Đổi màu chữ để nổi bật hơn */
                font-weight: bold; /* Làm đậm chữ */
            }
            .highlight-price {
                color: #d9534f; /* Màu đỏ nổi bật */
                font-weight: bold; /* Làm đậm chữ */
            }
            .filter-section {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .pagination {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <%@include file="header.jsp" %>
        </div>

        <div class="container my-5" style="background-color: #f8f9fa">
            <!-- Form Section -->
            <div class="filter-section d-flex justify-content-center align-items-center mb-4 flex-wrap">
                <select id="ticketType" class="form-control w-auto">
                    <option value="match">Vé trận</option>
                    <option value="season">Vé mùa</option>
                </select>
                <div class="form-inline">
                    <label for="startDate" class="mr-2">Từ</label>
                    <input type="date" id="startDate" class="form-control mr-3 mb-2 mb-md-0">
                    <label for="endDate" class="mr-2">Đến</label>
                    <input type="date" id="endDate" class="form-control">
                    <button class="btn btn-primary ml-2" id="filterButton">Lọc</button>
                </div>
            </div>

            <!-- Tickets Section -->
            <div id="tickets">
                <!-- Ticket Card -->
                <c:forEach items="${requestScope.tickets}" var="t">
                    <form style="display: none" id="${t.ticketId}" action="myTicket" method="post">
                        <input name="ticketId" readonly value="${t.ticketId}">
                    </form>
                    <div class="card mb-3 ticket-card" onclick="viewDetail('${t.ticketId}')">
                        <div class="ticket-header">
                            <h5>${t.seasonName}</h5>
                        </div>
                        <div class="card-body ticket-body">
                            <div class="d-flex justify-content-center mb-2">
                                <h5 class="card-title team-names">${t.team1} - ${t.team2}</h5>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text"><strong>Thời gian:</strong> ${t.getStartTimeConverted()}</p>
                                <p class="card-text"><strong>Địa điểm:</strong> SVĐ Mỹ Đình</p>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text"><strong>Khán đài:</strong> ${t.standName}</p>
                                <p class="card-text"><strong>Khu vực:</strong> ${t.seatName}</p>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text"><strong>Số lượng:</strong> ${t.quantity}</p>
                                <p class="card-text highlight-price"><strong>Giá tiền:</strong> ${t.price} VND</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination Section -->
            <nav aria-label="Page navigation example" class="d-flex justify-content-center" id="pagination">
                <ul class="pagination justify-content-start">
                    <c:forEach var="i" begin="1" end="${requestScope.endPage}">
                        <li class="page-item ${i == requestScope.pageIndex ? 'active' : ''}"><a data-page="${i}" class="page-link" href="#tickets">${i}</a></li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function loadPage(pageIndex, type, startDate, endDate) {
                    $.ajax({
                        url: "myTicket",
                        type: "GET",
                        data: {
                            pageIndex: pageIndex,
                            type: type,
                            startDate: startDate,
                            endDate: endDate
                        },
                        success: function (data) {
                            $("#tickets").html($(data).find('#tickets').html());
                            $("#pagination").html($(data).find('#pagination').html());
                        }
                    });
                }

                $(document).on("click", ".page-link", function (e) {
                    e.preventDefault();
                    var pageIndex = $(this).attr("data-page");
                    var type = $('#ticketType').val();
                    var startDate = $('#startDate').val();
                    var endDate = $('#endDate').val();
                    loadPage(pageIndex, type, startDate, endDate);
                });

                $("#filterButton").click(function () {
                    var type = $('#ticketType').val();
                    var startDate = $('#startDate').val();
                    var endDate = $('#endDate').val();
                    loadPage(1, type, startDate, endDate);
                });

                // Initial load
                loadPage(1, 'match', '', '');
            });

            function viewDetail(ticketId) {
                document.getElementById(ticketId).submit();
            }
        </script>
    </body>
</html>
