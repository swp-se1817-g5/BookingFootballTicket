<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Include necessary meta tags, title, and CSS files here -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .nav-item.dropdown:hover .dropdown-menu {
                display: block;
                margin-top: 0; /* optional: adjust margin top to align dropdown menu correctly */
            }

            .marquee-container {
                width: 50%; /* Adjust the width to constrain the animation area */
                margin: 0 auto; /* Center the container */
                overflow: hidden;
                background-color: white; /* Background color to match the theme */
                padding: 10px; /* Padding for better visibility */
            }

            .marquee {
                display: inline-block;
                white-space: nowrap;
                color: #07509F; /* Set the text color */
                font-size: 24px; /* Increase font size */
                font-weight: bold; /* Make text bold */
                animation: marquee 20s linear infinite; /* Slow down the animation */
            }

            .marquee img {
                vertical-align: middle; /* Align the icons with the text */
                margin: 0 10px; /* Space between the icons and the text */
            }

            @keyframes marquee {
                from {
                    transform: translateX(100%);
                }
                to {
                    transform: translateX(-100%);
                }
            }
        </style>
    </head>
    <body>
        <div class="fixed-top">
            <div class="container-fluid bg-white">
                <div class="marquee-container text-center">
                    <div class="marquee">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/320px-Flag_of_Vietnam.svg.png" alt="Vietnam Flag" width="30" height="20">
                        Trang WEB bán vé đá bóng số một trực tuyến của sân vận động Mỹ Đình
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/320px-Flag_of_Vietnam.svg.png" alt="Vietnam Flag" width="30" height="20">
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-sm navbar-light bg-light container-fluid border-bottom">
                <div class="container">
                    <!-- Logo -->
                    <div class="navbar-brand">
                        <a href="homePage">
                            <img style="width: 130px;" src="images/logo/FBT.png" alt="Logo"/>
                        </a>
                    </div>
                    <!-- Button để toggle menu trên các thiết bị nhỏ -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Nội dung của navbar -->
                    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="publicListTournment" id="tournamentsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mùa giải
                                </a>
                                <div class="dropdown-menu" aria-labelledby="tournamentsDropdown">
                                    <c:forEach items="${sessionScope.getAllseason}" var="s">
                                        <a class="dropdown-item" href="publicListMatch?seasonId=${s.seasonId}">${s.seasonName}</a>
                                    </c:forEach>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="" id="teamsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Đội bóng
                                </a>
                                <div class="dropdown-menu" aria-labelledby="teamsDropdown">
                                    <c:forEach items="${sessionScope.getFootballClubs}" var="fb">
                                        <a class="dropdown-item" href="publicFootballClub?fcId=${fb.clubId}">${fb.clubName}</a>
                                    </c:forEach>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="matchesDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Trận đấu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="matchesDropdown">
                                    <c:forEach items="${sessionScope.getListMatches}" var="lm">
                                        <a class="dropdown-item" href="matchDetail?matchId=${lm.matchId}">${lm.team1.clubName} - ${lm.team2.clubName}</a>
                                    </c:forEach>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="policiesDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Chính sách
                                </a>
                                <div class="dropdown-menu" aria-labelledby="policiesDropdown">
                                    <a class="dropdown-item" href="#">Chính sách bán hàng</a>
                                    <a class="dropdown-item" href="#">Chính sách bảo mật</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="publicListNews">Tin Tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="./InstructionsForBuyTickets">Hướng dẫn mua vé</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="./about">Về chúng tôi</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="loginDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Tài khoản
                                </a>
                                <div class="dropdown-menu" aria-labelledby="loginDropdown">
                                    <c:choose>
                                        <c:when test="${sessionScope.currentUser == null}">
                                            <a class="dropdown-item" data-auth="login" href="./login">Đăng nhập</a>
                                        </c:when>
                                        <c:when test="${sessionScope.currentUser != null}">
                                            <a class="dropdown-item" data-auth="profile" href="userProfile">Thông tin tài khoản</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="myTicket">Vé đã mua</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="./changepass">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="./logout">Đăng xuất</a>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </li>
                            <li class="nav-item dropdown d-none" id="user-menu">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="https://via.placeholder.com/30" class="rounded-circle" alt="User Avatar">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
