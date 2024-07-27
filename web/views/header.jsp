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

            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu > .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -1px;
            }

            .dropdown-submenu:hover > .dropdown-menu {
                display: block;
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
            .content-navabr{
                justify-content: space-around;
                font-size: 20px;
                font-weight: bold;
                font-family: sans-serif;
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
                    <button class="navbar-toggler" type="button" id="navbarToggler">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Nội dung của navbar -->
                    <div class="collapse navbar-collapse content-navabr" id="navbarNav">

                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="publicListTournment" id="tournamentsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mùa giải
                                </a>
                                <div class="dropdown-menu" aria-labelledby="tournamentsDropdown">
                                    <c:forEach items="${sessionScope.getAllseason}" var="s" end="4">
                                        <a class="dropdown-item" href="publicListMatch?seasonId=${s.seasonId}">${s.seasonName}</a>
                                    </c:forEach>
                                </div>
                            </li>

                            <!--                            <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle pt-3" href="#" id="matchesDropdown" role="button"
                                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Trận đấu
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="matchesDropdown">
                            <%--<c:forEach items="${sessionScope.getListMatches}" var="lm" end="4">--%>
                                <a class="dropdown-item" href="matchDetail?matchId=${lm.matchId}">${lm.team1.clubName} - ${lm.team2.clubName}</a>
                            <%--</c:forEach>--%>
                        </div>
                    </li>-->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="newsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Tin Tức
                                </a>
                                <div class="dropdown-menu" aria-labelledby="newsDropdown">
                                    <a class="dropdown-item" href="publicListNews">Tin Tức Thường Ngày</a>
                                    <div class="dropdown-submenu">
                                        <a class="dropdown-item dropdown-toggle" href="#">Thông tin đội bóng</a>
                                        <div class="dropdown-menu">
                                            <c:forEach items="${sessionScope.getFootballClubs}" var="fb" end="4">
                                                <a class="dropdown-item" href="publicFootballClub?fcId=${fb.clubId}">${fb.clubName}</a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="./Policy">Chính sách</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="./about">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pt-3" href="./InstructionsForBuyTickets">Hướng dẫn mua vé</a>
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
                                            <a class="dropdown-item" data-auth="register" href="./register">Đăng ký</a>
                                        </c:when>
                                        <c:when test="${sessionScope.currentUser != null}">
                                            <a class="dropdown-item" data-auth="profile" href="userProfile">Thông tin tài khoản</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="myTicket">Vé đã mua</a>
                                            <!--                                            <div class="dropdown-divider"></div>
                                                                                        <a class="dropdown-item" href="./changepass">Đổi mật khẩu</a>-->
                                            <div class="dropdown-divider"></div>
                                            <c:if test="${sessionScope.currentUser.roleId == 1}">
                                                <a class="dropdown-item" data-auth="profile" href="dashboard">Bảng điều khiển</a>
                                                <div class="dropdown-divider"></div>
                                            </c:if>
                                            
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
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var navbarToggler = document.getElementById('navbarToggler');
                var navbarNav = document.getElementById('navbarNav');

                navbarToggler.addEventListener('click', function () {
                    // Kiểm tra nếu navbar đã có class 'show', tức là đang mở
                    if (navbarNav.classList.contains('show')) {
                        navbarNav.classList.remove('show'); // Đóng navbar
                    } else {
                        navbarNav.classList.add('show'); // Mở navbar
                    }
                });

                // Đóng navbar khi click ra ngoài
                document.addEventListener('click', function (e) {
                    if (!navbarToggler.contains(e.target) && !navbarNav.contains(e.target)) {
                        navbarNav.classList.remove('show');
                    }
                });
            });
        </script>
    </body>
</html>
