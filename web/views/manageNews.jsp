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
                                <a href="manageRole" class="dropdown-item">Manage Role</a>
                                <a href="manageNews" class="dropdown-item active">Manage News</a>
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
                <!--                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                                    </a>
                                    <a href="#" class="sidebar-toggler flex-shrink-0">
                                        <i class="fa fa-bars"></i>
                                    </a>
                                    <form class="d-none d-md-flex ms-4">
                                        <input class="form-control border-0" type="search" placeholder="Search">
                                    </form>
                                    <div class="navbar-nav align-items-center ms-auto">
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                                <i class="fa fa-envelope me-lg-2"></i>
                                                <span class="d-none d-lg-inline-flex">Message</span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                                <a href="#" class="dropdown-item">
                                                    <div class="d-flex align-items-center">
                                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                                        <div class="ms-2">
                                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                                            <small>15 minutes ago</small>
                                                        </div>
                                                    </div>
                                                </a>
                                                <hr class="dropdown-divider">
                                                <a href="#" class="dropdown-item text-center">See all message</a>
                                            </div>
                                        </div>
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                                <i class="fa fa-bell me-lg-2"></i>
                                                <span class="d-none d-lg-inline-flex">Notificatin</span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                                <a href="#" class="dropdown-item">
                                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                                    <small>15 minutes ago</small>
                                                </a>
                                                <hr class="dropdown-divider">
                                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                                            </div>
                                        </div>
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                                <span class="d-none d-lg-inline-flex">John Doe</span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                                <a href="#" class="dropdown-item">My Profile</a>
                                                <a href="#" class="dropdown-item">Settings</a>
                                                <a href="#" class="dropdown-item">Log Out</a>
                                            </div>
                                        </div>
                                    </div>
                                </nav>-->
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4"><a href="manageNews"><h2>News <b>Management</b></h2></a></div>

                                    <div class="col-sm-4 searchh">
                                        <div class="search-box" id="searchForm">
                                            <a><i class="material-icons">&#xE8B6;</i></a>
                                            <input id="valueSearch" type="text" class="form-control" placeholder="Search...">
                                        </div>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $('#valueSearch').keypress(function (event) {
                                                if (event.keyCode === 13) { // 13 is the Enter key
                                                    event.preventDefault(); // Prevent the default form submission
                                                    var valueSearch = document.getElementById('valueSearch').value;
                                                    location.href = "manageNews?go=search&valueSearch=" + encodeURIComponent(valueSearch);
                                                }
                                            });
                                        });
                                    </script>
                                    <div class="col-sm-4 createe">
                                        <a href="#createNewsModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Create News</span></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th>Status</th>
                                        <th>State</th>
                                        <th>Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.getListNews}" var="n" varStatus="status">
                                        <tr style="word-break: break-word">
                                            <td>${status.count}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(n.title) > 30}">
                                                        ${fn:substring(n.title, 0, 30)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${n.title}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(n.content) > 50}">
                                                        ${fn:substring(n.content, 0, 50)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${n.content}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <c:if test=""></c:if>
                                            <c:choose>
                                                <c:when test="${n.status == 0}">
                                                    <td>Rejected</td>
                                                </c:when>
                                                <c:when test="${n.status == 1}">
                                                    <td>Pending</td>
                                                </c:when>
                                                <c:when test="${n.status == 2}">
                                                    <td>Approved</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Unknown</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${n.state=='false'}"><td>Hide</td></c:if>
                                            <c:if test="${n.state=='true'}"><td>Show</td></c:if>
                                                <td>
                                                    <a href="#viewDetailsNews${n.newsId}" class="view" title="View" data-toggle="modal"><i class="material-icons">&#xE417;</i></a>
                                                <a href="#updateNews${n.newsId}" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                                <a onclick="return confirmDelete(${n.newsId})" href = "deleteNews?newsId=${n.newsId}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <script>
                                function confirmDelete(newsId) {
                                    return confirm("Are you sure you want to delete newsId = " + newsId);
                                }
                            </script>
                        </div>
                    </div> 
                </div>      
            </div>      
        </div>      

        <div id="createNewsModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="createNewNews" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Create News</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required rows="2"></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Content</label>
                                <textarea name="content" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Image</label>
                                <br>
                                <input type="file" name="image"><br>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Conclusion</label>
                                <textarea name="conclusion" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="display: flex; align-items: center; gap: 10px;">
                                <label>State</label>
                                <input name="state" type="radio" required checked value="1">Show
                                <input name="state" type="radio" required value="0">Hide
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--------------------------------------------------------------------------------------------------------------------------------------------->



        <c:forEach items="${sessionScope.getListNews}" var="n">
            <div id="viewDetailsNews${n.newsId}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">			
                            <h4 class="modal-title">View Details</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>News ID</label>
                                <input name="newsId" class="form-control" value="${n.newsId}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.title}</p>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.content}</p>
                            </div>
                            <div class="form-group">
                                <label>Image</label><br>
                                <img src="${n.image}" alt="Image" style="width:100px;height:auto;">
                            </div>
                            <div class="form-group">
                                <label>Conclusion</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.conclusion}</p>
                            </div>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input type="datetime-local" name="createDate" class="form-control" value="${n.createdDate}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Create By</label>
                                <input name="createBy" class="form-control" value="${n.createBy}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Last Update Date</label>
                                <input type="datetime-local" name="lastUpdateDate" class="form-control" style="border: none" value="${n.lastUpdateDate}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Update By</label>
                                <input name="updateBy" class="form-control" value="${n.updateBy}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!--------------------------------------------------------------------------------------------------------------------------------------------->
        <c:forEach items="${sessionScope.getListNews}" var="n">
            <div id="updateNews${n.newsId}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateNews" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update News</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>News ID</label>
                                    <input name="newsId" class="form-control" value="${n.newsId}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="title" class="form-control" value="${n.title}">
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <input name="content" class="form-control" value="${n.content}">
                                </div>
                                 <div class="form-group">
                                <label>Image</label><br>
                                <img src="${n.image}" alt="Image" style="width:100px;height:auto;">
                            </div>
                                <div class="form-group" style="word-break: break-word">
                                    <input type="file" name="image">
                                    <input type="hidden" name="currentImage" value="${n.image}">
                                </div>
                                <div class="form-group">
                                    <label>State</label>
                                    <input name="state" type="radio" required value="1" ${n.state == 'true' ? 'checked' :''}>Show
                                    <input name="state" type="radio" required value="0" ${n.state == 'false' ? 'checked' :''}>Hide
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <input name="status" type="radio" required value="0" ${n.status == 0 ? 'checked' :''}>Reject
                                    <input name="status" type="radio" required value="2" ${n.status == 2 ? 'checked' :''}>Approve
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        <script>
            const now = new Date().toISOString().slice(0, 16);
            document.getElementById('datetimeInput1').setAttribute('min', now);
            document.getElementById('datetimeInput2').setAttribute('min', now);
        </script>
        <div class="toast" id="updateToast" data-delay="3000">
            <div class="toast-header">
                <strong class="mr-auto" id="toastTitle"></strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
            </div>
            <div class="toast-body" id="toastMessage"></div>
        </div>
        <script>
            $(document).ready(function () {
                var actions = {
                    updated: '<%= request.getAttribute("updated") %>',
                    created: '<%= request.getAttribute("created") %>',
                    deleted: '<%= request.getAttribute("deleted") %>'
                };

                for (var action in actions) {
                    var status = actions[action];
                    if (status !== 'null' && status !== '') {
                        var toast = $('#updateToast');
                        var title, message, classToAdd, classToRemove;

                        switch (action) {
                            case 'updated':
                                title = status !== "0" ? 'Success' : 'Error';
                                message = status !== "0" ? 'News updated successfully.' : 'Failed to update news.';
                                classToAdd = status !== "0" ? 'success' : 'error';
                                classToRemove = status !== "0" ? 'error' : 'success';
                                break;
                            case 'created':
                                title = status !== "0" ? 'Success' : 'Error';
                                message = status !== "0" ? 'News created successfully.' : 'Failed to create news.';
                                classToAdd = status !== "0" ? 'success' : 'error';
                                classToRemove = status !== "0" ? 'error' : 'success';
                                break;
                            case 'deleted':
                                title = status !== "0" ? 'Success' : 'Error';
                                message = status !== "0" ? 'News deleted successfully.' : 'Failed to delete news.';
                                classToAdd = status !== "0" ? 'success' : 'error';
                                classToRemove = status !== "0" ? 'error' : 'success';
                                break;

                        }

                        toast.find('#toastTitle').text(title);
                        toast.find('#toastMessage').text(message);
                        toast.addClass(classToAdd).removeClass(classToRemove);
                        toast.toast('show');
                    }
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
    </body>
</html>
