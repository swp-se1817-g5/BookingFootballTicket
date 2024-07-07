<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
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
                width: 50px;
                height: 50px;
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
        <jsp:include page="header.jsp" />
        <div>
            <img class="img-responsive img-fluid" src="images/banner/svd.jpg" alt="alt"/>
        </div>
        <div class="container-fluid">
            <div class="container mt-5">
                <!-- Trận Đấu Sắp Diễn Ra -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Trận Đấu Sắp Diễn Ra</h2>
                </div>
                <div class="row">
                    <c:forEach items="${getListMatches}" var="lm" varStatus="lmStatus">
                        <c:set var="m" value="${getMatches[lmStatus.index]}" />
                        <c:set var="s" value="${getAllseason[lmStatus.index]}" />
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <div>
                                        <small>TICKETS SOLD</small>
                                        <span><p>79</p></span>
                                    </div>
                                    <div>
                                        <i class="far fa-heart"></i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="team-logos">
                                        <img src="${lm.team1.img}" alt="${lm.team1.clubName}">
                                        <span>VS</span>
                                        <img src="${lm.team2.img}" alt="${lm.team2.clubName}">
                                    </div>
                                    <h5 class="card-title">Europa League Final Tickets</h5>
                                    <p class="card-text">Football Club A vs Football Club B</p>
                                    <p class="card-text">Mỹ Đình Stadium</p>
                                    <input type="datetime-local" value="${m.time}" readonly style="border: none; background: none">
                                    <p class="card-text">Europa League</p>
                                    <p class="card-text">Tickets from</p>
                                    <a href="matchDetail?matchId=${lm.matchId}" class="book-now-btn">Book now</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center mb-5">
                    <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="con_img">
                <img src="images/banner/b7834a87d1f84cf4aab912a3e48dde7f.jpg" alt="Ảnh của bạn">
                <div class="centered">
                    <h2>Nội dung chữ giữa ảnh</h2>
                </div>
            </div>

            <div class="container mt-5">
                <!-- Các Đội Bóng Nổi Bật -->
                <div class="section-header justify-content-center ">
                    <h2 class="mb-3">Các Đội Bóng Nổi Bật</h2>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 1">
                            <div class="card-body">
                                <h5 class="card-title">Team 1</h5>
                                <p class="card-text">Description of Team 1.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 2">
                            <div class="card-body">
                                <h5 class="card-title">Team 2</h5>
                                <p class="card-text">Description of Team 2.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 3">
                            <div class="card-body">
                                <h5 class="card-title">Team 3</h5>
                                <p class="card-text">Description of Team 3.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 4">
                            <div class="card-body">
                                <h5 class="card-title">Team 4</h5>
                                <p class="card-text">Description of Team 4.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mb-5">
                    <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="container mt-5">

                <!-- Các Tournament -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Các Giải Đấu</h2>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 1">
                            <div class="card-body">
                                <h5 class="card-title">Tournament 1</h5>
                                <p class="card-text">Description of Tournament 1.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 2">
                            <div class="card-body">
                                <h5 class="card-title">Tournament 2</h5>
                                <p class="card-text">Description of Tournament 2.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 3">
                            <div class="card-body">
                                <h5 class="card-title">Tournament 3</h5>
                                <p class="card-text">Description of Tournament 3.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 4">
                            <div class="card-body">
                                <h5 class="card-title">Tournament 4</h5>
                                <p class="card-text">Description of Tournament 4.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mb-5">
                    <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
                </div>
            </div>
            <div class="container mt-5">

                <!-- Tin Tức -->
                <div class="section-header justify-content-center">
                    <h2 class="mb-3">Tin Tức Mới Nhất</h2>

                </div>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 1">
                            <div class="card-body">
                                <h5 class="card-title">News 1</h5>
                                <p class="card-text">Description of News 1.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 2">
                            <div class="card-body">
                                <h5 class="card-title">News 2</h5>
                                <p class="card-text">Description of News 2.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 3">
                            <div class="card-body">
                                <h5 class="card-title">News 3</h5>
                                <p class="card-text">Description of News 3.</p>
                                <a href="#" class="btn btn-primary">Xem Thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mb-5">
                <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
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
                    toast.toast('hide')
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
                
            <% if (session.getAttribute("transResult") != null) { %>
            var transResult = <%= session.getAttribute("transResult") %>;
            if (transResult) {
                showToast('Thành công', 'Giao dịch thành công! Vui lòng kiểm tra Email để nhận mã QR!', 'success');
            } else {
                showToast('Thất bại', 'Giao dịch thất bại!', 'error');
            }
            setTimeout(function () {
                toast.toast('hide');
            }, 5000); // 3000 milliseconds = 3 seconds
            <% session.removeAttribute("transResult"); %>
        <% } %>      
            });
        </script>
    </body>
</html>
