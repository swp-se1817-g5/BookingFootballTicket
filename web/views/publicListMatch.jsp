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
        <style>
            body {
                background-color: #f4f4f4;
            }
            .container {
                margin-top: 20px;
            }
            .product-card, .ticket-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                text-align: center;
                margin-bottom: 20px;
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
            .product-card p, .ticket-card .competition, .ticket-card .location, .ticket-card .time, .ticket-card .tickets-sold {
                margin: 0;
                color: #777;
                font-size: 0.9em;
            }
            .ticket-card .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }
            .ticket-card .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .product-card .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .sidebar {
                position: sticky;
                top: 20px;
            }
            .pagination {
                justify-content: center;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1rem;
                text-decoration: none;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
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
                            <label for="dateFrom">Từ ngày</label>
                            <input type="date" id="dateFrom" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="dateTo">Đến ngày</label>
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
                        <button id="filterBtn" class="btn btn-primary" style="margin: auto;display : flex">Lọc</button>
                        <div class="best-seller mt-4">
                            <h5>Trận đấu hot</h5>
                            <c:forEach items="${requestScope.matches}" var="o" begin="0" end="0">
                                <div class="product-card" >
                                    <div class="team-logos">
                                        <img src="${o.team1.img}" alt="${o.team1.clubName}">
                                        <span class="vs">vs</span>
                                        <img src="${o.team2.img}" alt="${o.team2.clubName}">
                                    </div>
                                    <h5>${o.team1.clubName} vs ${o.team2.clubName}</h5>
                                    <p>${o.season.seasonName}</p>
                                    <p><i class="fa fa-clock"></i>${o.time}</p>
                                    <p><i class="fa fa-map-marker-alt"></i> Sân vận động Mỹ Đình, Hà Nội</p>
                                    <p>Vé Đã Bán: 79</p>
                                    <a href="matchDetail?matchId=${o.matchId}" class="book-now-btn btn btn-custom btn-block">Xem Vé</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row" id="matchList">
                        <c:forEach items="${requestScope.matches}" var="o">
                            <c:set var="dateTime" value="${o.time}" />
                            <c:set var="date" value="${fn:split(dateTime, 'T')[0]}" />
                            <c:set var="time" value="${fn:split(dateTime, 'T')[1]}" />
                            <div class="col-md-4 mb-4 match" >
                                <div class="ticket-card">
                                    <input type="date" class="date" value="${date}" style="border: none; background: none;text-align: center" readonly>
                                    <div class="competition">${o.season.seasonName}</div>
                                    <div class="team-logos">
                                        <img src="${o.team1.img}" alt="${o.team1.clubName}">
                                        <span class="vs">vs</span>
                                        <img src="${o.team2.img}" alt="${o.team2.clubName}">
                                    </div>
                                    <div class="match-teams">${o.team1.clubName} vs ${o.team2.clubName}</div>
                                    <div class="location"><i class="fa fa-map-marker-alt"></i> Sân vận động Mỹ Đình, Hà Nội</div>
                                    <i class="fa fa-clock"></i><input type="time" class="time" readonly value="${time}" style="border: none; background: none;text-align: center">
                                    <div class="tickets-sold">Vé Đã Bán: 79 </div>
                                    <div class="button-container">
                                        <a type="button" href="matchDetail?matchId=${o.matchId}" class="btn btn-custom btn-block book-now-btn">Xem Vé</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="clearfix col-12 ">
                    <ul class="pagination">
                        <%-- Previous Page Button --%>
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}" style="font-size: 20px"><</a>
                            </li>
                        </c:if>

                        <%-- Page Numbers --%>
                        <c:forEach var="pageNum" begin="1" end="${numberOfPages}" step="1">
                            <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                <c:choose>
                                    <c:when test="${pageNum == currentPage}">
                                        <span class="page-link">${pageNum}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link" href="?page=${pageNum}&size=${pageSize}">${pageNum}</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>

                        <%-- Next Page Button --%>
                        <c:if test="${currentPage < numberOfPages}">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}" style="font-size: 20px">></a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <!--Footer -->
        <footer class="footer"> 
            <div class="container">
                <p style="text-align: center">&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Popper.js for Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Your Custom JavaScript -->
        <script>
            $(document).ready(function () {
                // Function to handle filter button click
                $('#filterBtn').click(function (e) {
                    e.preventDefault();

                    var seasonId = $('#season').val();
                    var matchStatusId = $('#matchStatus').val();
                    var dateFrom = $('#dateFrom').val().trim();
                    var dateTo = $('#dateTo').val().trim();
                    var searchInput = $('#searchInput').val().trim();
                    var typeId = $('#matchType').val().trim(); // Bắt đầu với giá trị là 'All'

                    // Kiểm tra nếu typeId là 'All' hoặc rỗng thì set giá trị là null
                    if (typeId === 'All' || typeId === '') {
                        typeId = null;
                    }

                    // AJAX request
                    $.ajax({
                        type: 'POST',
                        url: 'publicListMatch',
                        data: {
                            seasonId: (seasonId !== 'All' && seasonId !== '') ? seasonId : null,
                            matchStatusId: (matchStatusId !== 'All' && matchStatusId !== '') ? matchStatusId : null,
                            dateFrom: (dateFrom !== '') ? dateFrom : null,
                            dateTo: (dateTo !== '') ? dateTo : null,
                            searchInput: (searchInput !== '') ? searchInput : null,
                            typeId: typeId
                        },
                        success: function (response) {
                            // Replace content of matchList with new data
                            $('#matchList').html(response);
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