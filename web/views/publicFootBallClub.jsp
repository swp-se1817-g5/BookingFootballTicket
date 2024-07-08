<%-- 
    Document   : newjsp
    Created on : Jul 5, 2024, 2:46:50 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <style>
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .section-header h2 {
                margin-bottom: 0;
            }
            @media (max-width: 768px) {
                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .card {
                margin-bottom: 1rem;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                text-align: center;
            }
            .match-card {
                width: 100%;
                margin: 5px 0;
                padding: 10px;
                border-radius: 3px;
                border: 1px solid #ddd;
                background: #F4F4F4;
                text-align: left;
                font-size: 14px;
            }
            .match-date {
                font-size: 1.2em;
                font-weight: bold;
            }
            .match-teams img {
                height: 30px;
                margin-right: 10px;
            }
            .match-info {
                font-size: 0.9em;
            }
            .ticket-info {
                text-align: right;
            }
            .ticket-info a {
                font-weight: bold;
            }
            .headerr {
                margin-bottom: 160px;
            }
            .custom-card {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                margin: 20px 0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .custom-card-title {
                font-size: 1.25rem;
                font-weight: bold;
            }
            .custom-card-text {
                font-size: 1rem;
                color: #666;
            }
            .custom-card-link {
                font-size: 1rem;
                font-weight: bold;
                color: #007bff;
                text-decoration: none;
            }
            .custom-card img{
                width: 110px;
            }
        </style>
        <div class="headerr">
            <jsp:include page="header.jsp" />
        </div>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-2">
                    <div class="custom-card">
                        <img src="${club.img}" alt="${club.clubName} Logo">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="custom-card">
                        <div class="custom-card-title">${club.clubName}</div>
                        <div class="custom-card-text">
                            ${club.description}
                        </div>
                    </div>
                </div>
            </div>
            <div class="custom-card">
                <div class="custom-card-title">Mua vé của ${club.clubName}?</div>
                <div class="custom-card-text">
                    Bạn đang tìm mua vé ${club.clubName}, không cần phải tìm đâu xa, bạn có thể lựa chọn mua vé tại FootballBookingTicket. Chúng tôi cung cấp cho bạn những mức giá hợp lý cho nhiều lịch thi đấu đa dạng.
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <c:forEach items="${matches}" var="match">
                    <div class="col-md-6">
                        <div class="match-card">
                            <div class="row">
                                <div class="col-md-3 match-date">
                                    <br>${match.getDate()}
                                </div>
                                <div class="col-md-6 match-teams">
                                    <img src="${match.team1.img}" alt="${match.team1.clubName} Logo">
                                    <img src="${match.team2.img}" alt="${match.team2.clubName} Logo">
                                    <div class="match-info">${match.team1.clubName} vs ${match.team2.clubName}<br>${match.getDateTime()}<br>Trận đấu hay, Mua ngay!</div>
                                </div>
                                <div class="col-md-3 ticket-info">
                                    <div>${match.type.name}</div>
                                    <a href="matchDetail?matchId=${match.matchId}" class="">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <<h1></h1>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
