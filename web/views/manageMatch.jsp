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
        <title>Quản Lý trận đấu</title>
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
            .error {
                color: red;
                font-size: 0.7em;
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
            th:nth-child(1), td:nth-child(1) {
                width: 5%;
            }
            th:nth-child(2), td:nth-child(2) {
                width: 12%;
            }
            th:nth-child(3), td:nth-child(3) {
                width: 12%;
            }
            th:nth-child(4), td:nth-child(4) {
                width: 15%;
            }
            th:nth-child(5), td:nth-child(5) {
                width: 15%;
            }
            th:nth-child(6), td:nth-child(6) {
                width: 15%;
            }
            th:nth-child(7), td:nth-child(7) {
                width: 16%;
            }
            th:nth-child(8), td:nth-child(8) {
                width: 10%;
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
            <%@include file="side-bar.jsp" %>
            <div class="content">
                <%@include file="dashboardHeader.jsp" %>

                <%-- Manage Table --%>
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">

                                    <div class="col-md-4">
                                        <input class="form-control radius-md" type="search" id="myInput" onkeyup="filterTable()" placeholder="Tìm kiếm theo tên đội bóng..." title="Điền tên đôi bóng">
                                    </div>
                                    <div class="col-md-8">
                                        <a type="button" href="#createMatchModal" class="btn btn-success m-2 float-right" data-toggle="modal"><i class="fa fa-plus-circle me-2"></i>Thêm trận đấu</a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Đội bóng 1</th>
                                        <th>Đội bóng 2</th>
                                        <th>Thời gian bắt đầu</th>
                                        <th>
                                            <select class="form-select border-0" id="seasonSelect" onchange="filterTable()">
                                                <option selected value="All">Tất cả mùa</option>
                                                <c:forEach items="${requestScope.seasons}" var="s">
                                                    <option value="${s.seasonName}">${s.seasonName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            <select class="form-select border-0" id="statusSelect" onchange="filterTable()">
                                                <option selected value="All">Tất cả trạng thái</option>
                                                <c:forEach items="${requestScope.statusList}" var="s">
                                                    <option value="${s.matchStatusName}">${s.matchStatusName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>
                                            <select class="form-select border-0" id="typeSelect" onchange="filterTable()">
                                                <option selected value="All">Tất cả loại trận đấu</option>
                                                <c:forEach items="${requestScope.types}" var="t">
                                                    <option value="${t.name}">${t.name}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody id="matches">
                                    <c:forEach items="${requestScope.matches}" var="o">
                                        <tr>
                                            <td>${o.matchId}</td>
                                            <td>${o.team1.clubName}</td>
                                            <td>${o.team2.clubName}</td>
                                            <td>${o.time}</td>
                                            <td>${o.season.seasonName}</td>
                                            <td>${o.status.matchStatusName}</td>
                                            <td>${o.type.name}</td>
                                            <td>
                                                <a onclick="update('${o.matchId}', '${o.team1.clubId}', '${o.team2.clubId}', '${o.time}', '${o.season.seasonId}', '${o.status.matchStatusId}', '${o.type.typeId}')" href="#updateMatchModal" class="edit" title="Edit" data-toggle="modal"><i class="fa fa-eye" style="color: gray;"></i></a>
                                                <a onclick="doDelete(${o.matchId})" href="#" class="delete" title="Cancel" data-toggle="tooltip"><i class="fa fa-times-circle"></i></a>
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

        <%-- create Modal --%>
        <div id="createMatchModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="createMatch" method="post" onsubmit="return validateForm()">
                        <div class="modal-header">
                            <h4 class="modal-title">Create Match</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>FC-1</label>
                                <select id="newFc1Id" name="fc1Id" placeholder="Select 1 club" class="form-select" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>FC-2 <span id="errorFC" class="error"></span></label>
                                <select id="newFc2Id" name="fc2Id" placeholder="Select 1 club" class="form-select" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Start Time <span id="datetimeError" class="error"></span></label>
                                <input id="datetimeInput" type="datetime-local" class="form-control" name="startTime" required>
                            </div>
                            <div class="form-group">
                                <label>Season</label>
                                <select name="season" placeholder="Select 1 season" class="form-select" required>
                                    <c:forEach items="${seasons}" var="season">
                                        <option value="${season.seasonId}">${season.seasonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match type</label>
                                <select name="type" placeholder="Select 1 type" class="form-select" required>
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


        <%-- update Modal --%>
        <div id="updateMatchModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateMatch" method="post" onsubmit="return validateForm2()">
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
                                <select id="fc1Id2" name="fc1Id" placeholder="Select 1 club" class="form-select" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>FC-2 <span id="errorFC2" class="error"></span></label>
                                <select id="fc2Id2" name="fc2Id" placeholder="Select 1 club" class="form-select" required>
                                    <c:forEach items="${footballClubs}" var="fc">
                                        <option value="${fc.clubId}">${fc.clubName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Start Time <span id="datetimeError2" class="error"></span></label>
                                <input id="datetimeInput2" type="datetime-local" class="form-control" name="startTime" required>
                            </div>
                            <div class="form-group">
                                <label>Season</label>
                                <select id="seasonId" name="season" placeholder="Select 1 season" class="form-select" required>
                                    <c:forEach items="${seasons}" var="season">
                                        <option value="${season.seasonId}">${season.seasonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match type</label>
                                <select id="typeId" name="type" placeholder="Select 1 type" class="form-select" required>
                                    <c:forEach items="${types}" var="type">
                                        <option value="${type.typeId}">${type.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Match Status</label>
                                <select id="statusId" name="status" placeholder="Select 1 status" class="form-select" required>
                                    <c:forEach items="${statusList}" var="status">
                                        <option value="${status.matchStatusId}">${status.matchStatusName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script>

                        $(document).ready(function () {
                            // Bắt sự kiện khi người dùng nhập liệu vào ô search
                            $("#searchInputForm").on("keyup", function () {
                                var searchValue = $(this).val(); // Lấy giá trị từ ô search

                                // Gửi yêu cầu Ajax
                                $.ajax({
                                    url: "manageMatch", // URL của Servlet xử lý Ajax (cần thay đổi nếu khác)
                                    type: "GET",

                                    data: {
                                        search: searchValue // Dữ liệu gửi đi là giá trị search
                                    },
                                    success: function (data) {
                                        // Cập nhật phần tử có id là footballClubs với dữ liệu trả về từ Ajax
                                        $("#matches").html($(data).find('#matches').html());
                                    }
                                });
                            });
                        });

                        function validateForm2() {
                            // Clear previous error messages
                            document.getElementById("errorFC2").innerText = "";
                            document.getElementById("datetimeError2").innerText = "";

                            // Get form values
                            var fc1Id2 = document.getElementById("fc1Id2").value;
                            var fc2Id2 = document.getElementById("fc2Id2").value;
                            var datetimeValue = Date(document.getElementById("datetimeInput2").value);
                            var datetimeValue_raw = datetimeValue;

                            var isValid = true;

                            // Validate football club IDs
                            if (fc1Id2 === fc2Id2) {
                                document.getElementById("errorFC2").innerText = "Football club must be different";
                                isValid = false;
                            }

                            // Validate datetime
                            for (var i = 0; i < invalidDateTimes2.length; i++) {
                                var startTimeList = invalidDateTimes2[i];
                                var endTimeList = new Date(startTimeList.getTime() + (300 * 60000)); // Thêm 300 phút

                                if (startTimeList !== datetimeValue_raw) {
                                    if (datetimeValue >= startTimeList && datetimeValue <= endTimeList) {
                                        document.getElementById("datetimeError2").innerText = "Invalid datetime";
                                        isValid = false;
                                        break; // Không hợp lệ, dừng việc submit form
                                    }
                                }

                            }

                            // Return the validity status
                            return isValid;
                        }

                        function validateForm() {
                            // Clear previous error messages
                            document.getElementById("errorFC").innerText = "";
                            document.getElementById("datetimeError").innerText = "";

                            // Get form values
                            var fc1Id = document.getElementById("newFc1Id").value;
                            var fc2Id = document.getElementById("newFc2Id").value;
                            var datetimeValue = new Date(document.getElementById("datetimeInput").value);

                            var isValid = true;

                            // Validate football club IDs
                            if (fc1Id === fc2Id) {
                                document.getElementById("errorFC").innerText = "Football club must be different";
                                return false;
                            }

                            // Validate datetime
                            for (var i = 0; i < invalidDateTimes.length; i++) {
                                var startTimeList = invalidDateTimes[i];
                                var endTimeList = new Date(startTimeList.getTime() + (300 * 60000)); // Thêm 300 phút

                                if (datetimeValue >= startTimeList && datetimeValue <= endTimeList) {
                                    document.getElementById("datetimeError").innerText = "Invalid datetime";
                                    isValid = false;
                                    break; // Không hợp lệ, dừng việc submit form
                                }
                            }

                            // Return the validity status
                            return isValid;
                        }


                        function filterTable() {
                            var input, filterName, seasonSelect, filterSeason, statusSelect, filterStatus, typeSelect, filterType, table, tr, td, i, j;
                            input = document.getElementById("myInput");
                            filterName = input.value.toUpperCase();
                            seasonSelect = document.getElementById("seasonSelect");
                            filterSeason = seasonSelect.value.toUpperCase();
                            statusSelect = document.getElementById("statusSelect");
                            filterStatus = statusSelect.value.toUpperCase();
                            typeSelect = document.getElementById("typeSelect");
                            filterType = typeSelect.value.toUpperCase();
                            table = document.querySelector("table");
                            tr = table.getElementsByTagName("tr");

                            for (i = 1; i < tr.length; i++) { // Bắt đầu từ 1 để bỏ qua hàng tiêu đề
                                tr[i].style.display = "none"; // Mặc định ẩn hàng

                                td = tr[i].getElementsByTagName("td");
                                if (td) {
                                    var match = true;

                                    // Kiểm tra tên đội bóng
                                    if (filterName !== "") {
                                        var found = false;
                                        for (j = 1; j <= 2; j++) { // FC-1 và FC-2
                                            if (td[j].textContent.toUpperCase().indexOf(filterName) > -1) {
                                                found = true;
                                                break;
                                            }
                                        }
                                        if (!found)
                                            match = false;
                                    }

                                    // Kiểm tra mùa giải
                                    if (filterSeason !== "ALL" && td[4].textContent.toUpperCase() !== filterSeason) {
                                        match = false;
                                    }

                                    // Kiểm tra trạng thái
                                    if (filterStatus !== "ALL" && td[5].textContent.toUpperCase() !== filterStatus) {
                                        match = false;
                                    }

                                    // Kiểm tra loại trận đấu
                                    if (filterType !== "ALL" && td[6].textContent.toUpperCase() !== filterType) {
                                        match = false;
                                    }

                                    if (match)
                                        tr[i].style.display = "";
                                }
                            }
                        }
                        $(document).ready(function () {
                            var updated = '<%= request.getAttribute("updated")%>';
                            if (updated !== 'null' && updated !== '') {
                                var toast = $('#toastNotification');
                                if (updated === "true") {
                                    toast.find('#toastTitle').text('Success');
                                    toast.find('#toastMessage').text('Match updated successfully.');
                                    toast.addClass('success').removeClass('error');
                                } else if (updated === "false") {
                                    toast.find('#toastTitle').text('Error');
                                    toast.find('#toastMessage').text('Failed to update match.');
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
                                    toast.find('#toastMessage').text('Match created successfully.');
                                    toast.addClass('success').removeClass('error');
                                } else if (created === "false") {
                                    toast.find('#toastTitle').text('Error');
                                    toast.find('#toastMessage').text('Failed to create match.');
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
                                    toast.find('#toastMessage').text('Match deleted successfully.');
                                    toast.addClass('success').removeClass('error');
                                } else if (deleted === "false") {
                                    toast.find('#toastTitle').text('Error');
                                    toast.find('#toastMessage').text('Failed to delete match.');
                                    toast.addClass('error').removeClass('success');
                                }
                                toast.toast('show');
                            }
                        });
        </script>
        <script type="text/javascript">

            function doDelete(matchId) {
            <c:forEach var="match" items="${matches}">
                <c:if test="${match.matchId == matchId}">
                alert("chão");
                </c:if>
            </c:forEach>
                if (confirm("Do you want to delete Match with id = " + matchId))
                    location.href = 'deleteMatch?matchId=' + matchId;
            }
            var excludeId = 1;
            function update(matchId, fc1Id, fc2Id, time, seasonId, statusId, typeId) {
                document.getElementById('matchId').value = matchId;
                setSelectedOption('fc1Id2', fc1Id);
                setSelectedOption('fc2Id2', fc2Id);
                setSelectedOption('seasonId', seasonId);
                setSelectedOption('statusId', statusId);
                setSelectedOption('typeId', typeId);
                document.getElementById('datetimeInput2').value = time;
                excludeId = matchId;
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

            const now = new Date().toISOString().slice(0, 16);
            document.getElementById('datetimeInput').setAttribute('min', now);
            document.getElementById('datetimeInput2').setAttribute('min', now);

            var invalidDateTimes = [];
            <c:forEach var="match" items="${matches}">
            invalidDateTimes.push(new Date("<c:out value="${match.time}" />"));
            </c:forEach>

            var invalidDateTimes2 = [];
            <c:forEach var="match" items="${matches}">
                <c:set var="jsExcludeId" value="${excludeId}" />
                <c:if test="${match.matchId != jsExcludeId}">
            invalidDateTimes2.push(new Date("<c:out value='${match.time}' />"));
                </c:if>
            </c:forEach>



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
