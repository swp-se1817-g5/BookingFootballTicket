<%-- 
    Document   : manageUser
    Created on : May 26, 2024, 10:53:13 AM
    Author     : Vinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
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
                padding-bottom: 0;
                margin: 0 0 0;
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
                float: left;
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
                                    <div class="col-md-4 searchh justify-content-md-between">
                                        <!-- Search User Form -->
                                        <div>
                                            <form id="searchForm" name="searchForm" action="searchUser" method="post">
                                                <div class="body">					
                                                    <div class="form-row">
                                                        <div class="form-group col-md-11">
                                                            <!--                                                            <a><i class="material-icons">&#xE8B6;</i></a>-->
                                                            <input id="valueSearch" name="valueSearch" type="text" class="form-control" placeholder="Search by email, name, ...">
                                                        </div>
                                                        <div class="form-group col-md-1 align-self-end">
                                                            <input type="submit" class="btn btn-success" value="Search">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div id="error-message" style="color: red;"></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>  
                                    <div class="col-md-8 createe d-flex align-items-md-start justify-content-end">
                                        <a type="button" href="#createUserModal" class="btn btn-success m-2 float-right" data-toggle="modal"><i class="fa fa-plus-circle me-2"></i> <span>Create User</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="userTable" class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Phone Number</th>
                                            <th>
                                                <select class="form-select border-0" id="roleFilterHeader" name="roleFilterHeader" onchange="filterByRole()">
                                                    <option value="0">All Roles</option>
                                                    <c:forEach items="${roles}" var="role">
                                                        <c:if test="${role.roleId != 1}">
                                                            <option value="${role.roleId}">${role.roleName}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </th>
                                            <th>
                                                <select class="form-select border-0" id="statusFilterHeader" name="statusFilterHeader" onchange="filterByStatus()">
                                                    <option value="0">All Status</option>
                                                    <option value="true">Active</option>
                                                    <option value="false">InActive</option>
                                                </select>
                                            </th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.users}" var="o">
                                            <c:if test="${o.roleId != 1}">
                                                <tr>
                                                    <td>${o.email}</td>
                                                    <td>${o.name}</td>
                                                    <td>${o.phoneNumber}</td>
                                                    <c:forEach items="${requestScope.roles}" var="r">
                                                        <c:if test="${r.roleId eq o.roleId}">
                                                            <td>${r.roleName}</td>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td>${o.status ? "Active" : "InActive"}</td>
                                                    <td>
                                                        <a href="#userDetailModal" class="view" title="View" onclick="update('${o.email}', '${o.name}', '${o.phoneNumber}', '${o.avatar}', '${o.roleId}', '${o.status}')" data-toggle="modal">
                                                            <i class="fa fa-eye" style="color: gray;"></i>
                                                        </a>
                                                        <c:if test="${o.status == true}">
                                                            <a href="#" class="inactive" title="InActive" data-toggle="tooltip" onclick="changeStatus('${o.email}')">
                                                                <i class="fas fa-toggle-on status-icon active" style="color: green;"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${o.status == false}">
                                                            <a href="#" class="active" title="Active" data-toggle="tooltip" onclick="changeStatus('${o.email}')">
                                                                <i class="fas fa-toggle-off status-icon active"></i>
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix">
                                <ul class="pagination">
                                    <c:if test="${page > 1}">
                                        <li class="page-item"><a href="manageUser?page=1" class="page-link">First</a></li>
                                        <li class="page-item"><a href="manageUser?page=${page - 1}" class="page-link">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                                        <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}">
                                            <a href="manageUser?page=${pageNumber}" class="page-link">${pageNumber}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page < noOfPages}">
                                        <li class="page-item"><a href="manageUser?page=${page + 1}" class="page-link">Next</a></li>
                                        <li class="page-item"><a href="manageUser?page=${noOfPages}" class="page-link">Last</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- User Detail Modal -->
                    <div class="modal fade" id="userDetailModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="updateUserForm" action="updateUser" method="post" enctype="multipart/form-data">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="userDetailModalLabel">User Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="detailEmail">Email</label>
                                            <input type="text" class="form-control" id="email" name="detailEmail" readonly>
                                            <div id="emailDetailError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="detailName">Name</label>
                                            <input type="text" class="form-control" id="name" name="detailName" required>
                                            <div id="nameDetailError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="detailPhoneNumber">Phone Number</label>
                                            <input type="text" class="form-control" id="phoneNumber" name="detailPhoneNumber" required>
                                            <div id="phoneNumberDetailError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="detailRole">Role</label>
                                            <input type="text" class="form-control" id="role" name="detailRole" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="detailStatus">Status</label>
                                            <input type="text" class="form-control" id="status" name="detailStatus" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="detailAvatar">Avatar</label>
                                            <div height="80px">
                                                <img class="img-responsive avatarPreview" src="" style="width: auto; height: 80px" alt="Avatar"/>
                                            </div>
                                            <input type="file" class="form-control" id="avatar" name="detailAvatar" accept="image/*" onchange="previewAvatar(event)">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Create User Modal -->
                    <div id="createUserModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="createUserForm" name="createUserForm" action="createUser" method="post" enctype="multipart/form-data">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Create User</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input name="emailInput" id="emailInput" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" required>
                                            <div id="emailError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="nameInput" id="nameInput" type="text" class="form-control" required>
                                            <div id="nameError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="roleInput">User Role</label>
                                            <select name="roleIdInput" id="roleIdInput" class="form-control" required>
                                                <c:forEach items="${roles}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <option value="${role.roleId}">${role.roleName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input name="passwordInput" id="passwordInput" type="password" class="form-control" required>
                                            <div id="passwordError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone Number</label>
                                            <input name="phoneNumberInput" id="phoneNumberInput" type="text" class="form-control" pattern="[0-9]{10}" required>
                                            <div id="phoneNumberError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="avatarInput">Avatar</label>
                                            <input name="avatarInput" id="avatarInput" type="file" accept="image/*" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <img id="avatarPreview" src="" alt="Avatar Preview" style="max-width: 200px; max-height: 200px;">
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
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

        <!-- script for toast notification -->
        <script>
            function filterByStatus() {
                var statusSelect, filterStatus, table, tr, td, i;
                statusSelect = document.getElementById("statusFilterHeader");
                filterStatus = statusSelect.value.toUpperCase();
                table = document.getElementById("userTable");
                tr = table.getElementsByTagName("tr");

                for (i = 1; i < tr.length; i++) { // Start from 1 to skip the header row
                    tr[i].style.display = "none"; // Hide the row by default

                    td = tr[i].getElementsByTagName("td");
                    if (td.length > 0) {
                        var status = td[4].textContent.toUpperCase();

                        if (filterStatus === "0" || // "All Status" selected
                                (filterStatus === "TRUE" && status === "ACTIVE") ||
                                (filterStatus === "FALSE" && status === "INACTIVE")) {
                            tr[i].style.display = "";
                        }
                    }
                }
            }
        </script>
        <!-- script for toast notification -->
        <script>
            //update
            $(document).ready(function () {
                var updated = '<%= request.getAttribute("updated")%>';
                if (updated !== 'null' && updated !== '') {
                    var toast = $('#toastNotification');
                    if (updated === "true") {
                        toast.find('#toastTitle').text('Success');
                        toast.find('#toastMessage').text('User updated successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (updated === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to update user!');
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
                        toast.find('#toastMessage').text('User created successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (created === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to create user!');
                        toast.addClass('error').removeClass('success');
                    }
                    toast.toast('show');
                }
            });

            //delete
            $(document).ready(function () {
                var deleted = '<%= request.getAttribute("changed")%>';
                if (deleted !== 'null' && deleted !== '') {
                    var toast = $('#toastNotification');
                    if (deleted === "true") {
                        toast.find('#toastTitle').text('Success');
                        toast.find('#toastMessage').text('User change status successfully.');
                        toast.addClass('success').removeClass('error');
                    } else if (deleted === "false") {
                        toast.find('#toastTitle').text('Error');
                        toast.find('#toastMessage').text('Failed to change status user!');
                        toast.addClass('error').removeClass('success');
                    }
                    toast.toast('show');
                }
            });

        </script>

        <script>
            $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
                    var users = [];
            <c:forEach items="${users}" var="user">
            users.push({email: "${user.email}"});
            </c:forEach>

            // Check for duplicate email before submitting the create form
            $('#createUserForm').submit(function (event) {
            var email = $('#emailInput').val().trim();
                    var emptyEmail = email === '';
                    var duplicate = users.some(user => user.email === email);
                    if (emptyEmail) {
            $('#emailError').text('Can not be empty or blank!');
                    event.preventDefault();
            } else if (duplicate) {
            $('#emailError').text('Email already exists. Please choose a different email.');
                    event.preventDefault();
            } else {
            $('#emailError').text('');
            }
            });
                    // Check for duplicate email before submitting the update form
                    $('#updateUserForm').submit(function (event) {
            var email = $('#detailEmail').val().trim();
                    var originalEmail = users.find(users => user.email === email);
                    var duplicate = users.some(user => user.email === email);
                    if (email !== originalEmail.email && duplicate) {
            $('#emailDetailError').text('Email already exists. Please choose a different email.');
                    event.preventDefault();
            } else {
            $('#emailDetailError').text('');
            }
            });
        </script>
        <script>
                    $(document).ready(function() {
            $('#searchForm').on('submit', function(event) {
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu mặc định

                    var searchValue = $('#valueSearch').val().trim();
                    if (searchValue === '') {
            $('#error-message').text("Search field cannot be empty.");
                    return;
            } else {
            $('#error-message').text(""); // Clear any previous error message
            }

            $.ajax({
            type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {
                    $('#searchUserModal').modal('hide');
                            $('#userTable tbody').html(data.html);
                            $('.pagination').html(data.pagination);
                            $('.hint-text strong').text(data.usersCount);
                    },
                    error: function(xhr, status, error) {
                    $('#error-message').text("Error: " + xhr.responseText);
                    }
            });
            });
            });
                    $('#roleFilterHeader').change(function () {
            var roleId = $(this).val();
                    $.ajax({
                    type: 'POST',
                            url: 'manageUser',
                            data: {roleId: roleId},
                            success: function (data) {
                            $('#userTable tbody').html(data.html);
                                    $('.pagination').html(data.pagination);
                                    $('.hint-text strong').text(data.usersCount);
                            },
                            error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                            }
                    });
            });
        </script>
        <script>
                    function update(email, name, phoneNumber, img, roleid, status) {
                    document.getElementById('email').value = email;
                            document.getElementById('name').value = name;
                            document.getElementById('phoneNumber').value = phoneNumber;
                            document.getElementById('role').value = roleid === "2" ? "User" : "Staff";
                            document.getElementById('status').value = status === "true" ? "Active" : "InActive";
                            var avatarImg = document.querySelector('.avatarPreview');
                            avatarImg.src = img;
                            $('#emailDetailError').text('');
                            $('#nameDetailError').text('');
                            $('#phoneNumberDetailError').text('');
                    }
            function changeStatus(email) {
            if (confirm("Do you want to change the status of this user with email = " + email)) {
            location.href = 'changestatusUser?email=' + email;
            }
            }
            $('input[name="avatarInput"]').change(function () {
            previewImage(this);
            });
                    // Function to preview image from URL
                            function previewImage(input) {
                            if (input.files && input.files[0]) {
                            var reader = new FileReader();
                                    reader.onload = function (e) {
                                    $('#avatarPreview').attr('src', e.target.result);
                                    };
                                    reader.readAsDataURL(input.files[0]);
                            }
                            }

                    function previewAvatar(event) {
                    const reader = new FileReader();
                            reader.onload = function () {
                            const output = document.querySelector('.avatarPreview');
                                    output.src = reader.result;
                            };
                            reader.readAsDataURL(event.target.files[0]);
                    }
        </script>
        <script>

                    // Validate Create Form
                    function validateEmail() {
                    var email = $('[name="emailInput"]').val().trim();
                            var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
                            if (email === '') {
                    $('#emailError').text('Email is required. Please enter your email address.');
                            return false;
                    } else if (!emailPattern.test(email)) {
                    $('#emailError').text('Invalid email format. Please enter a valid email address (e.g., user@example.com).');
                            return false;
                    } else {
                    $('#emailError').text('');
                            return true;
                    }
                    }

                    function validateName() {
                    var name = $('[name="nameInput"]').val().trim();
                            if (name === '') {
                    $('#nameError').text('Name is required. Please enter your full name.');
                            return false;
                    } else {
                    $('#nameError').text('');
                            return true;
                    }
                    }

                    function validatePhoneNumber() {
                    var phoneNumber = $('[name="phoneNumberInput"]').val().trim();
                            var phonePattern = /^0[0-9]{9}$/;
                            if (phoneNumber === '') {
                    $('#phoneNumberError').text('Phone number is required. Please enter your phone number.');
                            return false;
                    } else if (!phonePattern.test(phoneNumber)) {
                    $('#phoneNumberError').text('Invalid phone number format. Phone number must be 10 digits long and start with 0.');
                            return false;
                    } else {
                    $('#phoneNumberError').text('');
                            return true;
                    }
                    }

                    function validatePassword() {
                    var password = $('[name="passwordInput"]').val().trim();
                            var passwordPattern = /^(?=.*[0-9])(?=.*[A-Z]).{8,20}$/;
                            if (password === '') {
                    $('#passwordError').text('Password is required. Please enter your password.');
                            return false;
                    } else if (password.length < 8 || password.length > 20) {
                    $('#passwordError').text('Password must be between 8 and 20 characters long.');
                            return false;
                    } else if (!passwordPattern.test(password)) {
                    $('#passwordError').text('Password must contain at least one digit and one uppercase letter.');
                            return false;
                    } else {
                    $('#passwordError').text('');
                            return true;
                    }
                    }

                    function validateForm() {
                    var emailValid = validateEmail();
                            var nameValid = validateName();
                            var phoneNumberValid = validatePhoneNumber();
                            var passwordValid = validatePassword();
                            return emailValid && nameValid && phoneNumberValid && passwordValid;
                    }

