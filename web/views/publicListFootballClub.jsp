<%-- 
    Document   : publicListFootballClub
    Created on : Jul 10, 2024, 11:36:28 AM
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
                width: 300px;
                height: 300px;
            }
            .ticket-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                text-align: center;
                margin-bottom: 20px;
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
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                margin-bottom: 1rem;
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
                            <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm theo tên đội bóng">
                        </div>
                        <button id="filterBtn" class="btn btn-primary" style="width: 100%">Lọc<i class="bi bi-filter btn-icon"></i></button>
                        <button id="resetBtn" class="btn btn-secondary" style="width: 100%; margin-top: 10px;">Reset<i class="bi bi-arrow-counterclockwise btn-icon"></i></button>
                        <div class="best-seller mt-4">
                            <h5>Đội bóng nổi bật<i class="bi bi-fire text-danger"></i></h5>
                                <c:forEach items="${fcs}" var="fcs" end="0">
                                <div class=" card">
                                    <div class="text-center mt-1"><img src="${fcs.img}" style="width: 65%; height: auto;" alt="Team"></div>
                                    <div class="card-body">
                                        <h5 class="card-title">${fcs.clubName}</h5>
                                        <a href="publicFootballClub?fcId=${fcs.clubId}" class="btn btn-primary">Chi tiết</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row" id="footballClubList">
                        <c:forEach items="${fcs}" var="fcs" >
                            <div class="col-md-3 col-sm-6 mb-4">
                                <div class="card">
                                    <div class="text-center mt-1"><img src="${fcs.img}" style="width: 65%; height: auto;" alt="Team"></div>
                                    <div class="card-body">
                                        <h5 class="card-title">${fcs.clubName}</h5>
                                        <a href="publicFootballClub?fcId=${fcs.clubId}" class="btn btn-primary">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="clearfix col-12" id="pagination" >
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListFootballClub?page=${currentPage - 1}" data-page="${currentPage - 1}" ><</a>
                                </li>
                            </c:if>
                            <c:forEach var="page" begin="1" end="${noOfPages}" step="1">
                                <li class="page-item ${page == currentPage ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <span class="page-link" data-page="${currentPage}">${currentPage}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="publicListFootballClub?page=${page}" data-page="${page}">${page}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListFootballClub?page=${currentPage + 1}" data-page="${currentPage + 1}" >></a>
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
            });
        </script>
        <script>
            $(document).ready(function () {
                function loadPage(page, searchValue) {
                    $.ajax({
                        url: "publicListFootballClub", // URL của Servlet xử lý Ajax
                        type: "GET",
                        data: {
                            page: page,
                            search: searchValue
                        },
                        success: function (data) {
                            $("#footballClubList").html($(data).find('#footballClubList').html());
                            $("#pagination").html($(data).find('#pagination').html());
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
                    loadPage(1, searchValue); // Load trang đầu tiên với giá trị tìm kiếm
                });

                // Bắt sự kiện khi người dùng nhấp vào các liên kết phân trang
                $(document).on("click", ".page-link", function (e) {
                    e.preventDefault();
                    var page = $(this).attr("data-page");
                    var searchValue = $('#searchInput').val().trim();
                    loadPage(page, searchValue);    
                });
            });
        </script>
    </body>
</html>

