<%-- 
    Document   : publicListTournment
    Created on : Jul 8, 2024, 1:54:57 AM
    Author     : Vinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Các Mùa Giải Đấu Bóng Đá</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f4;
            }
            .container {
                margin-top: 35px;
            }
            .bodylist {
                background-image: url("https://hanoispiritofplace.com/wp-content/uploads/2017/06/hinh-nen-bong-da-dep-2.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                padding-bottom: 50px;
            }
            .sidebar {
                position: sticky;
                top: 20px;
                padding: 15px;
                background: #0056b3;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                color: white;
            }
            .product-card, .ticket-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                text-align: center;
                margin-bottom: 20px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .product-card:hover, .ticket-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            }
            .ticket-card {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
            }
            .product-card img, .ticket-card img {
                width: 100%;
                height: auto;
                border-radius: 10px;
                transition: transform 0.3s ease;
            }
            .product-card img:hover, .ticket-card img:hover {
                transform: scale(1.05);
            }
            .product-card h5, .ticket-card .match-teams {
                margin: 15px 0;
                font-size: 1.2em;
                font-weight: bold;
                color: #000;
                display: flex;
                justify-content: center
            }
            .product-card p, .ticket-card {
                margin: 0;
                color: #000;
                font-size: 0.9em;
            }
            .tickets-sold {
                margin: 0;
                font-size: 0.9em;
            }
            .ticket-card .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 15px;
            }
            .ticket-card .team-logos img {
                width: 60px;
                height: 60px;
                margin: 0 15px;
                border-radius: 50%;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .product-card .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .pagination {
                justify-content: center;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1.2rem;
                text-decoration: none;
                display: inline-block;
                margin-top: 10px;
                transition: background-color 0.3s ease;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }
            .ticket-card .date, .ticket-card .time {
                border: none;
                background: none;
                text-align: center;
                font-size: 1.1em;
                color: #000;
                margin-bottom: 10px;
            }
            .ticket-card .competition, .product-card .competition {
                font-size: 1.2em;
                font-weight: bold;
                margin: 10px 0;
                color: #333;
            }
            .ticket-card .location {
                margin-bottom: 10px;
                color: #000;
            }
            .clearfix {
                overflow: auto;
            }
            .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }
            .btn-icon {
                margin-left: 5px;
            }
            .btn:hover .btn-icon {
                transform: rotate(360deg);
                transition: transform 0.5s ease;
            }
            .tickets-available {
                color: #28a745;
                font-weight: bold;
            }
            .tickets-sold-out {
                color: #dc3545;
                font-weight: bold;
            }
            .row1 {
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
            }
            #tournmentList {
                margin-left: 20px;
            }
            .tournament {
                color: #000;
                text-align: center;
            }
            .vs {
                color: #000;
            }
            .date-time-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
                margin-top: 10px;
            }
            .date-time-item {
                font-size: 1em;
                color: #000;
            }
            .date-time-item i {
                margin-right: 5px;
            }
            @media screen and (max-width: 768px) {
                #tournmentList {
                    margin-left: 0;
                }
                .sidebar {
                    max-width: 500px;
                    margin-left: 11px;
                }
                .ticket-card {
                    max-width: 500px;
                }
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <jsp:include page="header.jsp" />
        </div>
        <div class="bodylist">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sidebar">
                            <div class="form-group">
                                <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm theo tên mùa giải">
                            </div>
                            <div class="form-group">
                                <label for="dateFrom">Từ ngày</label>
                                <i class="fa fa-calendar"></i>
                                <div class="date-input">
                                    <input type="date" id="dateFrom" class="form-control">
                                </div>
                                <label for="dateTo">Đến ngày</label>
                                <i class="fa fa-calendar"></i>
                                <div class="date-input">
                                    <input type="date" id="dateTo" class="form-control">
                                </div>
                            </div>
                            <button id="resetBtn" class="btn btn-secondary" style="width: 100%; margin-top: 10px;">Đặt lại<i class="bi bi-arrow-counterclockwise btn-icon"></i></button>
                            <div class="best-seller mt-4">
                                <h5>Giải đấu nổi bật <i class="bi bi-fire text-danger"></i></h5>
                                    <c:forEach items="${requestScope.seasons}" var="s">
                                        <c:forEach items="${hotTournament}" var="h" end="0">
                                            <c:if test="${s.seasonId eq h.seasonId}">
                                            <div class="card product-card">
                                                <div class="card-body">
                                                    <h5 class="card-title">${s.seasonName}</h5>
                                                    <p class="card-text">Thời gian bắt đầu: ${s.startDate}</p>
                                                    <p class="card-text">Thời gian kết thúc: ${s.endDate}</p>
                                                    <a href="publicListMatch?seasonId=${s.seasonId}" class="btn btn-primary">Xem Các Trận Đấu</a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row1" id="tournmentList">
                            <c:forEach items="${seasons}" var="s">
                                <div class="col-md-4">
                                    <div class="card ticket-card">
                                        <div class="card-body">
                                            <h5 class="card-title">${s.seasonName}</h5>
                                            <p class="card-text">Thời gian bắt đầu: ${s.startDate}</p>
                                            <p class="card-text">Thời gian kết thúc: ${s.endDate}</p>
                                            <a href="publicListMatch?seasonId=${s.seasonId}" class="btn btn-primary">Xem Các Trận Đấu</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="clearfix col-12" id="pagination">
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListTournment?page=${currentPage - 1}" data-page="${currentPage - 1}">&lt;</a>
                                </li>
                            </c:if>
                            <c:forEach var="page" begin="1" end="${noOfPages}">
                                <li class="page-item ${page == currentPage ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <span class="page-link">${currentPage}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="publicListTournment?page=${page}" data-page="${page}">${page}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListTournment?page=${currentPage + 1}" data-page="${currentPage + 1}">&gt;</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <jsp:include page="footer.jsp"/>
        </footer>
        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Include Popper.js for Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <!-- Include Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Custom JS -->
        <script>
            document.getElementById('resetBtn').addEventListener('click', function () {
                document.getElementById('searchInput').value = '';
                document.getElementById('dateFrom').value = '';
                document.getElementById('dateTo').value = '';
            });
        </script>
        <script>
            $(document).ready(function () {
                function loadPage(page, searchValue, startDate, endDate) {
                    $.ajax({
                        url: "publicListSeason", // URL của Servlet xử lý Ajax
                        type: "GET",
                        data: {
                            page: page,
                            search: searchValue,
                            startDate: startDate,
                            endDate: endDate
                        },
                        success: function (response) {
                            $('#tournmentList').html($(response).find('#tournmentList').html());
                            $("#pagination").html($(response).find('#pagination').html());
                        },
                        error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                }

// Bắt sự kiện khi người dùng nhập vào ô tìm kiếm hoặc chọn ngày
                $('#searchInput, #dateFrom, #dateTo').on('input change', function () {
                    var searchValue = $('#searchInput').val().trim();
                    var dateFrom = $('#dateFrom').val();
                    var dateTo = $('#dateTo').val();
                    loadPage(1, searchValue, dateFrom, dateTo); // Load trang đầu tiên với các tham số tìm kiếm
                });

                // Bắt sự kiện khi người dùng nhấp vào các liên kết phân trang
                $(document).on("click", ".page-link", function (e) {
                    e.preventDefault();
                    var page = $(this).attr("data-page");
                    var searchValue = $('#searchInput').val().trim();
                    var dateFrom = $('#dateFrom').val();
                    var dateTo = $('#dateTo').val();
                    loadPage(page, searchValue, dateFrom, dateTo);
                });
            });
        </script>
    </body>
</html>
