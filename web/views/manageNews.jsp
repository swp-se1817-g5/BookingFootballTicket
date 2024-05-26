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
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4"><h2>Manage <b>News</b></h2></div>

                            <div class="col-sm-4 searchh">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" class="form-control" placeholder="Search&hellip;">
                                </div>
                            </div>

                            <div class="col-sm-4 createe">
                                <a href="#createNewsModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New News</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>News ID</th>
                                <th>Team 1</th>
                                <th>Team 2</th>
                                <th>Title</th>
                                <th>Content</th>
                                <th>Time</th>
                                <th>Status</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${ms != null}">
                            <div style="color: green; display: flex; align-items: center;">
                                <span style="margin-right: 5px;" class="bi bi-check-circle"></span>
                                ${ms}
                            </div>
                        </c:if>
                        <c:if test="${err != null}">
                            <div style="color: red; display: flex; align-items: center;">
                                <span style="margin-right: 5px;" class="bi bi-check-circle"></span>
                                ${err}
                            </div>
                        </c:if>
                        <c:forEach items="${sessionScope.getListNews}" var="n" varStatus="status">
                            <c:if test="${n.status!=0}">
                                <c:set var="m" value="${sessionScope.getListMatch[status.index]}" />
                                <tr>
                                    <td>${n.newsId}</td>
                                    <td>${m.team1.clubName}</td>
                                    <td>${m.team2.clubName}</td>
                                    <td>${n.title}</td>
                                    <td>${n.content}</td>
                                    <td>${m.time}</td>
                                    <c:if test="${n.status==1}">
                                        <td>Hide</td>
                                    </c:if>
                                    <c:if test="${n.status==2}">
                                        <td>Show</td>
                                    </c:if>
                                    <td>
                                        <a href="#viewDetailsNews${n.newsId}" class="view" title="View" data-toggle="modal"><i class="material-icons">&#xE417;</i></a>
                                        <a href="#updateNews${n.newsId}" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                        <a onclick="return confirmDelete(${n.newsId})"class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    <script>
                        function confirmDelete(newsId) {
                            confirm("Are you sure you want to delete newsId = " + newsId);
                            location.href = "deleteNews?newsId=" + newsId;
                        }
                    </script>


                    <!--------------------------------------------------------------------------------------------------------------------------------------------->
                    <div id="createNewsModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="createNewNews" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Create News</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Select Match</label>
                                            <select name="matchId" id="matchIdSelect" class="form-control" onchange="updateTime()">
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.MatchIdNotInNews}">
                                                        <c:forEach items="${sessionScope.MatchIdNotInNews}" var="mni">
                                                            <option  value="${mni.matchId}">${mni.team1.clubName} - ${mni.team2.clubName}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="">Don't have any match</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Time</label>
                                            <c:forEach items="${sessionScope.MatchIdNotInNews}" var="mni">
                                                <input name="matchId" class="form-control" value="${mni.time}" readonly>
                                            </c:forEach>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input name="title" type="text"  class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Content</label>
                                            <input name="content" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group" style="display: flex; align-items: center; gap: 10px;">
                                            <label>Status</label>
                                            <input name="status" type="radio" required checked value="2">Show
                                            <input name="status" type="radio" required value="1">Hide
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
                    <script>
                        function updateTime() {
                            var matchId = document.getElementById("matchIdSelect").value;
                            var time
                        }

                    </script>
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
                                            <label>User ID</label>
                                            <input name="userId" class="form-control" value="${n.userId.userId}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Match ID</label>
                                            <input name="matchId" class="form-control" value="${n.matchId.matchId}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Create Date</label>
                                            <input name="createDate" class="form-control" value="${n.createdDate}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Create By</label>
                                            <input name="createBy" class="form-control" value="${n.createBy}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Update Date</label>
                                            <input name="lastUpdateDate" class="form-control" value="${n.lastUpdateDate}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Update By</label>
                                            <input name="updateBy" class="form-control" value="${n.updateBy}" readonly>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
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
                                    <form action="updateNews" method="post">
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
                                                <label>Status</label>
                                                <input name="status" type="radio" required value="2" ${n.status == 2 ? 'checked' :''}>Show
                                                <input name="status" type="radio" required value="1" ${n.status == 1 ? 'checked' :''}>Hide
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
            </div>  
        </div>   
    </body>
</html>
