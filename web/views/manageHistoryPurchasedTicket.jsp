<%-- 
Document   : manageNews
Created on : May 23, 2024, 12:20:34 PM
Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bootstrap Simple Data Table</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }
            .searchh {
                display: flex;
                justify-content: center;
            }
            .createe {
                display: flex;
                justify-content: right;
            }

            .toast {
                position: fixed;
                bottom: 20px;
                right: 20px;
                min-width: 200px;
                z-index: 10000;
            }
            .toast.success .toast-header {
                background-color: #28a745;
                color: white;
            }
            .toast.error .toast-header {
                background-color: #dc3545;
                color: white;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container-fluid position-relative bg-white d-flex p-0">

            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHBOARD</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Jhon Doe</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="index.html" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Managers</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="manageUser" class="dropdown-item">Manage User</a>
                                <a href="manageMatch" class="dropdown-item">Manage Match</a>
                                <a href="manageFootballClub" class="dropdown-item">Manage Football Club</a>
                                <a href="manageSeason" class="dropdown-item">Manage Season</a>
                                <a href="manageStand" class="dropdown-item ">Manage Stand</a>
                                <a href="manageSeatArea" class="dropdown-item">Manage Seat Area</a>
                                <a href="manageRole" class="dropdown-item">Manage Role</a>
                                <a href="manageNews" class="dropdown-item">Manage News</a>
                                <a href="manageHistoryPurchasedTicket" class="dropdown-item active">Manage Ticket</a>
                            </div>
                        </div>
                        <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                        <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                        <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="signin.html" class="dropdown-item">Sign In</a>
                                <a href="signup.html" class="dropdown-item">Sign Up</a>
                                <a href="404.html" class="dropdown-item">404 Error</a>
                                <a href="blank.html" class="dropdown-item">Blank Page</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->

            <div class="content">
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4"><a href="manageHistoryPurchasedTicket"><h2>History Purchased Ticket <b>Management</b></h2></a></div>

                                    <div class="col-sm-4 searchh">
                                        <div class="search-box" id="searchForm">
                                            <a><i class="material-icons">&#xE8B6;</i></a>
                                            <input id="valueSearch" type="text" class="form-control" placeholder="Search&hellip;">
                                        </div>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $('#valueSearch').keypress(function (event) {
                                                if (event.keyCode === 13) { // 13 is the Enter key
                                                    event.preventDefault(); // Prevent the default form submission
                                                    var valueSearch = document.getElementById('valueSearch').value;
                                                    location.href = "manageHistoryPurchasedTicket?go=search&valueSearch=" + encodeURIComponent(valueSearch);
                                                }
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Team 1</th>
                                        <th>Team 2</th>
                                        <th>
                                            <select class="form-select border-0" id="statusSelect" onchange="filterTable()">
                                                <option selected value="All">All Season</option>
                                                <c:forEach items="${getListSeason}" var="season">
                                                    <option value="">${season.seasonName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            <select class="form-select border-0" id="statusSelect" onchange="filterTable()">
                                                <option selected value="All">All Seat Class</option>
                                                <c:forEach items="${getListSeatClass}" var="seatClass">
                                                    <option value="">${seatClass.seatClassName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>Stand</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${getListHistoryPurchasedTicketMatchSeat}" var="ticketMatchSeat" varStatus="status">
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>${ticketMatchSeat.team1}</td>
                                            <td>${ticketMatchSeat.team2}</td>
                                            <td>${ticketMatchSeat.seasonName}</td>
                                            <td>${ticketMatchSeat.seatClassName}</td>
                                            <td>${ticketMatchSeat.standName}</td>
                                            <td>${ticketMatchSeat.quantity}</td>
                                            <td>${ticketMatchSeat.price}</td>
                                            <td>${ticketMatchSeat.statusId.statusName}</td>
                                            <td><a href="#viewDetailsTicket${ticketMatchSeat.ticketId}" class="view" title="View" data-toggle="modal"><i class="material-icons">&#xE417;</i></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div> 
                </div>      
            </div>      
        </div>      

        <!--------------------------------------------------------------------------------------------------------------------------------------------->

        <c:forEach items="${getListHistoryPurchasedTicketMatchSeat}" var="ticketMatchSeat" varStatus="status">
            <div id="viewDetailsTicket${ticketMatchSeat.ticketId}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">			
                            <h4 class="modal-title">View Details</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Ticket Id</label>    
                                <input name="newsId" class="form-control" value="${ticketMatchSeat.ticketId}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Start Time</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketMatchSeat.startTime}</p>
                            </div>
                            <div class="form-group">
                                <label>Seat</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketMatchSeat.seatName}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketMatchSeat.email}</p>
                            </div>
                            <div class="form-group">
                                <label>QR Code</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketMatchSeat.qrCode}</p>
                            </div>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input type="datetime-local" name="createDate" class="form-control" value="${ticketMatchSeat.createdDate}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Create By</label>
                                <input name="createBy" class="form-control" value="${ticketMatchSeat.createdBy}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
