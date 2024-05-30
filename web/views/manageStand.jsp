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
        <div class="container-fluid">



            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4"><h2>Stand <b>Management</b></h2></div>

                            <div class="col-sm-4 searchh">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" class="form-control" placeholder="Search by name&hellip;">
                                </div>
                            </div>
                            <div class="col-sm-4 createe">
                                <a href="#createStandModal" class="btn btn-success"  data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Create Stand</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Stand Name</th>
                                <th>Price<i class="fa "></i></th>
                                <th>Quantity<i class="fa "></i></th>
                                <th>Created By</th>
                                <th>Created Date</th>
                                <th>Last Updated By<i class="fa "></i></th>
                                <th>Last Updated Date<i class="fa "></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.stands}" var="o">
                                <tr>
                                    <td>${o.standId}</td>
                                    <td>${o.standName}</td>
                                    <td>${o.price}</td>
                                    <td>${o.quantity}</td>
                                    <td>${o.createdBy}</td>
                                    <td>${o.createdDate}</td>
                                    <td>${o.updatedBy}</td>
                                    <td>${o.lastUpdatedDate}</td>
                                    <td>
                                        <a onclick="update('${o.standId}', '${o.standName}', '${o.price}', '${o.quantity}')"     href="#updateStandModal" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                        <a onclick="doDelete(${o.standId})" href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <!--                    <div class="clearfix">
                                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                            <ul class="pagination">
                                                <li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                                                <li class="page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                                            </ul>
                                        </div>-->
                </div>

                <div id="createStandModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="createStand" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Create Stand</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">	
                                    <div class="form-group">
                                        <label>Stand Name</label>
                                        <input name="standName" type="text" class="form-control" maxlength="50" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price (VND)</label>
                                        <input name="price" type="number" min="0" max="10000000" step="any" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity (Seat)</label>
                                        <input name="quantity" type="number" class="form-control" min="0" max="10000" step="1" required>
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
                <div id="updateStandModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="updateStand" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Update Stand</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Stand ID</label>
                                        <input id="standId" name="standId" readonly type="number" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Stand Name</label>
                                        <input id="standName" name="standName" maxlength="50" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price (VND)</label>
                                        <input id="price" name="price" type="number" min="0" max="10000000" step="any" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity (Seat)</label>
                                        <input id="quantity" name="quantity" type="number" class="form-control" min="0" max="10000" step="1" required>
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
        <script type="text/javascript">
            function doDelete(standId) {
                if (confirm("Do you want to delete stand with id = " + standId))
                    location.href = 'deleteStand?standId=' + standId;
            }
            function update(standId, standName, price, quantity) {
                document.getElementById('standId').value = standId;
                document.getElementById('standName').value = standName;
                document.getElementById('price').value = price;
                document.getElementById('quantity').value = quantity;
            }
        </script>
    </body>
</html>
