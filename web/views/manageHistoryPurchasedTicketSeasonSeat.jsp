<%-- 
    Document   : manageHistoryPurchasedTicketSeasonSeat
    Created on : Jun 26, 2024, 11:39:03 AM
    Author     : nguye
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
            .btn-custom {
                position: relative;
            }
            .btn-custom .btn-icon {
                transition: transform 0.3s ease;
                position: absolute;
                left: 5px;
            }
            .btn-custom.active .btn-icon {
                transform: rotate(90deg);
            }
        </style>



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
            <%@include file="side-bar.jsp"%>
            <!-- Sidebar End -->

            <div class="content">
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4 searchh">
                                        <a onclick="searchTickets()" class="d-none"><i class="material-icons">&#xE8B6;</i></a>
                                        <input id="valueSearch" type="text" class="form-control" placeholder="Search by email&hellip;">
                                    </div>
                                    <div class="col-sm-8 d-flex justify-content-end">
                                        <button id="toggleButton" class="btn btn-success m-2 align-items-center">
                                            Ticket Match Seat <i class="btn-icon fas fa-caret-right"></i>
                                        </button>
                                        <a type="button" href="/BookingFootballTicket/ExportExcelSeasonSeat?service=export" class="btn btn-success m-2 float-right">
                                            <i class="bi bi-file-earmark-spreadsheet"></i> 
                                            <span>Xuất file Excel</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead class="text-center">
                                    <tr>
                                        <th>#</th>
                                        <th>
                                            <select class="form-select border-0" id="seasonSelect">
                                                <option selected value="All">All Season</option>
                                                <c:forEach items="${getListSeason}" var="season">
                                                    <option value="${season.seasonName}">${season.seasonName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            <select class="form-select border-0" id="standSelect">
                                                <option selected value="All">All Stand</option>
                                                <c:forEach items="${getListStand}" var="stand">
                                                    <option value="${stand.standName}">${stand.standName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            <select class="form-select border-0" id="seatClassSelect">
                                                <option selected value="All">All Seat Class</option>
                                                <c:forEach items="${getListSeatClass}" var="seatClass">
                                                    <option value="${seatClass.seatClassName}">${seatClass.seatClassName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            Seat
                                            <i class="fa fa-sort" id="sortSeat" data-column="4" data-order="asc"></i>
                                        </th>
                                        <th>
                                            Quantity
                                            <i class="fa fa-sort" id="sortQuantity" data-column="5" data-order="asc"></i>
                                        </th>
                                        <th>
                                            Price
                                            <i class="fa fa-sort" id="sortPrice" data-column="6" data-order="asc"></i>
                                        </th>

                                        <th>
                                            <select class="form-select border-0" id="statusSelect">
                                                <option selected value="All">Status</option>
                                                <c:forEach items="${getListStatus}" var="status">
                                                    <option value="${status.statusName}">${status.statusName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th class="d-none">
                                            <select class="form-select border-0" id="emailSelect">
                                                <option selected value="All"></option>
                                                <c:forEach items="${getListHistoryPurchasedTicketSeasonSeat}" var="ticketSeasonSeat" >
                                                    <option value="${ticketSeasonSeat.email}">${ticketSeasonSeat.email}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${getListHistoryPurchasedTicketSeasonSeat}" var="ticketSeasonSeat" varStatus="status">
                                        <tr class="text-center">
                                            <td>${status.count}</td>
                                            <td>${ticketSeasonSeat.seasonName}</td>
                                            <td>${ticketSeasonSeat.standName}</td>
                                            <td>${ticketSeasonSeat.seatClassName}</td>
                                            <td>${ticketSeasonSeat.seatName}</td>
                                            <td>${ticketSeasonSeat.quantity}</td>
                                            <td>${ticketSeasonSeat.price}</td>
                                            <td>${ticketSeasonSeat.statusId.statusName}</td>
                                            <td class="d-none">${ticketSeasonSeat.email}></td>
                                            <td><a href="#viewDetailsTicket${ticketSeasonSeat.ticketId}" class="view" title="View" data-toggle="modal"><i class="material-icons" style="color: gray">&#xE417;</i></a></td>
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

        <c:forEach items="${getListHistoryPurchasedTicketSeasonSeat}" var="ticketSeasonSeat" varStatus="status">
            <div id="viewDetailsTicket${ticketSeasonSeat.ticketId}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">View Details</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Ticket Id</label>
                                <input name="newsId" class="form-control" value="${ticketSeasonSeat.ticketId}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Start Date</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketSeasonSeat.startDate}</p>
                            </div>
                            <div class="form-group">
                                <label>End Date</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketSeasonSeat.endDate}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${ticketSeasonSeat.email}</p>
                            </div>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input type="datetime-local" name="createDate" class="form-control" value="${ticketSeasonSeat.createdDate}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Create By</label>
                                <input name="createBy" class="form-control" value="${ticketSeasonSeat.createdBy}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <script>
            $(document).ready(function () {
                var seasonValue = 'All'; // Giá trị mặc định cho dropdown season
                var seatClassValue = 'All'; // Giá trị mặc định cho dropdown seat class
                var standValue = 'All'; // Giá trị mặc định cho dropdown stand
                var statusValue = 'All'; // Giá trị mặc định cho dropdown status
                var emailValue = 'All';
                // Sự kiện change cho các dropdown filter
                $('#seasonSelect, #seatClassSelect, #standSelect, #statusSelect, #emailSelect').change(function () {
                    seasonValue = $('#seasonSelect').val();
                    seatClassValue = $('#seatClassSelect').val();
                    standValue = $('#standSelect').val();
                    statusValue = $('#statusSelect').val();
                    emailValue = $('#emailSelect').val();
                    filterTable();
                });

                // Sự kiện click để sắp xếp bảng
                $('#sortQuantity, #sortPrice, #sortSeat').click(function () {
                    sortTable($(this).data('column'), $(this).data('order'));
                    $(this).data('order', $(this).data('order') === 'asc' ? 'desc' : 'asc');
                });

                // Sự kiện khi người dùng nhập vào ô tìm kiếm
                $('#valueSearch').keyup(function () {
                    var searchText = $(this).val().toLowerCase();
                    if (searchText.trim().length > 0) {
                        searchTable(searchText);
                    } else {
                        filterTable();
                    }
                });

                // Hàm lọc bảng dữ liệu
                function filterTable() {
                    $('table tbody tr').each(function () {
                        var row = $(this);
                        var show = true;

                        if (seasonValue !== 'All' && row.find('td:eq(1)').text() !== seasonValue) {
                            show = false;
                        }
                        if (standValue !== 'All' && row.find('td:eq(2)').text() !== standValue) {
                            show = false;
                        }
                        if (seatClassValue !== 'All' && row.find('td:eq(3)').text() !== seatClassValue) {
                            show = false;
                        }
                        if (statusValue !== 'All' && row.find('td:eq(7)').text() !== statusValue) {
                            show = false;
                        }
                        if (emailValue !== 'All' && row.find('td:eq(8)').text() !== emailValue) {
                            show = false;
                        }

                        if (show) {
                            row.show();
                        } else {
                            row.hide();
                        }
                    });
                }

                // Hàm sắp xếp bảng dữ liệu
                function sortTable(column, order) {
                    var rows = $('table tbody tr').get();

                    rows.sort(function (a, b) {
                        var A = $(a).children('td').eq(column).text().toUpperCase();
                        var B = $(b).children('td').eq(column).text().toUpperCase();

                        if (column === 4 || column === 5 || column === 6) {
                            A = parseFloat(A);
                            B = parseFloat(B);
                        }

                        if (order === 'asc') {
                            return (A > B) ? 1 : ((A < B) ? -1 : 0);
                        } else {
                            return (A < B) ? 1 : ((A > B) ? -1 : 0);
                        }
                    });

                    $.each(rows, function (index, row) {
                        $('table').children('tbody').append(row);
                    });
                }

                // Hàm tìm kiếm trong bảng dữ liệu
                function searchTable(searchText) {
                    $('table tbody tr').each(function () {
                        var row = $(this);
                        var text = row.text().toLowerCase();
                        var match = text.indexOf(searchText) > -1;
                        row.toggle(match);
                    });
                }
            });

            // Hàm gửi yêu cầu AJAX để tìm kiếm
            function searchTickets() {
                var searchText = $('#valueSearch').val();
                $.ajax({
                    type: 'GET',
                    url: 'manageHistoryPurchasedTicketSeasonSeat',
                    data: {searchText: searchText},
                    success: function (response) {
                        $('table tbody').html(response); // Cập nhật lại nội dung tbody của bảng
                    },
                    error: function (e) {
                        console.log('Error: ', e);
                    }
                });
            }
            $('#toggleButton').click(function () {
                // Lấy URL hiện tại
                var currentUrl = window.location.href;

                // Kiểm tra và thay đổi URL và icon
                if (currentUrl.includes('manageHistoryPurchasedTicketSeasonSeat')) {
                    window.location.href = 'manageHistoryPurchasedTicketMatchSeat';
                    $('#toggleButton').html('Ticket Match Seat <i class="btn-icon fas fa-caret-right"></i>');
                } else {
                    window.location.href = 'manageHistoryPurchasedTicketSeasonSeat';
                    $('#toggleButton').html('Ticket Season Seat <i class="btn-icon fas fa-caret-right"></i>');
                }
            });
        </script>
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
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-spreadsheet" viewBox="0 0 16 16">
        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5zM3 12v-2h2v2zm0 1h2v2H4a1 1 0 0 1-1-1zm3 2v-2h3v2zm4 0v-2h3v1a1 1 0 0 1-1 1zm3-3h-3v-2h3zm-7 0v-2h3v2z"/>
        </svg>
    </body>
</html>
