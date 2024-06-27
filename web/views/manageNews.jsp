<%-- 
Document   : manageNews
Created on : May 23, 2024, 12:20:34 PM
Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
            th:nth-child(1), td:nth-child(1) {
                width: 5%;
            }
            th:nth-child(2), td:nth-child(2) {
                width: 20%;
            }
            th:nth-child(3), td:nth-child(3) {
                width: 20%;
            }
            th:nth-child(4), td:nth-child(4) {
                width: 20%;
            }
            th:nth-child(5), td:nth-child(5) {
                width: 15%;
            }
            th:nth-child(6), td:nth-child(6) {
                width: 10%;
            }
            th:nth-child(7), td:nth-child(7) {
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

            <!-- Sidebar Start -->
            <jsp:include page="side-bar.jsp"></jsp:include>
                <!-- Sidebar End -->
                <div class="content">
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <input id="valueSearch" type="text" class="form-control radius-md"placeholder="Search...">
                                    </div>
                                    <div class="col-sm-8 createe">
                                        <a href="#createNewsModal" class="btn btn-success d-flex align-items-center" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Create News</span></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                    <tr class="text-center">
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th>Conclusion</th>
                                        <th>
                                            <select class="form-select border-0" id="statusSelect" onchange="filterTable()">
                                                <option selected value="All">All Status</option>
                                                <c:forEach items="${sessionScope.getListStatus}" var="listStatus">
                                                    <option>${listStatus.statusName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>  
                                            <select class="form-select border-0" id="stateSelect" onchange="filterTable()">
                                                <option selected value="All">All State</option>
                                                <c:forEach items="${sessionScope.getListState}" var="listState">
                                                    <option>${listState.stateName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="newsTableBody">
                                    <c:forEach items="${sessionScope.getListNews}" var="n" varStatus="status">
                                        <tr style="word-break: break-word">
                                            <td>${status.count}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(n.title) > 30}">
                                                        ${fn:substring(n.title, 0, 30)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${n.title}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(n.content) > 50}">
                                                        ${fn:substring(n.content, 0, 50)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${n.content}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(n.conclusion) > 50}">
                                                        ${fn:substring(n.conclusion, 0, 50)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${n.conclusion}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${n.statusId.statusName}</td>
                                            <td>${n.stateId.stateName}</td>
                                            <td>
                                                <a href="#viewDetailsNews${n.newsId}" class="view" title="View" data-toggle="modal"><i class="material-icons">&#xE417;</i></a>
                                                <a href="#updateNews${n.newsId}" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                                <a onclick="return confirmDelete(${n.newsId})" href = "deleteNews?newsId=${n.newsId}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <script>
                                function confirmDelete(newsId) {
                                    return confirm("Are you sure want to delete newsId = " + newsId + " ?");
                                }
                            </script>
                        </div>
                    </div> 
                </div>      
            </div>      
        </div>      

        <div id="createNewsModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="createNewNews" method="post" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Create News</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required rows="2"></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Content</label>
                                <textarea name="content" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Conclusion</label>
                                <textarea name="conclusion" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Image</label>
                                <br>
                                <input type="file" name="image" required=""><br>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Conclusion</label>
                                <textarea name="conclusion" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="display: flex; align-items: center; gap: 10px;">
                                <label>State</label>
                                <input name="stateId" type="radio" required checked value="2">Show
                                <input name="stateId" type="radio" required value="1">Hide
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
                                <label>News ID</label>
                                <input name="newsId" class="form-control" value="${n.newsId}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.title}</p>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.content}</p>
                            </div>
                            <div class="form-group">
                                <label>Image</label><br>
                                <img src="${n.image}" alt="Image" style="width:100px;height:auto;">
                            </div>
                            <div class="form-group">
                                <label>Conclusion</label>
                                <p style="border: 1px solid #ccc; padding: 10px; background-color: #e9ecef; border-radius: 9px">${n.conclusion}</p>
                            </div>
                            <div class="form-group">
                                <label>Create Date</label>
                                <input type="datetime-local" name="createDate" class="form-control" value="${n.createdDate}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Create By</label>
                                <input name="createBy" class="form-control" value="${n.createBy}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Last Update Date</label>
                                <input type="datetime-local" name="lastUpdateDate" class="form-control" style="border: none" value="${n.lastUpdateDate}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Update By</label>
                                <input name="updateBy" class="form-control" value="${n.updateBy}" readonly>
                            </div>
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
                        <form action="updateNews" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update News</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <input name="newsId" class="form-control" value="${n.newsId}" type="hidden">
                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="title" class="form-control" value="${n.title}">
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <input name="content" class="form-control" value="${n.content}">
                                </div>
                                <div class="form-group">
                                    <label>Conclusion</label>
                                    <input name="conclusion" class="form-control" value="${n.conclusion}">
                                </div>
                                <div class="form-group">
                                    <label>Image</label><br>
                                    <img src="${n.image}" alt="Image" style="width:100px;height:auto;">
                                </div>
                                <div class="form-group" style="word-break: break-word">
                                    <input type="file" name="image">
                                    <input type="hidden" name="currentImage" value="${n.image}">
                                </div>
                                <div class="form-group">
                                    <label>State</label>
                                    <select name="stateId">
                                        <c:forEach items="${sessionScope.getListState}" var="listState">
                                            <option value="${listState.stateId}" ${ listState.stateName eq n.stateId.stateName ? "selected" : ""}>${listState.stateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="statusId">
                                        <c:forEach items="${sessionScope.getListStatus}" var="listStatus">
                                            <option value="${listStatus.statusId}" ${listStatus.statusName eq n.statusId.statusName ? "selected" : ""}>${listStatus.statusName}</option>
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
        </c:forEach>
        <div class="toast" id="toastNotification" data-delay="3000">
            <div class="toast-header">
                <strong class="mr-auto" id="toastTitle"></strong>
            </div>
            <div class="toast-body" id="toastMessage"></div>
        </div>
        <script>
            $(document).ready(function () {
                var statusValue = 'All'; // Giá trị mặc định cho dropdown status
                var stateValue = 'All';  // Giá trị mặc định cho dropdown state

                // Sự kiện input cho ô tìm kiếm
                $('#valueSearch').on('input', function () {
                    var valueSearch = $(this).val();
                    // Gọi hàm thực hiện AJAX để tìm kiếm và cập nhật bảng tin tức
                    updateNewsTable(valueSearch, statusValue, stateValue);
                });

                // Sự kiện change cho dropdown filter
                $('#statusSelect, #stateSelect').change(function () {
                    statusValue = $('#statusSelect').val();
                    stateValue = $('#stateSelect').val();
                    // Gọi hàm filter table để lọc và hiển thị dòng phù hợp trong bảng
                    filterTable();
                });

                // Hàm filter table
                function filterTable() {
                    $('#newsTableBody tr').each(function () {
                        var statusText = $(this).find('td:eq(4)').text().trim(); // Lấy text của cột Status (index 3)
                        var stateText = $(this).find('td:eq(5)').text().trim();  // Lấy text của cột State (index 4)

                        var showRow = (statusValue === "All" || statusText === statusValue) &&
                                (stateValue === "All" || stateText === stateValue);

                        $(this).toggle(showRow);
                    });
                }

                // Hàm AJAX để tìm kiếm và cập nhật bảng tin tức
                function updateNewsTable(valueSearch, statusValue, stateValue) {
                    $.ajax({
                        url: "manageNews",
                        type: "GET",
                        data: {
//                            go: "search",
                            valueSearch: valueSearch,
                            status: statusValue,
                            state: stateValue
                        },
                        success: function (data) {
                            // Cập nhật bảng tin tức bằng kết quả từ AJAX
                            $('#newsTableBody').html($(data).find('#newsTableBody').html());
                            // Sau khi cập nhật bảng, cần cập nhật lại giá trị của dropdown
                            $('#statusSelect').val(statusValue);
                            $('#stateSelect').val(stateValue);
                            // Hiển thị toast thông báo nếu có
                            showUpdateToast();
                        },
                        error: function () {
                            alert("Error occurred while searching for news.");
                        }
                    });
                }

                // Hàm hiển thị toast thông báo
                //update
                $(document).ready(function () {
                    var updated = '<%= request.getAttribute("updated")%>';
                    if (updated !== 'null' && updated !== '') {
                        var toast = $('#toastNotification');
                        if (updated === "true") {
                            toast.find('#toastTitle').text('Success');
                            toast.find('#toastMessage').text('News updated successfully.');
                            toast.addClass('success').removeClass('error');
                        } else if (updated === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Failed to update News!');
                            toast.addClass('error').removeClass('success');
                        }
                    }
                });

                //create
                $(document).ready(function () {
                    var created = '<%= request.getAttribute("created")%>';
                    if (created !== 'null' && created !== '') {
                        var toast = $('#toastNotification');
                        if (created === "true") {
                            toast.find('#toastTitle').text('Success');
                            toast.find('#toastMessage').text('News created successfully.');
                            toast.addClass('success').removeClass('error');
                        } else if (created === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Failed to create News!');
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
                            toast.find('#toastMessage').text('News deleted successfully.');
                            toast.addClass('success').removeClass('error');
                        } else if (deleted === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Failed to delete News!');
                            toast.addClass('error').removeClass('success');
                        }
                        toast.toast('show');
                    }
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
    </body>
</html>
