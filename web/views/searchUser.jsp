<%-- 
    Document   : manageUser
    Created on : May 26, 2024, 10:53:13 AM
    Author     : Vinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Result</title>
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
            table.table tbody tr:hover {
                background-color: #f2f2f2;
            }
            .btn-custom {
                background-color: #007bff; /* Màu nền */
                color: white; /* Màu chữ */
                border: none; /* Bỏ viền */
                padding: 10px 20px; /* Khoảng cách bên trong */
                font-size: 16px; /* Kích thước chữ */
                cursor: pointer; /* Con trỏ */
                border-radius: 5px; /* Bo góc */
                transition: background-color 0.3s ease; /* Hiệu ứng chuyển đổi màu nền */
            }

            .btn-custom:hover {
                background-color: #0056b3; /* Màu nền khi hover */
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
                                <a href="manageUser" class="dropdown-item active">Manage User</a>
                                <a href="manageMatch" class="dropdown-item">Manage Match</a>
                                <a href="manageFootballClub" class="dropdown-item ">Manage Football Club</a>
                                <a href="manageSeason" class="dropdown-item">Manage Season</a>
                                <a href="manageStand" class="dropdown-item">Manage Stand</a>
                                <a href="manageRole" class="dropdown-item">Manage Role</a>
                                <a href="manageNews" class="dropdown-item">Manage News</a>
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
                <!-- Navbar Start -->
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4"><h2>Manage <b>User</b></h2></div>

                                    <div class="col-sm-8 text-right">
                                        <input type="button" class="btn btn-custom" value="Back" onclick="window.location.href = 'manageUser'">
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty requestScope.message}">
                                <div class="alert alert-warning">${requestScope.message}</div>
                            </c:if>
                            <c:if test="${not empty param.message}">
                                <div class="alert alert-warning">${param.message}</div>
                            </c:if>
                            <div class="table-responsive">
                                <table id="userTable" class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Role</th>
                                            <th>Phone Number</th>
                                            <th>Avatar<i class="fa "></i></th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.users}" var="o">
                                            <tr>
                                                <td>${o.email}</td>
                                                <td>${o.name}</td>
                                                <c:forEach items="${requestScope.roles}" var="r">
                                                    <c:if test="${r.roleId eq o.roleId}">
                                                        <td>${r.roleName}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td>${o.phoneNumber}</td>
                                                <td><img src="${o.avatar}" alt="Avatar" style="max-width: 100px; max-height: 100px;"></td>
                                                <td>
                                                    <a href="#" class="view" title="View" data-toggle="modal"><i class="material-icons">&#xE417;</i></a>
                                                    <a href="editUser.jsp?email=${o.email}" class="edit" title="Edit" data-toggle="tooltip">
                                                        <i class="material-icons">&#xE254;</i>
                                                    </a>
                                                    <a href="deleteUser?email=${o.email}" class="delete" title="Delete" data-toggle="tooltip">
                                                        <i class="material-icons">&#xE872;</i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix" >
                                <div class="hint-text">Showing <strong>${requestScope.users.size()}</strong> out of <strong>${noOfRecords}</strong> entries</div>
                                <ul class="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item"><a class="page-link" href="?searchType=${param.searchType}&keyword=${param.keyword}&page=${currentPage - 1}&pageSize=${pageSize}">Previous</a></li>
                                        </c:if>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="?searchType=${param.searchType}&keyword=${param.keyword}&page=${i}&pageSize=${pageSize}">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                        <li class="page-item"><a class="page-link" href="?searchType=${param.searchType}&keyword=${param.keyword}&page=${currentPage + 1}&pageSize=${pageSize}">Next</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </body>
    <!-- toast notification -->
    <div class="toast" id="toastNotification" data-delay="3000">
        <div class="toast-header">
            <strong class="mr-auto" id="toastTitle"></strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
        </div>
        <div class="toast-body" id="toastMessage"></div>
    </div>

    <!-- script for toast notification -->
    <script>
        //update
        $(document).ready(function () {
            var updated = '<%= request.getAttribute("updated") %>';
            if (updated !== 'null' && updated !== '') {
                var toast = $('#toastNotification');
                if (updated === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Stand updated successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (updated === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to update stand.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });
        //create
        $(document).ready(function () {
            var created = '<%= request.getAttribute("created") %>';
            if (created !== 'null' && created !== '') {
                var toast = $('#toastNotification');
                if (created === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Football Club created successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (created === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to create Football Club.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

        //delete
        $(document).ready(function () {
            var deleted = '<%= request.getAttribute("deleted") %>';
            if (deleted !== 'null' && deleted !== '') {
                var toast = $('#toastNotification');
                if (deleted === "true") {
                    toast.find('#toastTitle').text('Success');
                    toast.find('#toastMessage').text('Stand deleted successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (deleted === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to delete stand.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

    </script>
    <!--script for create and update-->
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();

            // Convert the stands list from JSP to a JavaScript array
            var clubs = [];
        <c:forEach items="${footballClubs}" var="club">
            clubs.push({clubId: "${club.clubId}", clubName: "${club.clubName}"});
        </c:forEach>

            // Check for duplicate club name before submitting the update form
            $('#updateFootballClubForm').submit(function (event) {
                var clubId = $('#clubId').val();
                var clubName = $('#clubName').val().trim();

                var originalClub = clubs.find(club => club.clubId == clubId);

                var duplicate = clubs.some(club => club.clubName === clubName && club.clubId != clubId);
                console.log(duplicate);

                if (clubName !== originalClub.clubName && duplicate) {
                    $('#clubNameError').text('Club already exists. Please choose a different name');
                    event.preventDefault();
                } else {
                    $('#clubNameError').text('');
                }
            });


        });

        function deleteUser(userId) {
            if (confirm("Do you want to delete user with ID = " + userId))
                location.href = 'deleteUser?userId=' + userId;
        }

        function updateUser(userId, userName) {
            document.getElementById('clubId').value = clubId;
            document.getElementById('clubName').value = clubName;


            $('#clubNameError').text('');
        }
    </script>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
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
</html>

