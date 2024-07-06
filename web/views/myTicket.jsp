<%-- 
    Document   : myTicket
    Created on : Jul 6, 2024, 10:42:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Ticket</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container my-5">
            <!-- Form Section -->
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap">
                <select id="ticketType" class="form-control w-auto">
                    <option value="match">Vé trận</option>
                    <option value="season">Vé mùa</option>
                </select>
                <div class="form-inline">
                    <label for="startDate" class="mr-2">Từ</label>
                    <input type="datetime-local" step="3600" id="startDate" class="form-control mr-3 mb-2 mb-md-0">
                    <label for="endDate" class="mr-2">Đến</label>
                    <input type="datetime-local" step="3600" id="endDate" class="form-control">
                    <button class="btn btn-primary ml-2" onclick="filterTickets()">Lọc</button>
                </div>
            </div>

            <!-- Tickets Section -->
            <div id="tickets">
                <!-- Ticket Card -->
                <div class="card mb-3 ticket-card" onclick="location.href = 'homePage'">
                    <div class="card-body">
                        <h5 class="card-title">Đội bóng 1 - Đội bóng 2</h5>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Thời gian: 15:20 05/07/2024</p>
                            <p class="card-text">Địa điểm: SVD Mỹ Đình</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Khán đài: A</p>
                            <p class="card-text">Khu vực: A2</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Số lượng: 2</p>
                            <p class="card-text">Giá tiền: 240.000 VND</p>
                        </div>
                    </div>
                </div>

                <!-- Repeat Ticket Card as needed -->
                <div class="card mb-3 ticket-card">
                    <div class="card-body">
                        <h5 class="card-title">Đội bóng 1 - Đội bóng 2</h5>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Thời gian: 15:20 05/07/2024</p>
                            <p class="card-text">Địa điểm: SVD Mỹ Đình</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Khán đài: A</p>
                            <p class="card-text">Khu vực: A2</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Số lượng: 2</p>
                            <p class="card-text">Giá tiền: 240.000 VND</p>
                        </div>
                    </div>
                </div>

                <!-- Another Ticket Card -->
                <div class="card mb-3 ticket-card">
                    <div class="card-body">
                        <h5 class="card-title">Đội bóng 1 - Đội bóng 2</h5>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Thời gian: 15:20 05/07/2024</p>
                            <p class="card-text">Địa điểm: SVD Mỹ Đình</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Khán đài: A</p>
                            <p class="card-text">Khu vực: A2</p>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap">
                            <p class="card-text">Số lượng: 2</p>
                            <p class="card-text">Giá tiền: 240.000 VND</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pagination Section -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">«</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                    <li class="page-item"><a class="page-link" href="#">49</a></li>
                    <li class="page-item"><a class="page-link" href="#">50</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">»</a>
                    </li>
                </ul>
            </nav>
        </div>

    </body>
</html>
