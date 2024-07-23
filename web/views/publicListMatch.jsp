<%-- 
    Document   : publicListMatch
    Created on : Jul 7, 2024, 2:12:59 PM
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
        <title>Vé Trận Đấu Bóng Đá Sắp Diễn Ra</title>
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

            .sidebar {
                position: sticky;
                top: 20px;
                padding: 15px;
                background: #0056b3;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .product-card, .ticket-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                text-align: center;
                margin-bottom: 20px;
            }

            .ticket-card {
                width: 100%;
                height: 440px;
            }

            .product-card img, .ticket-card img {
                width: 100%;
                height: auto;
                border-radius: 10px;
            }

            .product-card h5, .ticket-card .match-teams {
                margin: 15px 0;
                font-size: 1.2em;
                font-weight: bold;
            }

            .product-card p, .ticket-card .tickets-sold {
                margin: 0;
                color: #777;
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
            }

            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }

            .ticket-card .date {
                border: none;
                background: none;
                text-align: center;
                font-size: 1.1em;
                color: #555;
                margin-bottom: 10px;
            }

            .ticket-card .competition {
                font-size: 1.2em;
                font-weight: bold;
                margin: 10px 0;
                color: #333;
            }
            .product-card .competition {
                font-size: 1.2em;
                font-weight: bold;
                margin: 10px 0;
                color: #333;
            }

            .ticket-card .location {
                margin-bottom: 10px;
                color: #777;
            }

            .ticket-card .time {
                border: none;
                background: none;
                text-align: center;
                font-size: 1.1em;
                color: #555;
                margin-top: 5px;
            }

            .clearfix {
                overflow: auto;
            }

            .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }
            .ticket-card {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .ticket-card .book-now-btn {
                margin-top: auto;
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
                                <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm theo tên đội bóng">
                            </div>
                            <div class="form-group">
                                <label for="season">Mùa giải</label>
                                <select id="season" class="form-control">
                                    <option value="All">Tất cả các mùa</option>
                                    <c:forEach items="${requestScope.seasons}" var="s">
                                        <option value="${s.seasonId}">${s.seasonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dateFrom">Từ ngày</label><i class="fa fa-calendar"></i>
                                <input type="date" id="dateFrom" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="dateTo">Đến ngày</label><i class="fa fa-calendar"></i>
                                <input type="date" id="dateTo" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="matchType">Thể loại trận đấu</label>
                                <select id="matchType" class="form-control">
                                    <option value="All">Tất cả các thể loại</option>
                                    <c:forEach items="${requestScope.types}" var="t">
                                        <option value="${t.typeId}">${t.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="matchStatus">Trạng thái trận đấu</label>
                                <select id="matchStatus" class="form-control">
                                    <option value="All">Tất cả các trạng thái</option>
                                    <c:forEach items="${requestScope.statusList}" var="status">
                                        <c:if test="${status.matchStatusId eq 1 or status.matchStatusId eq 2}">
                                            <option value="${status.matchStatusId}">${status.matchStatusName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <button id="resetBtn" class="btn btn-secondary" style="width: 100%; margin-top: 10px;">Reset<i class="bi bi-arrow-counterclockwise btn-icon"></i></button>
                            <div class="best-seller mt-4">
                                <h5>Trận đấu nổi bật<i class="bi bi-fire text-danger"></i></h5>
                                    <c:forEach items="${requestScope.matches}" var="o" begin="0" end="0">
                                    <div class="product-card" >
                                        <div class="competition">${o.season.seasonName}</div>
                                        <div style="text-align: center">${o.type.name}</div>
                                        <div class="team-logos">
                                            <img src="${o.team1.img}" alt="${o.team1.clubName}">
                                            <span class="vs">vs</span>
                                            <img src="${o.team2.img}" alt="${o.team2.clubName}">
                                        </div>
                                        <h5>${o.team1.clubName} vs ${o.team2.clubName}</h5>
                                        <p><i class="fa fa-clock"></i>${o.time}</p>
                                        <p><i class="fa fa-map-marker-alt"></i> Sân vận động Mỹ Đình, Hà Nội</p>
                                        <c:if test="${requestScope.allticket[o.matchId - 1].availability > 0}">
                                            <div class="tickets-sold">Còn vé! Đặt ngay</div>
                                        </c:if>
                                        <c:if test="${requestScope.allticket[o.matchId - 1].availability == 0}">
                                            <div class="tickets-sold">Hết vé! Vui lòng chọn trận khác</div>
                                        </c:if>
                                        <a href="matchDetail?matchId=${o.matchId}" class="btn btn-primary book-now-btn">Xem Vé</a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row" id="matchList" style="margin-left: 20px">
                            <c:forEach items="${requestScope.matches}" var="o">
                                <c:set var="dateTime" value="${o.time}" />
                                <c:set var="date" value="${fn:split(dateTime, 'T')[0]}" />
                                <c:set var="time" value="${fn:split(dateTime, 'T')[1]}" />
                                <div class="col-md-4 mb-4 match" style="text-align: center" >
                                    <div class=" ticket-card">
                                        <input type="date" class="date" style="margin-left: 20px" value="${date}" readonly>
                                        <div class="competition">${o.season.seasonName}</div>
                                        <div style="text-align: center">${o.type.name}</div>
                                        <div class="team-logos">
                                            <img src="${o.team1.img}" alt="${o.team1.clubName}">        
                                            <span class="vs">vs</span>
                                            <img src="${o.team2.img}" alt="${o.team2.clubName}">
                                        </div>
                                        <div class="match-teams">${o.team1.clubName} vs ${o.team2.clubName}</div>
                                        <div class="location"><i class="fa fa-map-marker-alt"></i> Sân vận động Mỹ Đình, Hà Nội</div>
                                        <div style="display: flex; justify-content: center;margin-left: 35px;">
                                            <i class="fa fa-clock" style="margin-top: 10px"></i>
                                            <input type="time" class="time" readonly value="${time}">
                                        </div>
                                        <c:if test="${requestScope.allticket[o.matchId - 1].availability > 0}">
                                            <div class="tickets-sold">Còn vé! Đặt ngay</div>
                                        </c:if>
                                        <c:if test="${requestScope.allticket[o.matchId - 1].availability == 0}">
                                            <div class="tickets-sold">Hết vé! Vui lòng chọn trận khác</div>
                                        </c:if>
                                        <div class="button-container">
                                            <a type="button" href="matchDetail?matchId=${o.matchId}" class="btn btn-primary book-now-btn">Xem Vé</a>
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
                                    <a class="page-link" href="publicListMatch?page=${currentPage - 1}" data-page="${currentPage - 1}"><</a>
                                </li>
                            </c:if>
                            <c:forEach var="page" begin="1" end="${numberOfPages}" step="1">
                                <li class="page-item ${page == currentPage ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <span class="page-link" data-page="${currentPage}">${currentPage}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="publicListMatch?page=${page}" data-page="${page}">${page}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < numberOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="publicListMatch?page=${currentPage + 1}" data-page="${currentPage + 1}" >></a>
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
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Popper.js for Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Your Custom JavaScript -->
        <script>
            document.getElementById('resetBtn').addEventListener('click', function () {
                document.getElementById('searchInput').value = '';
                document.getElementById('dateFrom').value = '';
                document.getElementById('dateTo').value = '';
                document.getElementById('season').value = 'All';
                document.getElementById('matchType').value = 'All';
                document.getElementById('matchStatus').value = 'All';
            });
        </script>
        <script>
            $(document).ready(function () {
                function loadMatches(page, seasonId, matchStatusId, dateFrom, dateTo, searchInput, typeId) {
                    $.ajax({
                        url: "publicListMatch", // URL của Servlet xử lý Ajax
                        type: "GET",
                        data: {
                            page: page,
                            seasonId: (seasonId !== 'All' && seasonId !== '') ? seasonId : null,
                            matchStatusId: (matchStatusId !== 'All' && matchStatusId !== '') ? matchStatusId : null,
                            dateFrom: (dateFrom !== '') ? dateFrom : null,
                            dateTo: (dateTo !== '') ? dateTo : null,
                            searchInput: (searchInput !== '') ? searchInput : null,
                            typeId: (typeId !== 'All' && typeId !== '') ? typeId : null
                        },
                        success: function (response) {
                            // Replace content of matchList with new data
                            $('#matchList').html($(response).find('#matchList').html());
                            $('#pagination').html($(response).find('#pagination').html());
                        },
                        error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                }

                // Hàm để lấy các giá trị lọc và load trang
                function applyFilters() {
                    var seasonId = $('#season').val();
                    var matchStatusId = $('#matchStatus').val();
                    var dateFrom = $('#dateFrom').val().trim();
                    var dateTo = $('#dateTo').val().trim();
                    var searchInput = $('#searchInput').val().trim();
                    var typeId = $('#matchType').val(); // Bắt đầu với giá trị là 'All'

                    loadMatches(1, seasonId, matchStatusId, dateFrom, dateTo, searchInput, typeId); // Load trang đầu tiên với các giá trị lọc
                }

// Bắt sự kiện khi người dùng nhập vào input
                $('#searchInput, #dateFrom, #dateTo').on('input', function (e) {
                    applyFilters();
                });

// Bắt sự kiện khi người dùng thay đổi select
                $('#season, #matchStatus, #matchType').on('change', function (e) {
                    applyFilters();
                });
                // Bắt sự kiện khi người dùng nhấp vào các liên kết phân trang
                $(document).on("click", ".page-link", function (e) {
                    e.preventDefault();
                    var page = $(this).attr("data-page");
                    var seasonId = $('#season').val();
                    var matchStatusId = $('#matchStatus').val();
                    var dateFrom = $('#dateFrom').val().trim();
                    var dateTo = $('#dateTo').val().trim();
                    var searchInput = $('#searchInput').val().trim();
                    var typeId = $('#matchType').val(); // Bắt đầu với giá trị là 'All'

                    loadMatches(page, seasonId, matchStatusId, dateFrom, dateTo, searchInput, typeId);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                // Check if there's a seasonId attribute on page load
                var initialSeasonId = '${requestScope.seasonId}';
                if (initialSeasonId !== '') {
                    // Set the season dropdown to the initial seasonId value
                    $('#season').val(initialSeasonId);
                    // Trigger the AJAX request
                    loadMatches(1, initialSeasonId, null, null, null, null, null);
                }
            });
        </script>
    </body>
</html>