<%-- 
    Document   : manageUser
    Created on : May 26, 2024, 10:53:13 AM
    Author     : Vinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
            /* Tạo đường viền cho bảng */
            table.table {
                border: 1px solid #ddd;
            }

            /* Tạo đường viền cho các ô */
            table.table td {
                border: 1px solid #ddd;
            }

            /* Đổi màu nền cho các hàng xen kẽ */
            table.table tbody tr:nth-of-type(odd) {
                background-color: #f9f9f9;
            }

            /* Đổi màu khi hover vào các hàng */
            table.table tbody tr:hover {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4"><h2>Manage <b>User</b></h2></div>
                            <div class="col-sm-4 searchh">
                                <form id="searchForm" action="searchUser" method="POST">
                                    <div class="d-flex align-items-center">
                                        <i class="material-icons mr-2">&#xE8B6;</i>
                                        <select id="searchType" name="searchType" class="form-control mr-2">
                                            <option value="userName">Search by Username</option>
                                            <option value="name">Search by Name</option>
                                            <option value="userId">Search by User ID</option>
                                            <option value="email">Search by Email</option>
                                            <option value="phoneNumber">Search by Phone Number</option>
                                            <option value="roleId">Search by Role</option>
                                        </select>
                                        <input type="text" id="searchKeyword" name="keyword" class="form-control mr-2" placeholder="Search&hellip;" required="" >
                                        <select id="roleIdSelect" name="roleId" class="form-control mr-2" style="display: none;">
                                            <c:forEach items="${roles}" var="o">
                                                <option value="${o.roleId}">${o.roleName}</option> 
                                            </c:forEach>
                                        </select>
                                        <input type="submit" class="btn btn-success" value="Search">
                                    </div>
                                    <div>
                                        <div id="error-message" style="color: red;"></div>
                                    </div>
                                </form>
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
                    <table id="userTable" class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>
                                    User ID
                                    <button class="btn btn-link btn-sm" onclick="sortTableByUserId()">
                                        <i class="fa fa-sort"></i>
                                    </button>
                                </th>
                                <th>User Name</th>
                                <th>Role Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Avatar</th>
                                <th>Name</th>
                                <th>Created By</th>
                                <th>Created Date</th>
                                <th>Last Updated By</th>
                                <th>Last Updated Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.users}" var="o">
                                <tr>
                                    <td>${o.userId}</td>
                                    <td>${o.userName}</td>
                                    <c:forEach items="${requestScope.roles}" var="r">
                                        <c:if test="${r.roleId eq o.roleId}">
                                            <td>${r.roleName}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td>${o.email}</td>
                                    <td>${o.phoneNumber}</td>
                                    <td><img src="${o.avatar}" alt="Avatar" style="max-width: 100px; max-height: 100px;"></td>
                                    <td>${o.name}</td>
                                    <td>${o.createdBy}</td>
                                    <td>${o.createdDate}</td>
                                    <td>${o.updatedBy}</td>
                                    <td>${o.lastUpdatedDate}</td>
                                    <td>
                                        <a href="editUser.jsp?userId=${o.userId}" class="edit" title="Edit" data-toggle="tooltip">
                                            <i class="material-icons">&#xE254;</i>
                                        </a>
                                        <a href="deleteUser?userId=${o.userId}" class="delete" title="Delete" data-toggle="tooltip">
                                            <i class="material-icons">&#xE872;</i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
                        <form action="createUser" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Create User</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>User Name</label>
                                    <input name="userName" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input name="password" type="password" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="role">User Role</label>
                                    <select name="roleId" class="form-control" required>
                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role.roleId}">${role.roleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input name="phoneNumber" type="text" class="form-control" onblur="validatePhonenumber(this)" required>
                                </div>
                                <div class="form-group">
                                    <label for="avatar">Avatar</label>
                                    <input id="avatarUrl" name="avatar" type="text" class="form-control" onchange="updateAvatarPreview()">
                                </div>
                                <div class="form-group">
                                    <img id="avatarPreview" src="" alt="Avatar Preview" style="max-width: 200px; max-height: 200px;">
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
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
    </body>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

        // Hàm validateSearchForm để kiểm tra giá trị nhập vào ô search
        function validateSearchForm() {
            const searchType = document.getElementById("searchType").value;
            const keyword = document.getElementById("searchKeyword").value;
            let isValid = true;
            let errorMessage = "";

            switch (searchType) {
                case "userId":
                    if (!/^\d+$/.test(keyword)) {
                        isValid = false;
                        errorMessage = "User ID must be a positive integer.";
                    }
                    break;
                case "email":
                    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                    if (!emailPattern.test(keyword)) {
                        isValid = false;
                        errorMessage = "Invalid email format.";
                    }
                    break;
                case "phoneNumber":
                    if (!/^\d{10}$/.test(keyword)) {
                        isValid = false;
                        errorMessage = "Phone number must be a 10-digit number.";
                    }
                    break;
            }

            // Hiển thị thông báo lỗi
            const errorMessageElement = document.getElementById("error-message");
            if (!isValid) {
                errorMessageElement.textContent = errorMessage;
                // Clear ô search và focus vào ô search sau khi thông báo lỗi
                document.getElementById("searchKeyword").value = "";
                document.getElementById("searchKeyword").focus();
            } else {
                // Xóa thông báo lỗi nếu giá trị hợp lệ
                errorMessageElement.textContent = "";
            }
            return isValid;
        }
        document.getElementById("searchKeyword").addEventListener("input", function () {
            validateSearchForm();
        });

        document.getElementById("searchType").addEventListener("change", function () {
            var searchType = this.value;
            var keywordInput = document.getElementById("searchKeyword");
            var keywordSelect = document.getElementById("roleIdSelect");

            if (searchType === "roleId") {
                keywordInput.style.display = "none";
                keywordInput.removeAttribute("required"); 
                keywordSelect.style.display = "block";
                keywordInput.setAttribute("name", "key");
                keywordSelect.setAttribute("name", "keyword"); 
            } else {
                keywordInput.style.display = "block";
                keywordInput.setAttribute("required", "required"); 
                keywordSelect.style.display = "none";
                keywordInput.setAttribute("name", "keyword");
            }
        });
    </script>
</html>
