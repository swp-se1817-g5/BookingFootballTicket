<%-- 
    Document   : publicListMatch
    Created on : Jul 7, 2024, 4:23:04 PM
    Author     : nguye
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>News List</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <style>
            .news-item {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ccc;
            }
            .sidebar {
                position: sticky;
                top: 20px;
                padding: 15px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px"><jsp:include page="header.jsp"/></div>
        <div class="container">
            <div class="row">
                <!-- Filter section -->
                <div class="col-md-3 mt-5">
                    <form action="publicListNews">
                        <div class="sidebar">
                            <div class="form-group">
                                <input id="searchInput" name="valueSearch" type="text" value="${valueSearch}" class="form-control radius-md" placeholder="Tìm kiếm với tiêu đề hoặc nội dung...">
                            </div>
                            <div class="form-group">
                                <label for="dateFrom">Từ ngày</label>
                                <input id="dateStart" type="date" class="form-control" name="valueStartDate" value="${valueStartDate}">
                            </div>
                            <div class="form-group">
                                <label for="dateTo">Đến ngày</label>
                                <input id="dateEnd" type="date" class="form-control" name="valueEndDate" value="${valueEndDate}">
                            </div>
                            <button id="filterBtn" class="btn btn-primary" style="width: 100%">Lọc<i class="bi bi-filter btn-icon"></i></button>
                            <button id="resetBtn" type="button" class="btn btn-secondary" style="width: 100%; margin-top: 10px;">Đặt lại<i class="bi bi-arrow-counterclockwise btn-icon"></i></button>
                        </div>
                    </form>
                </div>
                <!-- News list section -->
                <div class="col-md-9 p-3">
                    <h2 class="text-center mb-5">Danh sách tin tức</h2>
                    <c:forEach var="n" items="${getListNews}">
                        <div class="news-item">
                            <a href="publicNewsDetails?newsId=${n.newsId}" class=" text-decoration-none">
                                <h5 style="color: black" class="font-weight-bold">
                                    <c:choose>
                                        <c:when test="${fn:length(n.title) > 150}">
                                            ${fn:substring(n.title, 0, 150)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${n.title}
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                            </a>
                            <p style="color: black">
                                <c:choose>
                                    <c:when test="${fn:length(n.content) > 250}">
                                        ${fn:substring(n.content, 0, 250)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${n.content}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p style="color: black">
                                ${n.getPostOnConverted()}
                            </p>
                        </div>
                    </c:forEach>
                    <!-- Add more news items as needed -->
                </div>
            </div>
        </div>
        <footer class="footer">
            <jsp:include page="footer.jsp"/>
        </footer>
        <script>
            document.getElementById('resetBtn').addEventListener('click', function () {
                document.getElementById('searchInput').value = '';
                document.getElementById('dateStart').value = '';
                document.getElementById('dateEnd').value = '';
            });

            document.getElementById('dateStart').addEventListener('change', function () {
                var startDate = document.getElementById('dateStart').value;
                document.getElementById('dateEnd').setAttribute('min', startDate);
            });

            document.getElementById('dateEnd').addEventListener('change', function () {
                var endDate = document.getElementById('dateEnd').value;
                document.getElementById('dateStart').setAttribute('max', endDate);
            });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
