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
        <title>Các Giải Đấu Bóng Đá</title>
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
            .bodylist{
                background-image: url("https://hanoispiritofplace.com/wp-content/uploads/2017/06/hinh-nen-bong-da-dep-2.jpg");
                background-size: cover; /* Điều chỉnh kích thước hình nền để bao phủ toàn bộ phần tử */
                background-repeat: no-repeat; /* Không lặp lại hình nền */
                background-position: center;
            }
            .product-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .ticket-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                text-align: center;
                margin-bottom: 20px;
                width: 315px;
                height: 350px;
            }
            .card h5 {
                margin: 15px 0;
                font-size: 1.2em;
                font-weight: bold;
            }
            .card p {
                margin: 0;
                color: #777;
                font-size: 0.9em;
            }
            .sidebar {
                position: sticky;
                top: 20px;
                padding: 15px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            .form-group label {
                font-weight: bold;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                padding: 0.5rem 1rem;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            }
            .pagination {
                justify-content: center;
                margin-top: 20px;
            }
            .pagination .page-item .page-link {
                border-radius: 50%;
                color: #007bff;
                border: none;
                font-size: 1.2rem;
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                color: white;
                border: none;
            }
            .pagination .page-item .page-link:hover {
                background-color: #0056b3;
                color: white;
            }
            .row{
                text-align: center;
            }
            .card-body{
                text-align: center;
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
                                <label for="dateFrom">Từ ngày</label><i class="fa fa-calendar"></i>
                                <div class="date-input">
                                    <input type="date" id="dateFrom" class="form-control">
                                </div>
                                <label for="dateTo">Đến ngày</label><i class="fa fa-calendar"></i>
                                <div class="date-input">
                                    <input type="date" id="dateTo" class="form-control">
                                </div>
                            </div>
                            <button id="filterBtn" class="btn btn-primary" style="width: 100%">Lọc<i class="bi bi-filter btn-icon"></i></button>
                            <button id="resetBtn" class="btn btn-secondary" style="width: 100%; margin-top: 10px;">Reset<i class="bi bi-arrow-counterclockwise btn-icon"></i></button>
                            <div class="best-seller mt-4">
                                <h5>Giải đấu nổi bật <i class="bi bi-fire text-danger"></i></h5>
                                    <c:forEach items="${requestScope.seasons}" var="s" begin="0" end="0">
                                    <div class="card product-card">
                                        <div class="card-body">
                                            <h5 class="card-title">${s.seasonName}</h5>
                                            <p class="card-text">Thời gian bắt đầu : ${s.startDate}</p>
                                            <p class="card-text">Thời gian kết thúc : ${s.endDate}</p>
                                            <a href="publicListMatch?seasonId=${s.seasonId}" style="margin-top: 20px" class="btn btn-primary">Xem Các Trận Đấu</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row" id="tournmentList">
                            <c:forEach items="${seasons}" var="s">
                                <div class="col-md-4">
                                    <div class="ticket-card card">
                                        <div class="card-body">
                                            <h5 class="card-title">${s.seasonName}</h5>
                                            <p class="card-text">Thời gian bắt đầu: ${s.startDate}</p>
                                            <p class="card-text">Thời gian kết thúc: ${s.endDate}</p>
                                            <a href="publicListMatch?seasonId=${s.seasonId}" style="margin-top: 20px" class="btn btn-primary">Xem Các Trận Đấu</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="clearfix col-12" id="pagination" >
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListTournment?page=${currentPage - 1}" data-page="${currentPage - 1}" ><</a>
                                </li>
                            </c:if>
                            <c:forEach var="page" begin="1" end="${noOfPages}" step="1">
                                <li class="page-item ${page == currentPage ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <span class="page-link" data-page="${currentPage}">${currentPage}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="publicListTournment?page=${page}" data-page="${page}">${page}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListTournment?page=${currentPage + 1}" data-page="${currentPage + 1}" >></a>
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
        <!-- Custom JavaScript -->
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
                        url: "publicListTournment", // URL của Servlet xử lý Ajax
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

                // Bắt sự kiện khi người dùng nhấp vào nút lọc
                $('#filterBtn').click(function (e) {
                    e.preventDefault();
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
