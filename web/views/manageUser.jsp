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
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="roleFilter">Filter</label>
                                            </div>
                                            <select class="custom-select" id="roleFilter" name="roleFilter">
                                                <option value="0">All Roles</option>
                                                <c:forEach items="${roles}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <option value="${role.roleId}">${role.roleName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 searchh">
                                        <!-- Button to open the search modal -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#searchUserModal">
                                            Open Search
                                        </button>
                                    </div>
                                    <div class="col-sm-4 createe">
                                        <a href="#createUserModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
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
                                            <c:if test="${o.roleId != 1}">
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
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix" >
                                <div class="hint-text">Showing <strong>${requestScope.users.size()}</strong> out of <strong>${noOfRecords}</strong> entries</div>
                                <ul class="pagination">
                                    <c:if test="${page > 1}">
                                        <li class="page-item"><a href="manageUser?page=${page - 1}" class="page-link"><</a></li>
                                        </c:if>    
                                        <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                                        <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}">
                                            <a href="manageUser?page=${pageNumber}" class="page-link">${pageNumber}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page < noOfPages}">
                                        <li class="page-item"><a href="manageUser?page=${page + 1}" class="page-link">></a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div id="createUserModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="createUserForm" name="createUserForm" action="createUser" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Create User</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" required>
                                            <div id="emailError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="role">User Role</label>
                                            <select name="roleId" class="form-control" required>
                                                <c:forEach items="${roles}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <option value="${role.roleId}">${role.roleName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input name="password" type="password" class="form-control" required>
                                            <div id="passwordError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone Number</label>
                                            <input name="phoneNumber" type="text" class="form-control" pattern="[0-9]{10}" required>
                                            <div id="phoneNumberError" style="color: red;"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="avatar">Avatar</label>
                                            <input name="avatar" type="file" accept="image/*" class="form-control" required>
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

                    <!-- Search User Modal -->
                    <div id="searchUserModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="searchForm" name="searchForm" action="searchUser" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Search User</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label for="email">Email</label>
                                                <input name="email" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="name">Name</label>
                                                <input name="name" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="roleId">User Role</label>
                                                <select name="roleId" class="form-control">
                                                    <c:forEach items="${roles}" var="role">
                                                        <c:if test="${role.roleId != 1}">
                                                            <option value="${role.roleId}">${role.roleName}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="phoneNumber">Phone Number</label>
                                                <input name="phoneNumber" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div id="error-message" style="color: red;"></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Search">
                                    </div>
                                </form>
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
                    toast.find('#toastMessage').text('User updated successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (updated === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to update user.');
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
                    toast.find('#toastMessage').text('User created successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (created === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to create User.');
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
                    toast.find('#toastMessage').text('User deleted successfully.');
                    toast.addClass('success').removeClass('error');
                } else if (deleted === "false") {
                    toast.find('#toastTitle').text('Error');
                    toast.find('#toastMessage').text('Failed to delete user.');
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
            // Convert the users list from JSP to a JavaScript array
            var users = [];
        <c:forEach items="${users}" var="user">
            users.push({email: "${user.email}", name: "${user.name}"});
        </c:forEach>

            // Check for duplicate email before submitting the create form
            $('#createUserForm').submit(function (event) {
                var email = $('#email').val().trim();
                var duplicate = users.some(user => user.email === email);
                if (duplicate) {
                    $('#emailError').text('Email already exists. Please choose a different email.');
                    event.preventDefault();
                } else {
                    $('#emailError').text('');
                }
            });

            // Check for duplicate email before submitting the update form
            $('#updateUserForm').submit(function (event) {
                var email = $('#emailInput').val().trim();
                var duplicate = users.some(user => user.email === email);
                if (duplicate) {
                    $('#emailInputError').text('Email already exists. Please choose a different email.');
                    event.preventDefault();
                } else {
                    $('#emailInputError').text('');
                }
            });

            function deleteUser(email) {
                if (confirm("Do you want to delete user with email = " + email))
                    location.href = 'deleteUser?email=' + email;
            }

            function updateUser(email, name) {
                document.getElementById('email').value = email;
                document.getElementById('name').value = name;
                $('#UseremailError').text('');
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <script>
        // Function to preview image from URL
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#avatarPreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]); // Convert image to base64 string
            }
        }

        // Event listener for file input change
        $(document).ready(function () {
            $('input[name="avatar"]').change(function () {
                previewImage(this);
            });
        });
    </script>
    <%--Validate Create--%>
    <script>
        function validateEmail() {
            var email = $('[name="email"]').val().trim();
            var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
            if (email === '') {
                $('#emailError').text('Email is required.');
                return false;
            } else if (!emailPattern.test(email)) {
                $('#emailError').text('Invalid email format.');
                return false;
            } else {
                $('#emailError').text('');
                return true;
            }
        }

        function validateName() {
            var name = $('[name="name"]').val().trim();
            if (name === '') {
                $('#nameError').text('Name is required.');
                return false;
            } else {
                $('#nameError').text('');
                return true;
            }
        }

        function validatePhoneNumber() {
            var phoneNumber = $('[name="phoneNumber"]').val().trim();
            var phonePattern = /^[0-9]{10}$/;
            if (phoneNumber === '') {
                $('#phoneNumberError').text('Phone number is required.');
                return false;
            } else if (!phonePattern.test(phoneNumber)) {
                $('#phoneNumberError').text('Invalid phone number format.');
                return false;
            } else {
                $('#phoneNumberError').text('');
                return true;
            }
        }

        function validatePassword() {
            var password = $('[name="password"]').val().trim();
            var passwordPattern = /^(?=.*[0-9])(?=.*[A-Z]).{8,20}$/;
            if (password === '') {
                $('#passwordError').text('Password is required.');
                return false;
            } else if (password.length < 8 || password.length > 20) {
                $('#passwordError').text('Password must be between 6 and 20 characters long.');
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
        $('[name="email"]').on('input', function () {
            validateEmail();
        });
        $('[name="name"]').on('input', function () {
            validateName();
        });
        $('[name="phoneNumber"]').on('input', function () {
            validatePhoneNumber();
        });
        $('[name="password"]').on('input', function () {
            validatePassword();
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#roleFilter').change(function () {
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
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#searchForm').on('submit', function (event) {
                event.preventDefault(); // Prevent the form from submitting via the browser

                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function (data) {
                        $('#searchUserModal').modal('hide'); // Hide the modal on success
                        $('#userTable tbody').html(data.html);
                        $('.pagination').html(data.pagination);
                        $('.hint-text strong').text(data.usersCount);
                    },
                    error: function (xhr, status, error) {
                        $('#error-message').text("Error: " + xhr.responseText);
                    }
                });
            });
            // Handle pagination clicks
            $(document).on('click', '.pagination a', function (e) {
                e.preventDefault();
                var page = $(this).data('page');
                $('#searchForm').append('<input type="hidden" name="page" value="' + page + '">');
                $('#searchForm').submit();
            });
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
