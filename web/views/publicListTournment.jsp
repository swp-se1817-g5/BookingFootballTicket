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
                margin-top: 20px;
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
                width: 250px;
                height: 250px;
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
                justify-content: space-around;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <jsp:include page="header.jsp" />
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="sidebar">
                        <div class="form-group">
                            <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm theo tên mùa giải">
                        </div>
                        <div class="form-group">
                            <label for="dateFrom">Từ ngày</label>
                            <input type="date" id="dateFrom" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="dateTo">Đến ngày</label>
                            <input type="date" id="dateTo" class="form-control">
                        </div>
                        <button id="filterBtn" class="btn btn-primary" style="width: 100%">Lọc</button>
                        <div class="best-seller mt-4">
                            <h5>Giải đấu hot <i class="bi bi-fire text-danger"></i></h5>
                                <c:forEach items="${requestScope.seasons}" var="s" begin="0" end="0">
                                <div class="card product-card">
                                    <div class="card-body">
                                        <h5 class="card-title">${s.seasonName}</h5>
                                        <p class="card-text">Thời gian bắt đầu : ${s.startDate}</p>
                                        <p class="card-text">Thời gian kết thúc : ${s.endDate}</p>
                                        <a href="#" class="btn btn-primary">Xem Thêm <i class="bi bi-arrow-right"></i></a>
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
                                <div class="card ticket-card">
                                    <div class="card-body">
                                        <h5 class="card-title">${s.seasonName}</h5>
                                        <p class="card-text">Thời gian bắt đầu: ${s.startDate}</p>
                                        <p class="card-text">Thời gian kết thúc: ${s.endDate}</p>
                                        <a href="#" class="btn btn-primary">Xem Thêm <i class="bi bi-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="clearfix col-12">
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}" style="font-size: 20px"><</a>
                                </li>
                            </c:if>
                            <c:forEach var="pageNum" begin="1" end="${noOfPages}" step="1">
                                <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${pageNum == currentPage}">
                                            <span class="page-link">${pageNum}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}" style="font-size: 20px">></a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Include Popper.js for Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <!-- Include Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Custom JavaScript -->
        <script>
            $(document).ready(function () {
                $('#filterBtn').click(function (e) {
                    e.preventDefault();
                    var search = $('#searchInput').val().trim();
                    var dateFrom = $('#dateFrom').val();
                    var dateTo = $('#dateTo').val();

                    $.ajax({
                        type: 'POST',
                        url: 'publicListTournment',
                        data: {
                            search: search,
                            startDate: dateFrom,
                            endDate: dateTo
                        },
                        success: function (response) {
                            $('#tournmentList').html(response);
                        },
                        error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
