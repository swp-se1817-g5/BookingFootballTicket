<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Include necessary meta tags, title, and CSS files here -->
    </head>
    <body>
        <div class="fixed-top">
            <div class="text-center bg-dark text-white p-3">Trang web bán vé đá bóng số một trực tuyến của sân vận động Mỹ Đình</div>
            <nav class="navbar navbar-expand-md navbar-light bg-light container-fluid border-bottom">
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
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="tournamentsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Giải đấu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="tournamentsDropdown">
                                    <a class="dropdown-item" href="#">Giải đấu 1</a>
                                    <a class="dropdown-item" href="#">Giải đấu 2</a>
                                    <a class="dropdown-item" href="#">Giải đấu 3</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="teamsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Đội bóng
                                </a>
                                <div class="dropdown-menu" aria-labelledby="teamsDropdown">
                                    <a class="dropdown-item" href="#">Team 1</a>
                                    <a class="dropdown-item" href="#">Team 2</a>
                                    <a class="dropdown-item" href="#">Team 3</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pt-3" href="#" id="matchesDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Trận đấu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="matchesDropdown">
                                    <a class="dropdown-item" href="#">Match 1</a>
                                    <a class="dropdown-item" href="#">Match 2</a>
                                    <a class="dropdown-item" href="#">Match 3</a>
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
                                <a class="nav-link pt-3" href="#">Tin Tức</a>
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
                                            <a class="dropdown-item" data-auth="profile" href="#">Thông tin tài khoản</a>
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
    </body>
</html>
