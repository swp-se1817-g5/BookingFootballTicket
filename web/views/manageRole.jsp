<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
            table.table tbody tr:hover {
                background-color: #f2f2f2;
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
            #seasonTable th {
                font-weight: bold;
            }
            .table thead th {
                vertical-align: middle;
                border-bottom: 2px solid #dee2e6;
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
                                        <form action="manageRole" method="get" id="searchForm">
                                            <div class="d-flex">
                                            <input id="searchInputForm" value="${requestScope.search}" type="text" name="search" class="form-control radius-md" placeholder="Tìm theo tên&hellip;">
                                                <input type="submit" class="btn btn-success" value="Tìm kiếm">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-8">
                                        <a type="button" href="#createRoleModal" class="btn btn-success m-2 float-right" data-toggle="modal"><i class="fa fa-plus-circle me-2"></i> <span>Thêm Vai Trò Mới</span></a>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty requestScope.message}">
                                <div class="alert alert-warning">${requestScope.message}</div>
                            </c:if>
                            <c:if test="${not empty param.message}">
                                <div class="alert alert-warning">${param.message}</div>
                            </c:if>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên Vai Trò</th>
                                        <th>Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody id="roles">
                                    <c:forEach items="${requestScope.roles}" var="r">
                                        <tr>
                                            <td>${r.roleId}</td>
                                            <td>${r.roleName}</td>
                                            <td>
                                                <a href="#updateRole${r.roleId}" class="edit" title="Sửa" data-toggle="modal">
                                                    <i class="fa fa-eye" style="color: gray"></i>
                                                </a>
                                                <a onclick="doDelete(${r.roleId})" class="delete" title="Xóa" data-toggle="tooltip">
                                                    <i class="fa fa-times-circle"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="clearfix">
                                <ul class="pagination float-left">
                                    <c:if test="${page > 1}">
                                        <li class="page-item"><a href="manageRole?page=${page - 1}" class="page-link"><</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                                        <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}">
                                            <a href="manageRole?page=${pageNumber}" class="page-link">${pageNumber}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page < noOfPages}">
                                        <li class="page-item"><a href="manageRole?page=${page + 1}" class="page-link">></a></li>
                                        </c:if>
                                </ul>
                            </div>

                            <div id="createRoleModal" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="createRole" method="post" onsubmit="return validateRoleForm()">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Tạo Vai Trò</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>Tên Vai Trò</label>
                                                    <input id="roleName" name="roleName" type="text" class="form-control" required>
                                                    <small id="roleNameError" class="form-text text-danger"></small>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                                <input type="submit" class="btn btn-success" value="Thêm">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <c:forEach items="${requestScope.roles}" var="r">
                                <div id="updateRole${r.roleId}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="updateRole" method="post">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Cập Nhật Vai Trò</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="roleId" value="${r.roleId}">
                                                    <div class="form-group">
                                                        <label>Tên Vai Trò</label>
                                                        <input id="newRoleName" name="roleNameInput" type="text" class="form-control" value="${r.roleName}" required>
                                                        <small id="editRoleNameError" class="form-text text-danger"></small>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                                    <input type="submit" class="btn btn-success" value="Cập Nhật">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>  
                    </div>
                </div>
            </div>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll('form[action="updateRole"]').forEach(function (form) {
                form.addEventListener("submit", function (event) {
                    var roleNameInput = form.querySelector('input[name="roleNameInput"]');
                    var roleName = roleNameInput.value.trim();
                    var roleNameError = form.querySelector('#editRoleNameError');

                    // Check if the role name is not empty
                    if (roleName === '') {
                        event.preventDefault(); // Prevent form submission
                        roleNameError.textContent = "Tên vai trò không được để trống.";
                    } else {
                        roleNameError.textContent = ""; // Clear error message if any
                    }
                });
                form.addEventListener("reset", function () {
                    var roleNameError = form.querySelector('#editRoleNameError');
                    roleNameError.textContent = ""; // Clear error message on form reset
                });
            });
        });
    </script>


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

        $(document).ready(function () {
            var updated = '<%= request.getAttribute("updated")%>';
            if (updated !== 'null' && updated !== '') {
                var toast = $('#toastNotification');
                if (updated === "true") {
                    toast.find('#toastTitle').text('Thành Công');
                    toast.find('#toastMessage').text('Vai trò được cập nhật thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (updated === "false") {
                    toast.find('#toastTitle').text('Lỗi');
                    toast.find('#toastMessage').text('Cập nhật vai trò thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

        $(document).ready(function () {
            var created = '<%= request.getAttribute("created")%>';
            if (created !== 'null' && created !== '') {
                var toast = $('#toastNotification');
                if (created === "true") {
                    toast.find('#toastTitle').text('Thành Công');
                    toast.find('#toastMessage').text('Vai trò được tạo thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (created === "false") {
                    toast.find('#toastTitle').text('Lỗi');
                    toast.find('#toastMessage').text('Tạo vai trò thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });

        $(document).ready(function () {
            var deleted = '<%= request.getAttribute("deleted")%>';
            if (deleted !== 'null' && deleted !== '') {
                var toast = $('#toastNotification');
                if (deleted === "true") {
                    toast.find('#toastTitle').text('Thành Công');
                    toast.find('#toastMessage').text('Vai trò được xóa thành công.');
                    toast.addClass('success').removeClass('error');
                } else if (deleted === "false") {
                    toast.find('#toastTitle').text('Lỗi');
                    toast.find('#toastMessage').text('Xóa vai trò thất bại.');
                    toast.addClass('error').removeClass('success');
                }
                toast.toast('show');
            }
        });
    </script>

    <script>
        function doDelete(roleId) {
            if (confirm("Bạn có muốn xóa vai trò có mã là " + roleId + " không?")) {
                location.href = 'deleteRole?roleId=' + roleId;
            }
        }
    </script>


    <!--script for create and update-->
    <script>
        function validateRoleForm() {
            var roleNameInput = document.getElementById("roleName");
            var roleName = roleNameInput.value.trim(); // Lấy giá trị và loại bỏ khoảng trắng đầu cuối

            var valid = true;

            // Kiểm tra nếu roleName chỉ chứa khoảng trắng
            if (roleName === "") {
                document.getElementById("roleNameError").innerText = "Tên vai trò không được để trống.";
                valid = false;
            }

            // Kiểm tra nếu roleName đã tồn tại
            var existingRoleNames = [
        <c:forEach items="${requestScope.roles}" var="r" varStatus="loop">
            "${r.roleName}"<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
            ];

            for (var i = 0; i < existingRoleNames.length; i++) {
                if (existingRoleNames[i].toLowerCase() === roleName.toLowerCase()) {
                    document.getElementById("roleNameError").innerText = "Tên vai trò đã tồn tại. Hãy chọn cái tên khác.";
                    valid = false;
                }
            }

            // Reset error message if validation passes
            if (valid) {
                document.getElementById("roleNameError").innerText = "";
            }

            return valid;
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            function loadPage(currentPage, searchValue) {
                $.ajax({
                    url: "manageRole", // URL của Servlet xử lý Ajax
                    type: "GET",
                    data: {
                        currentPage: currentPage,
                        search: searchValue
                    },
                    success: function (data) {
                        $("#roles").html($(data).find('#roles').html());
                        $("#pagination").html($(data).find('#pagination').html());
                    }
                });
            }
            $(document).on("click", ".page-link", function (e) {
                e.preventDefault();
                var currentPage = $(this).attr("data-page");
                var searchValue = $("#searchInputForm").val().trim();
                loadPage(currentPage, searchValue);
            });
            // Bắt sự kiện khi người dùng nhập liệu vào ô search

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

