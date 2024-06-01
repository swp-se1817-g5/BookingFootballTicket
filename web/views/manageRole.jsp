<%-- 
    Document   : manageRole
    Created on : May 26, 2024, 10:53:13 AM
    Author     : Vinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Role</title>
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
            table.table tbody tr:hover {
                background-color: #f2f2f2;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4"><h2>Manage <b>Role</b></h2></div>

                            <div class="col-sm-4 searchh">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" class="form-control" placeholder="Search by name&hellip;">
                                </div>
                            </div>
                            <div class="col-sm-4 createe">
                                <a href="#createRoleModal" class="btn btn-success"  data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Role</span></a>
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
                                <th>Role ID</th>
                                <th>Role Name</th>
                                <th>Created By</th>
                                <th>Created Date</th>
                                <th>Last Updated By<i class="fa "></i></th>
                                <th>Last Updated Date<i class="fa "></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.roles}" var="r">
                                <tr>
                                    <td>${r.roleId}</td>
                                    <td>${r.roleName}</td>
                                    <td>${r.createBy}</td>
                                    <td>${r.createdDate}</td>
                                    <td>${r.updatedBy}</td>
                                    <td>${r.lastUpdatedDate}</td>
                                    <td>
                                        <a href="editRole.jsp?roleId=${r.roleId}" class="edit" title="Edit" data-toggle="tooltip">
                                            <i class="material-icons">&#xE254;</i>
                                        </a>
                                        <a href="deleteRole?roleId=${r.roleId}" class="delete" title="Delete" data-toggle="tooltip">
                                            <i class="material-icons">&#xE872;</i>

                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <strong>${requestScope.roles.size()}</strong> out of <strong>${noOfRecords}</strong> entries</div>
                        <ul class="pagination">
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
                </div>

                <div id="createRoleModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="createRole" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Create Role</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Role Name</label>
                                        <input name="roleName" type="text" class="form-control" required>
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
    </body>
</html>

