<%-- 
    Document   : nav-bar
    Created on : Jun 23, 2024, 2:26:01 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="dashboard" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">Quản Lý</h3>
                </a>
               
                <div class="navbar-nav w-100">
                    <a href="dashboard" class="nav-item nav-link ${requestScope.url == "dashboard" ? "active" : " "}"><i class="fa fa-tachometer-alt me-2"></i>Thống Kê</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Quản Lý</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="manageUser" class="dropdown-item ${requestScope.url == "manageUser" ? "active" : " "}">Quản Lý Tài Khoản</a>
                            <a href="manageMatch" class="dropdown-item ${requestScope.url == "manageMatch" ? "active" : " "}">Quản Lý Trận Đấu</a>
                            <a href="manageFootballClub" class="dropdown-item ${requestScope.url == "manageFootballClub" ? "active" : " "}">Quản Lý Đội Bóng</a>
                            <a href="manageSeason" class="dropdown-item ${requestScope.url == "manageSeason" ? "active" : " "}">Quản Lý Mùa Giải</a>
                            <a href="manageStand" class="dropdown-item ${requestScope.url == "manageStand" ? "active" : " "}">Quản Lý Khán Đài</a>
                            <a href="manageNews" class="dropdown-item ${requestScope.url == "manageNews" ? "active" : " "}">Quản Lý Bài Đăng</a>
                            <a href="manageHistoryPurchasedTicketMatchSeat" class="dropdown-item ${requestScope.url == "manageHistoryPurchasedTicketMatchSeat" ? "active" : " "}">Quản Lý Lịch Sử Bán Vé</a>
                        </div>
                    </div>
<!--                    <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                    <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                    <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>-->
<!--                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>
                        </div>
                    </div>-->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
    </body>
</html>
