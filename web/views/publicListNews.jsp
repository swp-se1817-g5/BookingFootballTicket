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
        <style>
            .news-item {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 160px"><jsp:include page="header.jsp"/></div>
        <div class="container-fluid">
            <div class="row">
                <!-- Filter section -->
                <div class="col-md-2 bg-light p-3">
                    <h4>Tìm kiếm</h4>
                    <form action="publicListNews">
                        <div class="form-group">
                            <input name="valueSearch" type="text" value="${valueSearch}" class="form-control radius-md"placeholder="Tìm kiếm với tiêu đề hoặc nội dung...">
                        </div>
                        <button type="submit" class="btn btn-primary">Tìm</button>
                    </form>
                    </br>
                    <h4>Bộ Lọc</h4>
                    <form action="publicListNews">
                        <div class="form-group">
                            <label for="date">Đăng từ ngày</label>
                            <input type="date" class="form-control" name="valueFilterPostOn" required="" value="${valuePostOn}">
                        </div>
                        <button type="submit" class="btn btn-primary">Apply</button>
                    </form>
                </div>
                <!-- News list section -->
                <div class="col-md-10 p-3">
                    <h2 class="text-center mb-5">Danh sách tin tức</h2>
                    <c:forEach var="n" items="${getListNews}">
                        <a href="publicNewsDetails?newsId=${n.newsId}" >
                            <div class="news-item">
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
                                    <input type="datetime-local" value="${n.postOn}" readonly="" style="border: none">
                                </p>
                            </div>
                        </a>
                    </c:forEach>
                    <!-- Add more news items as needed -->
                </div>
            </div>
        </div>
        <footer class="footer">
            <jsp:include page="footer.jsp"/>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

