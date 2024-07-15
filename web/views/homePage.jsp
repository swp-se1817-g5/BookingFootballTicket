<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .section-header h2 {
                margin-bottom: 0;
            }
            @media (max-width: 768px) {
                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .card {
                margin-bottom: 1rem;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                text-align: center;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            .card-body {
                text-align: center;
            }
            .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 1rem;
            }
            .team-logos img {
                width: 100px;
                height: 100px;
                margin: 0 10px;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1rem;
                text-decoration: none;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }
            .nav-icon svg#cart {
                fill: white;
                width: 30px;
                height: auto;
                margin-top: 4px;
                margin-right: 5px;
            }
            .con_img {
                position: relative;
                text-align: center;
                color: white; /* Màu chữ */
            }

            .con_img img {
                width: 100%; /* Chiều ngang ảnh đầy màn hình */
                opacity: 0.7; /* Độ mờ của ảnh */
                z-index: 0; /* Đặt ảnh phía dưới */
            }

            .con_img .centered {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 2; /* Đặt chữ phía trên */
            }

            .con_img::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 0, 0, 0.5); /* Màu đỏ với độ mờ 0.5 */
                z-index: 1; /* Đặt lớp phủ lên trên ảnh */
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
    </head>
    <body>
        <div style="margin: 120px"><jsp:include page="header.jsp" /></div>
        <div>
            <img class="img-responsive img-fluid" src="images/banner/svd.jpg" alt="alt"/>
        </div>
        <div class="container">
            <div class="container mt-5">
                <!-- Trận Đấu Sắp Diễn Ra -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Trận Đấu Sắp Diễn Ra</h2>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.getListMatches}" begin="0" end="2" var="lm" varStatus="lmStatus">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <c:if test="${requestScope.allticket[lm.matchId - 1].availability > 0}">
                                        <div class="tickets-sold">Còn vé! Đặt ngay</div>
                                    </c:if>
                                    <c:if test="${requestScope.allticket[lm.matchId - 1].availability == 0}">
                                        <div class="tickets-sold">Hết vé! Vui lòng chọn trận khác</div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div class="team-logos justify-content-around">
                                        <img style=""  src="${lm.team1.img}" alt="${lm.team1.clubName}">
                                        <span>VS</span>
                                        <img src="${lm.team2.img}" alt="${lm.team2.clubName}">
                                    </div>
                                    <h5 class="card-title">${lm.season.seasonName}</h5>
                                    <p class="card-text">${lm.team1.clubName} VS ${lm.team2.clubName}</p>
                                    <p class="card-text">Sân vận động Mỹ Đình</p>
                                    <input type="datetime-local" value="${lm.time}" readonly style="border: none; background: none; text-align: center">
                                    <p class="card-text">${lm.type.name}</p>
                                    <a href="matchDetail?matchId=${lm.matchId}" class="book-now-btn">Xem Vé</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center mb-5">
                    <a href="publicListMatch" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="con_img">
                <img src="images/banner/bannerDoi.jpg" alt="">
                <div class="centered">
                    <h2>Tuyển tập các đội hình "Mạnh mẽ nhất"</h2>
                </div>
            </div>

            <div class="container mt-5">
                <!-- Các Đội Bóng Nổi Bật -->
                <div class="section-header justify-content-center ">
                    <h2 class="mb-3">Các Đội Bóng Nổi Bật</h2>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.getFootballClubs}" var="fb" end="3">
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="card">
                                <div class="text-center mt-1"><img src="${fb.img}" style="width: auto; height: 100px;" alt="Team"></div>
                                <div class="card-body">
                                    <h5 class="card-title">${fb.clubName}</h5>
                                    <a href="publicFootballClub?fcId=${fb.clubId}" class="btn btn-primary">Chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center mb-5">
                    <a href="publicListFootballClub" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="con_img">
                <img src="images/banner/bannerMuaGiai.jpg" alt="Ảnh của bạn">
                <div class="centered">
                    <h2>Cùng đón chờ một mùa giải mới thật bùng nổ và đầy hấp dẫn</h2>
                </div>
            </div>
            <div class="container mt-5">
                <!-- Các Tournament -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Các Mùa Giải</h2>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.getAllseason}" var="s" begin="0" end="3">
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">${s.seasonName}</h5>
                                    <p class="card-text">Thời gian bắt đầu : ${s.startDate}</p>
                                    <p class="card-text">Thời gian kết thúc : ${s.endDate}</p>
                                    <a href="publicListMatch?seasonId=${s.seasonId}" class="btn btn-primary">Xem Các Trận Đấu<i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center mb-5">
                    <a href="publicListTournment" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="con_img">
                <img src="images/banner/bannerTinTucMoi.jpg" alt="Ảnh của bạn">
                <div class="centered">
                    <h2>Tin tức về các trận bóng hấp dẫn đang chờ đón bạn</h2>
                </div>
            </div>
            <div class="container mt-5">
                <!-- Tin Tức -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Tin Tức Mới Nhất</h2>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.getListNews}" var="n" varStatus="status" end="7">
                        <div class="col-md-4 mb-4">
                            <a href="publicNewsDetails?newsId=${n.newsId}" class="text-decoration-none">
                                <div class="card">
                                    <img style="width: 414px" height="auto" src="${n.image}" class="card-img-top">
                                    <div class="card-body">
                                        <h4>
                                            <c:choose>
                                                <c:when test="${fn:length(n.title) > 50}">
                                                    ${fn:substring(n.title, 0, 50)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${n.title}
                                                </c:otherwise>
                                            </c:choose>
                                        </h4>
                                        </br>
                                        <c:choose>
                                            <c:when test="${fn:length(n.content) > 70}">
                                                ${fn:substring(n.content, 0, 70)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${n.content}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="text-center mb-5">
            <a href="publicListNews" class="btn btn-outline-secondary">Xem Thêm</a>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer">
        <jsp:include page="footer.jsp"/>
    </footer>

    <!-- Toast Notification -->
    <div class="toast" id="toastNotification" data-delay="3000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="mr-auto" id="toastTitle"></strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
        </div>
        <div class="toast-body" id="toastMessage"></div>
    </div>

    <script>
        $(document).ready(function () {
            var toast = $('#toastNotification');
            // Function to show toast notification
            function showToast(title, message, type) {
                toast.find('#toastTitle').text(title);
                toast.find('#toastMessage').text(message);
                toast.removeClass('success error').addClass(type);
                // Show the toast
                toast.toast('show');
            }
            // Check session attributes and show toast if set
        <% if (session.getAttribute("isRegister") != null && (boolean) session.getAttribute("isRegister")) { %>
            showToast('Thành công', 'Đăng ký thành công!', 'success');
            setTimeout(function () {
                toast.toast('hide');
            }, 3000); // 3000 milliseconds = 3 seconds
        <% session.removeAttribute("isRegister"); %>
        <% } %>

        <% if (session.getAttribute("changePassword") != null && (boolean) session.getAttribute("changePassword")) { %>
            showToast('Thành công', 'Đổi mật khẩu thành công!', 'success');
            setTimeout(function () {
                toast.toast('hide');
            }, 3000); // 3000 milliseconds = 3 seconds
        <% session.removeAttribute("changePassword"); %>
        <% } %>

        <% if (session.getAttribute("isFirstLogin") != null && (boolean) session.getAttribute("isFirstLogin")) { %>
            showToast('Thành công', 'Đăng nhập thành công!', 'success');
            setTimeout(function () {
                toast.toast('hide');
            }, 3000); // 3000 milliseconds = 3 seconds
        <% session.removeAttribute("isFirstLogin"); %>
        <% } %>

        <% if (session.getAttribute("resetPassword") != null && (boolean) session.getAttribute("resetPassword")) { %>
            showToast('Thành công', 'Đặt lại mật khẩu thành công!', 'success');
            setTimeout(function () {
                toast.toast('hide');
            }, 3000); // 3000 milliseconds = 3 seconds
        <% session.removeAttribute("resetPassword"); %>
        <% }%>

        <% if (session.getAttribute("transResult") != null) {%>
            var transResult = <%= session.getAttribute("transResult")%>;
            if (transResult) {
                showToast('Thành công', 'Giao dịch thành công!', 'success');
            } else {
                showToast('Thất bại', 'Giao dịch thất bại!', 'error');
            }
            setTimeout(function () {
                toast.toast('hide');
            }, 5000); // 3000 milliseconds = 3 seconds
        <% session.removeAttribute("transResult"); %>
        <% }%>
        });
    </script>
</body>