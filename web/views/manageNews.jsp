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
        <title>Quản lý bài đăng</title>
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
        <!-- JavaScript Libraries -->
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
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;">
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
                                        <input id="valueSearch" type="text" class="form-control radius-md"placeholder="Tìm kiếm bằng tiêu đề hoặc nội dung...">
                                    </div>
                                    <div class="col-sm-8 createe">
                                        <a href="#createNewsModal" class="btn btn-success d-flex align-items-center" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Tạo Bài Viết Mới</span></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover table-bordered ">
                                <thead>
                                    <tr class="text-center">
                                        <th style="font-weight: bold; font-size: 14px;">ID</th>
                                        <th style="font-weight: bold; font-size: 14px;">Tiêu Đề</th>
                                        <th style="font-weight: bold; font-size: 14px;">Nội Dung</th>
                                        <th style="font-weight: bold; font-size: 14px;">Kết Luận</th>
                                        <th>  
                                            <select style="font-weight: bold; font-size: 14px;" class="form-select border-0" id="stateSelect" onchange="filterTable()">
                                                <option selected value="All">Tình Trạng</option>
                                                <c:forEach items="${sessionScope.getListState}" var="listState">
                                                    <option>${listState.stateName}</option>
                                                </c:forEach>
                                            </select>
                                        </th>
                                        <th>Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody id="newsTableBody">
                                    <c:forEach items="${sessionScope.getListNews}" var="n">
                                        <tr style="word-break: break-word">
                                            <td style="text-align: center">${n.newsId}</td>
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
                                            <td>${n.stateId.stateName}</td>
                                            <td style="text-align: center">
                                                <a href="#updateNews${n.newsId}" class="edit" title="Edit" data-toggle="modal"><i class="material-icons">&#xE254;</i></a>
                                                <a onclick="return confirmDelete(${n.newsId})" href = "deleteNews?newsId=${n.newsId}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <script>
                                function confirmDelete(newsId) {
                                    return confirm("Bạn đang xóa tin tức có ID = " + newsId + " ?");
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
                    <form id="createNewsForm" action="createNewNews" method="post" enctype="multipart/form-data" onsubmit="return validateForm('create')">
                        <div class="modal-header">						
                            <h4 class="modal-title">Tạo bài viết mới</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Tiêu Đề</label>
                                <textarea id="createTitle" name="title" class="form-control" required rows="2"></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Nội Dung</label>
                                <textarea id="createContent" name="content" class="form-control" rows="5" required></textarea>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Hình Ảnh</label>
                                <br>
                                <input id="createImage" type="file" name="image" accept="image/*" required><br>
                            </div>
                            <div class="form-group" style="word-break: break-word">
                                <label>Kết Luận</label>
                                <textarea id="createConclusion" name="conclusion" class="form-control" rows="5" required></textarea>
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


        <!--------------------------------------------------------------------------------------------------------------------------------------------->
        <c:forEach items="${sessionScope.getListNews}" var="n">
            <div id="updateNews${n.newsId}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="updateNewsForm${n.newsId}" action="updateNews" method="post" enctype="multipart/form-data" onsubmit="return validateForm('update', ${n.newsId})">
                            <div class="modal-header">						
                                <h4 class="modal-title">Cập Nhật Tin Tức</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <input name="newsId" class="form-control" value="${n.newsId}" type="hidden">
                                <div class="form-group">
                                    <label>Tiêu Đề</label>
                                    <textarea id="updateTitle${n.newsId}" name="title" class="form-control" required rows="2">${n.title}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Nội Dung</label>
                                    <textarea id="updateContent${n.newsId}" name="content" class="form-control" rows="5" required>${n.content}</textarea>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="currentImage" value="${n.image}">
                                    <label>Hình Ảnh</label><br>
                                    <img src="${n.image}" alt="Image" style="width:100px;height:auto;">
                                    <input id="updateImage${n.newsId}" type="file" name="image" accept="image/*">
                                </div>
                                <div class="form-group">
                                    <label>Kết Luận</label>
                                    <textarea id="updateConclusion${n.newsId}" name="conclusion" class="form-control" rows="5" required>${n.conclusion}</textarea>
                                </div>
                                <div class="form-group" id="state${n.newsId}">
                                    <label>Tình Trạng</label>
                                    <select name="stateId">
                                        <c:forEach items="${sessionScope.getListState}" var="listState">
                                            <option value="${listState.stateId}" 
                                                    <c:if test="${listState.stateId == n.stateId.stateId}">selected</c:if>
                                                    >${listState.stateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label>Người Thêm</label>
                                        <input value="${n.createBy}" readonly="" class="form-control">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Ngày Thêm</label>
                                        <input value="${n.createdDate}" readonly="" class="form-control">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label>Người Cập Nhật Cuối</label>
                                        <input value="${n.updateBy}" readonly="" class="form-control">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Ngày Cập Nhật Cuối</label>
                                        <input value="${n.lastUpdateDate}" readonly="" class="form-control">
                                    </div>    
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
        <script>
            function validateForm(action, newsId) {
                let title, content, conclusion, image;

                if (action === 'update') {
                    title = document.getElementById('updateTitle' + newsId).value.trim();
                    content = document.getElementById('updateContent' + newsId).value.trim();
                    conclusion = document.getElementById('updateConclusion' + newsId).value.trim();
                    image = document.getElementById('updateImage' + newsId).files[0];
                } else {
                    title = document.getElementById('createTitle').value.trim();
                    content = document.getElementById('createContent').value.trim();
                    conclusion = document.getElementById('createConclusion').value.trim();
                    image = document.getElementById('createImage').files[0];
                }

                if (title === "" || content === "" || conclusion === "") {
                    alert("Vui lòng không được để trống!!!");
                    return false;
                }

                if (image) {
                    const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];
                    if (!validImageTypes.includes(image.type)) {
                        alert("Vui lòng tải những ảnh có đuôi JPEG, PNG, GIF.");
                        return false;
                    }
                }

                return true;
            }
        </script>


        <!--//---------------------------------------Hiển thị thông báo---------------------------------------------------------->
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
                var stateValue = 'All'; // Giá trị mặc định cho dropdown state

                // Sự kiện input cho ô tìm kiếm
//                $('#valueSearch').on('input', function () {
//                    var valueSearch = $(this).val();
//                    // Gọi hàm thực hiện AJAX để tìm kiếm và cập nhật bảng tin tức
//                    updateNewsTable(valueSearch, stateValue);
//                });
                document.addEventListener('keydown', function (event) {
                    if (event.key === 'Enter') {
                        var searchText = $('#valueSearch').val().toLowerCase();
                        if (searchText.trim().length > 0) {
                            updateNewsTable(searchText, stateValue);
                        } else {
                            alert("Vui lòng nhập tiêu đề hoặc nội dung cần tìm kiếm.")
                        }
                    }
                });
                // Sự kiện change cho dropdown filter
                $('#stateSelect').change(function () {
                    stateValue = $('#stateSelect').val();
                    // Gọi hàm filter table để lọc và hiển thị dòng phù hợp trong bảng
                    filterTable();
                });
                // Hàm filter table
                function filterTable() {
                    var select = document.getElementById('stateSelect');
                    var selectedValue = select.value;
                    var table = document.querySelector('table.table');
                    var rows = table.querySelectorAll('tbody tr');

                    rows.forEach(row => {
                        var stateCell = row.querySelector('td:nth-child(5)');
                        if (selectedValue === 'All' || stateCell.textContent.includes(selectedValue)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }


                // Hàm AJAX để tìm kiếm và cập nhật bảng tin tức
                function updateNewsTable(valueSearch, stateValue) {
                    $.ajax({
                        url: "manageNews",
                        type: "GET",
                        data: {
//                            go: "search",
                            valueSearch: valueSearch,
                            state: stateValue
                        },
                        success: function (data) {
                            // Cập nhật bảng tin tức bằng kết quả từ AJAX
                            $('#newsTableBody').html($(data).find('#newsTableBody').html());
                            // Sau khi cập nhật bảng, cần cập nhật lại giá trị của dropdown
                            $('#stateSelect').val(stateValue);
                            // Hiển thị toast thông báo nếu có
                            showUpdateToast();
                        },
                        error: function () {
                            alert("Xảy ra lỗi trong quá trình tìm kiếm tin tức.");
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
                            toast.find('#toastMessage').text('Cập nhật tin tức thành công.');
                            toast.addClass('success').removeClass('error');
                            toast.toast('show'); // Hiển thị toast
                        } else if (updated === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Cập nhật tin tức không thành công!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show'); // Hiển thị toast
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
                            toast.find('#toastMessage').text('Tạo tin tức mới thành công.');
                            toast.addClass('success').removeClass('error');
                            toast.toast('show');
                        } else if (created === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Tạo tin tức không thành công!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show');
                        }

                    }
                });
                //delete
                $(document).ready(function () {
                    var deleted = '<%= request.getAttribute("deleted")%>';
                    if (deleted !== 'null' && deleted !== '') {
                        var toast = $('#toastNotification');
                        if (deleted === "true") {
                            toast.find('#toastTitle').text('Success');
                            toast.find('#toastMessage').text('Xóa tin tức thành công.');
                            toast.addClass('success').removeClass('error');
                            toast.toast('show');
                        } else if (deleted === "false") {
                            toast.find('#toastTitle').text('Error');
                            toast.find('#toastMessage').text('Xóa tin tức không thành công!');
                            toast.addClass('error').removeClass('success');
                            toast.toast('show');
                        }
                    }
                });
            })
                    ;

        </script>


    </body>
</html>
