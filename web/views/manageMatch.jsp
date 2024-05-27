<%-- 
    Document   : manageMatch
    Created on : May 23, 2024, 1:08:23 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div id="createMatchModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="createMatch" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Create Match</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>FC-1</label>
                                <select name="fc1Id" placeholder="Select 1 club" class="form-control" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>FC-2</label>
                                <select name="fc2Id" placeholder="Select 1 club" class="form-control" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Start Time</label>
                                <input type="datetime-local" class="form-control" name="startTime" required>
                            </div>
                            <div class="form-group">
                                <label>Season</label>
                                <select name="season" placeholder="Select 1 season" class="form-control" required>
                                    <c:forEach items="${seasons}" var="season">
                                        <option value="${season.seasonId}">${season.seasonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match type</label>
                                <select name="type" placeholder="Select 1 type" class="form-control" required>
                                    <c:forEach items="${types}" var="type">
                                        <option value="${type.typeId}">${type.name}</option>
                                    </c:forEach>
                                </select>
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
        <div class="container-xll">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4"><h2>Match <b>Details</b></h2></div>

                            <div class="col-sm-4 searchh">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" class="form-control" placeholder="Search&hellip;">
                                </div>
                            </div>
                            <div class="col-sm-4 createe">
                                <a href="#createMatchModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Match</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>FC-1</th>
                                <th>FC-2</th>
                                <th>Start time</th>
                                <th>Season</th>
                                <th>Status</th>
                                <th>Type</th>
                                <th>Stadium</th>
                                <th>Create By</th>
                                <th>Create Date</th>
                                <th>Last Update By</th>
                                <th>Last Update Date</th>
                                <th>Actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.matches}" var="o">
                                <tr>
                                    <td>${o.matchId}</td>
                                    <td>${o.team1.clubName}</td>
                                    <td>${o.team2.clubName}</td>
                                    <td>${o.time}</td>
                                    <td>${o.season.seasonName}</td>
                                    <td>${o.status.matchStatusName}</td>
                                    <td>${o.type.name}</td>
                                    <td>${o.stadiumImg}</td>
                                    <td>${o.createdBy}</td>
                                    <td>${o.createdDate}</td>
                                    <td>${o.updatedBy}</td>
                                    <td>${o.lastUpdatedDate}</td>
                                    <td>
                                        <a onclick="update('${o.matchId}', '${o.team1.clubId}', '${o.team2.clubId}', '${o.time}', '${o.season.seasonId}', '${o.status.matchStatusId}', '${o.type.typeId}')" href="#updateMatchModal" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                        <a onclick="doDelete(${o.matchId})" href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>  
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="updateMatchModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateStand" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Match</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Match ID</label>
                                <input id="matchId" name="matchId" readonly type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>FC-1</label>
                                <select id="fc1Id" name="fc1Id" placeholder="Select 1 club" class="form-control" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>FC-2</label>
                                <select id="fc2Id" name="fc2Id" placeholder="Select 1 club" class="form-control" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Start Time</label>
                                <input id="startTime" type="datetime-local" class="form-control" name="startTime" required>
                            </div>
                            <div class="form-group">
                                <label>Season</label>
                                <select id="seasonId" name="season" placeholder="Select 1 season" class="form-control" required>
                                    <c:forEach items="${seasons}" var="season">
                                        <option value="${season.seasonId}">${season.seasonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match type</label>
                                <select id="typeId" name="type" placeholder="Select 1 type" class="form-control" required>
                                    <c:forEach items="${types}" var="type">
                                        <option value="${type.typeId}">${type.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match Status</label>
                                <select id="statusId" name="status" placeholder="Select 1 status" class="form-control" required>
                                    <c:forEach items="${statusList}" var="status">
                                        <option value="${status.matchStatusId}">${status.matchStatusName}</option>
                                    </c:forEach>
                                </select>
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

        <div class="toast" id="updateToast" data-delay="3000">
            <div class="toast-header">
                <strong class="mr-auto" id="toastTitle"></strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
            </div>
            <div class="toast-body" id="toastMessage"></div>
        </div>

        <script>
            $(document).ready(function () {
                var updated = '<%= request.getAttribute("updated") %>';
                if (updated !== 'null' && updated !== '') {
                    var toast = $('#updateToast');
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

            $(document).ready(function () {
                var created = '<%= request.getAttribute("created_match") %>';
                if (created !== 'null' && created !== '') {
                    var toast = $('#updateToast');
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

        </script>
        <script type="text/javascript">
            function doDelete(matchId) {
                if (confirm("Do you want to delete Match with id = " + matchId))
                    location.href = 'deleteMatch?matchId=' + matchId;
            }
            function update(matchId, fc1Id, fc2Id, time, seasonId, statusId, typeId) {
                document.getElementById('matchId').value = matchId;
                setSelectedOption('fc1Id', fc1Id);
                setSelectedOption('fc2Id', fc2Id);
                setSelectedOption('seasonId', seasonId);
                setSelectedOption('statusId', statusId);
                setSelectedOption('typeId', typeId);
                document.getElementById('startTime').value = time;
            }

            function setSelectedOption(selectId, valueToSelect) {
                var selectElement = document.getElementById(selectId);
                var options = selectElement.options;
                for (var i = 0; i < options.length; i++) {
                    if (options[i].value === valueToSelect) {
                        options[i].selected = true;
                        break;
                    }
                }
            }
        </script>

    </body>
</html>
