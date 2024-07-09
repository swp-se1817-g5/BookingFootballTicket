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
            .ticket-card {
                cursor: pointer;
                transition: background-color 0.3s, box-shadow 0.3s;
                border: 1px solid #ddd;
                border-radius: 10px;
                overflow: hidden;
                margin: 0 auto;
                max-width: 600px;
                position: relative; /* Added for watermark positioning */
            }
            .ticket-card:hover {
                background-color: #f8f9fa;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .ticket-header {
                background-color: #e58000;
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
                font-size: 1.5em;
                color: #7e0505;
                font-weight: bold;
            }
            .highlight-price {
                color: #30970a;
                font-weight: bold;
            }
            .filter-section {
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .pagination {
                margin-top: 20px;
            }
            @media (max-width: 575px) {
                .btn {
                    margin-top: .2rem;
                }
            }
            .watermark {
                position: absolute;
                top: 70%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: rgba(0, 0, 0, 0.1); /* Semi-transparent */
                font-size: 2em;
                font-weight: bold;
                pointer-events: none; /* Ensure the watermark doesn't interfere with card interactions */
                user-select: none; /* Prevent text selection */
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <%@include file="header.jsp" %>
        </div>

        <div class="container my-5">
            <div class="row">
                <!-- Filter Section -->
                <div class="col-lg-3 mb-4">
                    <div class="filter-section bg-light p-3 rounded">
                        <div class="form-group">
                            <label for="ticketType">Loại vé</label>
                            <select id="ticketType" class="form-control">
                                <option value="match">Vé trận</option>
                                <option value="season">Vé mùa</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ticketStatus">Trạng thái</label>
                            <select id="ticketStatus" class="form-control">
                                <c:forEach items="${requestScope.ticketStatuses}" var="s">
                                           <option value="${s.statusId}">${s.statusName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="startDate">Từ</label>
                            <input type="date" id="startDate" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="endDate">Đến</label>
                            <input type="date" id="endDate" class="form-control">
                        </div>
                    </div>
                </div>

                <!-- Tickets Section -->
                <div class="col-lg-9" id="tickets">
                    <!-- Ticket Card -->
                    <c:forEach items="${requestScope.tickets}" var="t">
                        <form style="display: none" id="${t.ticketId}" action="myTicket" method="post">
                            <input name="ticketId" readonly value="${t.ticketId}">
                        </form>
                            <div class="card mb-3 ticket-card" <c:if test="${t.statusId.statusId == 1}">onclick="viewDetail('${t.ticketId}')"</c:if>>
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
                                    <c:if test="${t.statusId.statusId == 2 || t.statusId.statusId == 3}">
                                          <div class="watermark">${t.statusId.statusId == 2 ? "Đã sử dụng" : "Hết hiệu lực"}</div> <!-- Added watermark -->
                                    </c:if>
                                <div class="d-flex justify-content-between flex-wrap">
                                    <p class="card-text"><strong>Khán đài:</strong> ${t.standName}</p>
                                    <p class="card-text"><strong>Khu vực:</strong> ${t.seatName}</p>
                                </div>
                                <div class="d-flex justify-content-between flex-wrap">
                                    <p class="card-text"><strong>Số lượng:</strong> ${t.quantity}</p>
                                    <p class="card-text"><strong>Giá tiền:</strong><span class="highlight-price"> ${t.getPriceFormatter()} </span> <span style="color: #a89a00">VNĐ</span></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Pagination Section -->
            <nav aria-label="Page navigation example" class="d-flex justify-content-center" id="pagination">
                <ul class="pagination justify-content-start">
                    <c:forEach var="i" begin="1" end="${requestScope.endPage}">
                        <li class="page-item ${i == requestScope.pageIndex ? 'active' : ''}">
                            <a data-page="${i}" class="page-link" href="#tickets">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function loadPage(pageIndex, type, startDate, endDate, status) {
                    $.ajax({
                        url: "myTicket",
                        type: "GET",
                        data: {
                            pageIndex: pageIndex,
                            type: type,
                            startDate: startDate,
                            endDate: endDate,
                            status: status
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
                    var status = $('#ticketStatus').val();
                    var startDate = $('#startDate').val();
                    var endDate = $('#endDate').val();
                    console.log(status);
                    loadPage(pageIndex, type, startDate, endDate, status);
                });

                $("#ticketType, #ticketStatus, #startDate, #endDate").on("change", function () {
                    var type = $('#ticketType').val();
                    var startDate = $('#startDate').val();
                    var endDate = $('#endDate').val();
                    var status = $('#ticketStatus').val();
                    loadPage(1, type, startDate, endDate, status);
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