// Validate fields on input
                    $('[name="emailInput"]').on('input', function () {
                    validateEmail();
                    });
                            $('[name="nameInput"]').on('input', function () {
                    validateName();
                    });
                            $('[name="phoneNumberInput"]').on('input', function () {
                    validatePhoneNumber();
                    });
                            $('[name="passwordInput"]').on('input', function () {
                    validatePassword();
                    });
                            function validateUpdateEmail() {
                            var email = $('#updateUserForm input[name="detailEmail"]').val().trim();
                                    var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
                                    if (email === '') {
                            $('#emailDetailError').text('Email is required. Please enter your email address.');
                                    return false;
                            } else if (!emailPattern.test(email)) {
                            $('#emailDetailError').text('Invalid email format. Please enter a valid email address (e.g., user@example.com).');
                                    return false;
                            } else {
                            $('#emailDetailError').text('');
                                    return true;
                            }
                            }

                    function validateUpdateName() {
                    var name = $('#updateUserForm input[name="detailName"]').val().trim();
                            if (name === '') {
                    $('#nameDetailError').text('Name is required. Please enter your full name.');
                            return false;
                    } else {
                    $('#nameDetailError').text('');
                            return true;
                    }
                    }

                    function validateUpdatePhoneNumber() {
                    var phoneNumber = $('#updateUserForm input[name="detailPhoneNumber"]').val().trim();
                            var phonePattern = /^0[0-9]{9}$/;
                            if (phoneNumber === '') {
                    $('#phoneNumberDetailError').text('Phone number is required. Please enter your phone number.');
                            return false;
                    } else if (!phonePattern.test(phoneNumber)) {
                    $('#phoneNumberDetailError').text('Invalid phone number format. Phone number must be 10 digits long and start with 0.');
                            return false;
                    } else {
                    $('#phoneNumberDetailError').text('');
                            return true;
                    }
                    }

                    function validateUpdateForm() {
                    var emailValid = validateUpdateEmail();
                            var nameValid = validateUpdateName();
                            var phoneNumberValid = validateUpdatePhoneNumber();
                            return emailValid && nameValid && phoneNumberValid;
                    }
                    // Validate Update Form Fields on Input
                    $('#updateUserForm input[name="detailEmail"]').on('input', function () {
                    validateUpdateEmail();
                    });
                            $('#updateUserForm input[name="detailName"]').on('input', function () {
                    validateUpdateName();
                    });
                            $('#updateUserForm input[name="detailPhoneNumber"]').on('input', function () {
                    validateUpdatePhoneNumber();
                    });
                            $('#updateUserForm').submit(function (event) {
                    if (!validateUpdateForm()) {
                    event.preventDefault();
                    }
                    });
        </script>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
