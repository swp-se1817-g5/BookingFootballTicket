<%-- 
Document   : manageFootballClub
Created on : May 23, 2024, 12:20:34 PM
Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <%@include file="side-bar.jsp" %>
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
                                    <div class="col-md-4">
                                        <form action="manageStand" method="get" id="searchForm">
                                            <input id="searchInputForm" name="search" type="text" class="form-control radius-md" placeholder="Search by name&hellip;">
                                        </form>
                                    </div>
                                    <div class="col-sm-8">
                                        <a type="button" href="#createStandModal" class="btn btn-success m-2 float-right" data-toggle="modal"><i class="fa fa-plus-circle me-2"></i> <span>Create Stand</span></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Stand Name</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.stands}" var="o">
                                        <tr>
                                            <td>${o.standId}</td>
                                            <td>${o.standName}</td>
                                            <td>
                                                <a onclick="update('${o.standId}', '${o.standName}', '${o.createdBy}', '${o.createdDate}', '${o.updatedBy}', '${o.lastUpdatedDate}')"  href="#updateStandModal" class="edit" title="E'${o.standId}', '${o.standName}'dit" data-toggle="modal"><i class="fa fa-eye" style="color: grey"></i></a>
                                                <a onclick="doDelete(${o.standId})" href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="fa fa-times-circle"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div> 
                </div>      
            </div>      
        </div>    
        <div id="createStandModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="createStandForm" action="createStand" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Create Stand</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>Stand Name</label>
                                <input id="standNameInput" name="standName" type="text" class="form-control" maxlength="50" required>
                                <span id="standNameInputError" class="text-danger"></span> 
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Create">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="updateStandModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="updateStandForm" action="updateStand" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Stand</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Stand ID</label>
                                <input id="standId" name="standId" readonly type="number" class="form-control" required>
                                <span id="standIdError" class="text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label>Stand Name</label>
                                <input id="standName" name="standName" maxlength="50" type="text" class="form-control" required>
                                <span id="standNameError" class="text-danger"></span>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Created By</label>
                                    <input id="createdBy" readonly="" class="form-control">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Created Date</label>
                                    <input id="createdDate" readonly="" class="form-control">
                                </div> 
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Updated By</label>
                                    <input id="updatedBy" readonly="" class="form-control">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Last Updated Date</label>
                                    <input id="lastUpdatedDate" readonly="" class="form-control">
                                </div>    
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>


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
                var updated = '<%= request.getAttribute("updated")%>';
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
                var created = '<%= request.getAttribute("created")%>';
                if (created !== 'null' && created !== '') {
                    var toast = $('#toastNotification');
                    if (created === "true") {
                        toast.find('#toastTitle').text('Success');
                        toast.find('#toastMessage').text('Stand created successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (created === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to create stand.');
                        toast.addClass('error').removeClass('success');
                    }
                    toast.toast('show');
                }
            });

            //delete
            $(document).ready(function () {
                var deleted = '<%= request.getAttribute("deleted")%>';
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
                var stands = [];
            <c:forEach items="${stands}" var="stand">
                stands.push({standId: "${stand.standId}", standName: "${stand.standName}"});
            </c:forEach>

                // Check for duplicate stand name and empty before submitting the create form
                $('#createStandForm').submit(function (event) {
                    var standName = $('#standNameInput').val().trim().toLowerCase();
                    var empty = standName === "";
                    var duplicate = stands.some(stand => stand.standName.toLowerCase() === standName);
                    if (empty) {
                        $('#standNameInputError').text('Can not be empty or blank!');
                        event.preventDefault();
                    } else if (duplicate) {
                        $('#standNameInputError').text('Stand name already exists. Please choose a different name.');
                        event.preventDefault();
                    } else {
                        $('#standNameInputError').text('');
                    }
                });

                // Check for duplicate stand name before submitting the update form
                $('#updateStandForm').submit(function (event) {
                    var standId = $('#standId').val();
                    var standName = $('#standName').val().trim().toLowerCase();
                    var empty = standName === "";
                    var originalStand = stands.find(stand => stand.standId == standId);
                    var duplicate = stands.some(stand => stand.standName.toLowerCase() === standName && stand.standId != standId);
                    if (empty) {
                        $('#standNameError').text('Can not be empty or blank!');
                        event.preventDefault();
                    } else if (standName !== originalStand.standName.toLowerCase() && duplicate) {
                        $('#standNameError').text('Stand name already exists. Please choose a different name.');
                        event.preventDefault();
                    } else {
                        $('#standNameError').text('');
                    }
                });
            });

            $(document).ready(function () {
                $('#searchInput').keypress(function (event) {
                    if (event.keyCode === 13) { // 13 is the Enter key
                        event.preventDefault();  // Prevent the default form submission
                        $('#searchForm').submit(); // Manually submit the form
                    }
                });
            });

            function doDelete(standId) {
                if (confirm("Do you want to delete stand with id = " + standId))
                    location.href = 'deleteStand?standId=' + standId;
            }

            function update(standId, standName, createdBy, createdDate, updatedBy, lastUpdatedDate) {
                document.getElementById('standId').value = standId;
                document.getElementById('standName').value = standName;
                document.getElementById('createdBy').value = createdBy;
                document.getElementById('createdDate').value = createdDate;
                document.getElementById('updatedBy').value = updatedBy;
                document.getElementById('lastUpdatedDate').value = lastUpdatedDate;

                // Clear error messages when opening the modal
                $('#standNameError').text('');

            }
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
