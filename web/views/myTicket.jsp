<%-- 
    Document   : myTicket
    Created on : Jul 6, 2024, 10:42:59 PM
    Author     : admin
--%>

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
                transition: background-color 0.5s;
            }

    
           

            .ticket-card:hover {
                background-color: #eeeeee; /* Màu nền khi hover */
            }
        </style>

    </head>
    <body>
        <div style="margin-bottom: 160px">
            <%@include file="header.jsp" %>
        </div>

        <div  class="container my-5">
            <!-- Form Section -->
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
                <select id="ticketType" class="form-control w-auto">
                    <option value="match">Vé trận</option>
                    <option value="season">Vé mùa</option>
                </select>
                <div class="form-inline">
                    <label for="startDate" class="mr-2">Từ</label>
                    <input type="date" id="startDate" class="form-control mr-3 mb-2 mb-md-0">
                    <label for="endDate" class="mr-2">Đến</label>
                    <input type="date" id="endDate" class="form-control">
                    <button class="btn btn-primary ml-2" id="filterButton"">Lọc</button>
                </div>
            </div>

            <!-- Tickets Section -->
            <div id="tickets">
                <!-- Ticket Card -->
                <c:forEach items="${requestScope.tickets}" var="t" >
                    <form style="display: none" id="${t.ticketId}" action="myTicket" method="post">
                        <input name="ticketId" readonly="" value="${t.ticketId}">
                    </form>
                    <div class="card mb-3 ticket-card" onclick="viewDetail('${t.ticketId}')">
                        <div class="card-body">
                            <h5 class="card-title">${t.seasonName}</h5>
                            <div class="d-flex justify-content-center">
                                <h5 class="card-tittle">${t.team1} - ${t.team2}</h5>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text">Thời gian: ${t.getStartTimeConverted()}</p>
                                <p class="card-text">Địa điểm: SVĐ Mỹ Đình</p>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text">Khán đài: ${t.standName}</p>
                                <p class="card-text">Khu vực: ${t.seatName}</p>
                            </div>
                            <div class="d-flex justify-content-between flex-wrap">
                                <p class="card-text">Số lượng: ${t.quantity} </p>
                                <p class="card-text">Giá tiền: 240.000 VND</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination Section -->
            <nav aria-label="Page navigation example" id="pagination">
                <ul class="pagination justify-content-start" >
                    <c:forEach var="i" begin="1" end="${requestScope.endPage}" >
                        <li  class="page-item ${i == requestScope.pageIndex ? "active" : ''}"><a data-page="${i}" class="page-link" href="#tickets">${i}</a></li>
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
                                console.log(pageIndex);
                                var type = $('#ticketType').val();
                                console.log(type);
                                var startDate = $('#startDate').val();
                                console.log(startDate);
                                var endDate = $('#endDate').val();
                                console.log(endDate);
                                loadPage(pageIndex, type, startDate, endDate);
                            });

                            $("#filterButton").click(function () {
                                var type = $('#ticketType').val();
                                var startDate = $('#startDate').val();
                                console.log(startDate);
                                var endDate = $('#endDate').val();
                                loadPage(1, type, startDate, endDate);
                            });

                            // Initial load
                            loadPage(1, 'match', '', '');
                        });
        </script>
        <script>
            function viewDetail(ticketId){
                
                document.getElementById(ticketId).submit();
            }
        </script>
    </body>
</html>
