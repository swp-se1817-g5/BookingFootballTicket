<%-- 
Document   : manageFootballClub
Created on : May 23, 2024, 12:20:34 PM
Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
            <%@include file="side-bar.jsp"%>
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
                                        <form action="manageFootballClub" method="get" id="searchForm">


                                            <input id="searchInputForm" value="${requestScope.search}" type="text" name="search" class="form-control radius-md" placeholder="Search by name&hellip;">

                                        </form>

                                    </div>
                                    <div class="col-md-8">
                                        <a type="button" href="#createModal" data-toggle="modal" class="btn btn-success m-2 float-right"><i class="fa fa-plus-circle me-2"></i>Create Football Club</a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th width="10%">#</th>
                                        <th width="15%">Image</th>
                                        <th width="20%">Football Club Name</th>
                                        <th>Description</th>
                                        <th width="10%">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="footballClubs">
                                    <c:forEach items="${requestScope.footballClubs}" var="o">
                                        <tr>
                                            <td>${o.clubId}</td>
                                            <td height="80px"><img class="img-responsive" src="${o.img}" style="width: auto; height: 80px" alt="football club"/></td>
                                            <td>${o.clubName}</td>
                                            <td>${o.description}</td>
                                            <td>
                                                <a href="#updateFCModal" onclick="update('${o.clubId}', '${o.clubName}', '${o.description}', '${o.img}', '${o.createdBy}', '${o.createdDate}', '${o.updatedBy}', '${o.lastUpdatedDate}')" class="edit" title="Edit" data-toggle="modal"><i class="fa fa-eye" style="color: grey"></i></a>
                                                <a href="#" onclick="doDelete('${o.clubId}')"  class="delete" title="Delete" data-toggle="tooltip"><i class="fa fa-times-circle"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="clearfix d-flex justify-content-md-start" id="pagination">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i" >
                                        <li class="page-item ${pageIndex == i ? 'active': '' }"><a href="#" class="page-link"  data-page="${i}">${i}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>  
                </div>     
            </div>      
        </div>      


        <div id="createModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="createFootballClub" id="createFootballClubForm" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Create Football Club</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Image</label>
                                <div class="d-flex justify-content-center">

                                    <img id="imagePreviewInput" src="#" alt="Your Image"  style="display: none; width: auto; height: 200px">
                                </div>
                                </br>

                                <input id="imageUploadInput" name="image" type="file" accept="image/*" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Football Club Name</label>
                                <input id="clubNameInput" name="clubName" type="text" class="form-control" maxlength="50" required>
                                <span id="clubNameInputError" class="text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="descriptionInput" name="description" type="text" class="form-control" maxlength="255"></textarea>
                                <span id="descriptionInputError" class="text-danger"></span>
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


        <div id="updateFCModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateFootballClub" id="updateFootballClubForm" enctype="multipart/form-data" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Football Club</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Club ID</label>
                                <input id="clubId" name="clubId" readonly type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                </br>
                                <div class="d-flex justify-content-center">
                                    <img  id="img" height="200px" width="auto" class="img-responsive" alt="Your Image"/>
                                </div>
                                </br>
                                <input id="imageUpload" name="image" type="file" accept="image/*" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Club Name</label>
                                <input id="clubName" name="clubName" maxlength="50" type="text" class="form-control" required>
                                <span id="clubNameError" class="text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="description" name="description" maxlength="255" type="text" class="form-control"></textarea>
                                <span id="descriptionError" class="text-danger"></span>
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
                        toast.find('#toastMessage').text('Football Club updated successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (updated === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to update Football Club!');
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
                        toast.find('#toastMessage').text('Football Club created successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (created === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to create Football Club!');
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
                        toast.find('#toastMessage').text('Football Club deleted successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (deleted === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to delete Football Club!');
                        toast.addClass('error').removeClass('success');
                    }
                    toast.toast('show');
                }
            });

        </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function loadPage(pageIndex, searchValue) {
                    $.ajax({
                        url: "manageFootballClub", // URL của Servlet xử lý Ajax
                        type: "GET",
                        data: {
                            pageIndex: pageIndex,
                            search: searchValue
                        },
                        success: function (data) {
                            $("#footballClubs").html($(data).find('#footballClubs').html());
                            $("#pagination").html($(data).find('#pagination').html());
                        }
                    });
                }
                $(document).on("click", ".page-link", function (e) {
                    e.preventDefault();
                    var pageIndex = $(this).attr("data-page");
                    var searchValue = $("#searchInputForm").val().trim();
                    loadPage(pageIndex, searchValue);
                });
                // Bắt sự kiện khi người dùng nhập liệu vào ô search
             
            });
        </script>

        <!--script for create and update-->
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();

                // Convert the stands list from JSP to a JavaScript array
                var clubs = [];
            <c:forEach items="${allFootballClubs}" var="club">
                clubs.push({clubId: "${club.clubId}", clubName: "${club.clubName}"});
            </c:forEach>

                // Check for duplicate fb name before submitting the create form
                $('#createFootballClubForm').submit(function (event) {
                    var clubName = $('#clubNameInput').val().trim().toLowerCase();
                    var emptyClubName = clubName === "";
                    var duplicate = clubs.some(club => club.clubName.toLowerCase() === clubName);
                    if (emptyClubName) {
                        $('#clubNameInputError').text('Can not be empty or blank!');
                        event.preventDefault();
                    } else if (duplicate) {
                        $('#clubNameInputError').text('Club already exists. Please choose a different name.');
                        event.preventDefault();
                    } else {
                        $('#clubNameInputError').text('');
                    }
                });

                // Check for duplicate club name before submitting the update form
                $('#updateFootballClubForm').submit(function (event) {
                    var clubId = $('#clubId').val();
                    var clubName = $('#clubName').val().trim().toLowerCase();

                    var originalClub = clubs.find(club => club.clubId.toLowerCase() == clubId);

                    var duplicate = clubs.some(club => club.clubName.toLowerCase() === clubName && club.clubId != clubId);
                    console.log(duplicate);

                    if (clubName !== originalClub.clubName.toLowerCase() && duplicate) {
                        $('#clubNameError').text('Club already exists. Please choose a different name');
                        event.preventDefault();
                    } else {
                        $('#clubNameError').text('');
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

            function doDelete(clubId) {
                if (confirm("Do you want to delete Football Club with id = " + clubId))
                    location.href = 'deleteFootballClub?clubId=' + clubId;
            }

            function update(clubId, clubName, description, img, createdBy, createdDate, updatedBy, lastUpdatedDate) {
                document.getElementById('clubId').value = clubId;
                document.getElementById('clubName').value = clubName;
                document.getElementById('description').value = description;
                document.getElementById('img').src = img;

                document.getElementById('createdBy').value = createdBy;
                document.getElementById('createdDate').value = createdDate;
                document.getElementById('updatedBy').value = updatedBy;
                document.getElementById('lastUpdatedDate').value = lastUpdatedDate;


                $('#clubNameError').text('');

            }
            

        </script>

        <!<!-- Script for image preview -->
        <script>
            document.getElementById('imageUpload').addEventListener('change', function (event) {
                const [file] = event.target.files;
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('img').src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
        <script>
            document.getElementById('imageUploadInput').addEventListener('change', function (event) {
                const [file] = event.target.files;
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('imagePreviewInput').src = e.target.result;
                        document.getElementById('imagePreviewInput').style.display = 'block';
                    };
                    reader.readAsDataURL(file);
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
