<%-- 
    Document   : dashboardHeader
    Created on : Jun 1, 2024, 10:00:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <!--            <form class="d-none d-md-flex ms-4">
                            <input class="form-control border-0" type="search" placeholder="Search">
                        </form>-->
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="${sessionScope.currentUser.avatar}" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">${sessionScope.currentUser.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="userProfile" class="dropdown-item">Tài Khoản</a>
                        <a href="homePage" class="dropdown-item">Trang chủ</a>
                        <a href="logout" class="dropdown-item">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
