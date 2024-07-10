<%-- 
    Document   : publicNewsDetails
    Created on : Jul 7, 2024, 8:10:21 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết bài viết</title>
        <!-- Link CSS của Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Thiết lập padding để màn hình đẹp mắt */
            body {
                padding: 20px;
            }
            /* Phần nội dung chính bài viết */
            .main-content {
                margin-bottom: 20px;
            }
            /* Phần danh sách tin tức liên quan */
            .related-news {
                background-color: #f8f9fa;
                border: 1px solid #ddd;
                padding: 10px;
            }
            .related-news ul {
                list-style-type: none;
                padding: 0;
            }
            .related-news li {
                margin-bottom: 10px;
            }
            .related-news a {
                color: #333;
                text-decoration: none;
            }
            .related-news a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 130px">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 main-content">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title">${newsDetails.title}</h1>
                            <p class="card-text">${newsDetails.content}</p>
                            <div style="text-align: center;">
                                <img style="width: 65rem" src="${newsDetails.image}" class="card-img-top" alt="Image">
                            </div>
                            </br>
                            <p class="card-text">${newsDetails.conclusion}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 related-news">
                    <h2>Tin tức liên quan</h2>
                    <c:forEach var="n" items="${getListNews}">
                        <a href="publicNewsDetails?newsId=${n.newsId}" >
                            <div class="news-item">
                                <h5 style="color: black" class="font-weight-bold">
                                    <c:choose>
                                        <c:when test="${fn:length(n.title) > 50}">
                                            ${fn:substring(n.title, 0, 50)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${n.title}
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                                <p style="color: black">
                                    <c:choose>
                                        <c:when test="${fn:length(n.content) > 100}">
                                            ${fn:substring(n.content, 0, 100)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${n.content}
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p style="color: black">
                                    <input type="datetime-local" value="${n.postOn}" readonly="" style="border: none; background: #F8F9FA">
                                </p>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <footer class="footer">
            <jsp:include page="footer.jsp"/>
        </footer>
        <!-- Script của Bootstrap -->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

