<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <meta name="description" content="EduChamp : Education HTML Template" />
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <title>Booking Football Ticket </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="./assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="./assets/css/color/color-1.css">
        <style>
            body {
                font-family: 'Helvetica', sans-serif;
            }
            .title-head {
                font-family: 'Helvetica', sans-serif;
            }
            .title-under {
                font-family: 'Helvetica', sans-serif;
            }
            .btn {
                font-family: 'Helvetica', sans-serif;
            }

            .button-md {
                font-family: 'Helvetica', sans-serif;
            }

        </style>
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div class="account-form">
                <div class="account-head" style="background-image:url(./assets/images/background/bg2.jpg);">
                    <a href="index.html"><img src="./images/logo/FBT.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Đăng <span>Ký</span></h2>
                            <p>Đăng nhập tài khoản của bạn <a href="./login">Ở đây</a></p>
                            <p>Quay lại <a href="./homePage">Trang chủ</a></p>
                        </div>
                        <c:if test="${not empty errorMessage}">
                            <p style="color:red">${errorMessage}</p>
                        </c:if>
                        <form class="contact-bx" id="login-form" action="register" method="post" onsubmit="return checkcaptcha()">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label ${registerEmail != null ? "hidden" : ""}>Họ và Tên</label>
                                            <input value="${name}" class="form-control"
                                                   ${registerEmail != null ? "hidden" : ""}
                                                   name="name" id="name" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label for="email" class="form-label"
                                                   ${registerEmail != null ? "hidden" : ""}>Email</label>
                                            <input type="email" value="${email}" class="form-control"
                                                   ${registerEmail != null ? "hidden" : ""}
                                                   name="email" id="email" required>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${registerEmail != null}">
                                    <input type="text"
                                           class="form-control"
                                           hidden="true"
                                           value="${avatar}"
                                           name="avatar"/>
                                </c:if>
                                <input name="registerEmail" value="${registerEmail}" hidden="true"/>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                            <input type="text" value="${phone}" class="form-control"
                                                   name="phoneNumber" id="phoneNumber"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="password"
                                                   id="password" required>
                                            <label for="password" class="form-label">Mật khẩu</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="confirmPassword"
                                                   id="confirmPassword"
                                                   required>
                                            <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="" type="checkbox"
                                               value="terms-and-conditions" name="iAgree"
                                               id="iAgree" required>
                                        <label class="form-check-label text-secondary fs-5" for="iAgree" style="font-weight: 400;">
                                            Đồng ý với <a href="./term"
                                                              class="link-primary text-decoration-none text-info">
                                                điều khoản và điều lệ!
                                            </a>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <div class="g-recaptcha" data-sitekey="6LewHgEqAAAAAM2B3lhHY6yT54lRyRRTL2fwZLqV"></div>
                                    <div style="color: red" id="error"></div>
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Đăng ký</button>
                                </div>
                                <div class="col-lg-12">
                                    <h6 class="title-under">Đăng ký với</h6>
                                    <div class="d-flex">
                                        <a class="btn flex-fill m-r5 facebook" href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,email&client_id=2789778564531786&redirect_uri=http://localhost:8080/BookingFootballTicket/loginFB"><i class="fa fa-facebook"></i>Facebook</a>
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BookingFootballTicket/gmail&response_type=code&client_id=710226049781-g37fdin0lmq797dniqao07fsr27oj20j.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google"></i>Google</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script type="text/javascript">
            function checkcaptcha() {
                var form = document.getElementById("login-form");
                var error = document.getElementById("error");
                const response = grecaptcha.getResponse();
                if (response.length === 0) {
                    error.textContent = "Vui lòng xác thực nếu bạn không phải là người máy!";
                    return false; // Prevent form submission
                }
                return true; // Allow form submission
            }
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </body>
</html>
